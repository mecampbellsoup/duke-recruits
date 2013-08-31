class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2, :facebook, :linkedin, :foursquare]
  has_many :events
  has_many :comments
  has_many :authentications, dependent: :destroy
  has_many :companies, through: :events
  has_many :friendships
  has_many :friends, through: :friendships
  validates_presence_of :email

  def potential_friends
    # current_friend_ids = self.friendships.collect{|f| f.friend_id}  
    # current_user_id = self.id
    # not_in_friend_ids = [current_friend_ids, current_user_id].flatten.uniq
    User.where("id NOT IN (?)", existing_friend_ids)
  end

  def existing_friend_ids
    [self.friendships.collect{|f| f.friend_id}, self.id].flatten.uniq
  end


  def self.find_for_ouath(provider, access_token, resource=nil)
    user, email, name, uid, auth_attr = nil, nil, nil, {}
    case provider
    when "Facebook"
      uid = access_token['uid']
      email = access_token['extra']['raw_info']['email']
      name = access_token['info']['name']
      auth_attr = { :uid => uid, :token => access_token['credentials']['token'], :secret => nil, :name => name, :link => access_token['extra']['raw_info']['link'] }
    when 'LinkedIn'
      uid = access_token['uid']
      email = access_token['info']['email']
      name = access_token['info']['name']
      auth_attr = { :uid => uid, :token => access_token['credentials']['token'], :secret => nil, :name => name, :link => access_token['info']['urls']['public_profile'] }
    when 'Google'
      uid = access_token['uid']
      email = access_token['info']['email']
      name = access_token['info']['name']
      auth_attr = { :uid => uid, :token => access_token['credentials']['token'], :secret => nil, :name => name, :link => access_token['extra']['raw_info']['link'] }
    when 'Foursquare'
      uid = access_token['uid']
      email = access_token['info']['email']
      first_name = access_token['info']['first_name']
      last_name = access_token['info']['last_name']
      name = first_name + " " + last_name
      auth_attr = { :uid => uid, :token => access_token['credentials']['token'], :secret => nil, :name => name, :link => nil, :image => access_token['info']['image'] }
    else
      raise 'Provider #{provider} not handled'
    end
    if resource.nil?  #resource checks for current_user in omniauth controller
      if email
        user = User.find_for_oauth_by_email(email, name, resource)
      elsif uid && name
        user = User.find_for_oauth_by_uid(uid, resource)
        if user.nil?
          user = find_for_oauth_by_name(name, resource)
        end
      end
    else
      user = resource
    end
    
    auth = user.authentications.find_by_provider(provider) #rubymine traces dependencies?
    if auth.nil?
      auth = user.authentications.build(:provider => provider)
      user.authentications << auth
    end
    auth.update_attributes auth_attr
    return user
  end
 
  def self.find_for_oauth_by_uid(uid, resource=nil)
    user = nil
    if auth = Authentication.find_by_uid(uid.to_s)
      user = auth.user
    else
      user = User.new(email: email, name: name, password: Devise.friendly_token[0,20]) 
      user.save
    end
    return user
  end
   
  def self.find_for_oauth_by_email(email, name, resource=nil)
    if user = User.find_by_email(email)
      user
    else
      user = User.new(email: email, name: name, password: Devise.friendly_token[0,20]) 
      user.save
    end
    return user
  end
    
  def self.find_for_oauth_by_name(name, resource=nil)
    if user = User.find_by_name(name)
      user
    else
      user = User.new(:name => name, :password => Devise.friendly_token[0,20], :email => "#{UUIDTools::UUID.random_create}@host")
      user.save false
    end
    return user
  end   

end
 
