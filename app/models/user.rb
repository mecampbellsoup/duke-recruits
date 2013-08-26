class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2, :facebook, :linkedin]
  has_many :events
  has_many :comments
  has_many :authentications, dependent: :destroy
  has_many :companies, through: :events

  def self.find_for_ouath(provider, access_token, resource=nil)
    user, email, name, uid, auth_attr = nil, nil, nil, {}
    case provider
    when "Facebook"
      uid = access_token['uid']
      email = access_token['extra']['raw_info']['email']
      auth_attr = { :uid => uid, :token => access_token['credentials']['token'], :secret => nil, :name => access_token['info']['name'], :link => access_token['extra']['raw_info']['link'] }
      binding.pry
    when 'LinkedIn'
      uid = access_token['uid']
      email = access_token['info']['email']
      name = access_token['info']['name']
      auth_attr = { :uid => uid, :token => access_token['credentials']['token'], :secret => nil, :name => name, :link => access_token['info']['urls']['public_profile'] }
      binding.pry
    when 'Google'
      uid = access_token['uid']
      email = access_token['info']['email']
      name = access_token['info']['name']
      auth_attr = { :uid => uid, :token => access_token['credentials']['token'], :secret => nil, :name => name, :link => access_token['extra']['raw_info']['link'] }
      binding.pry
    else 
      raise 'Provider #{provider} not handled'
    end
    if resource.nil?  #resource checks for current_user in omniauth controller
      binding.pry
      if email
        user = User.find_for_oauth_by_email(email, name, resource)
        binding.pry
      elsif uid && name
        user = User.find_for_oauth_by_uid(uid, resource)
        binding.pry
        if user.nil?
          user = find_for_oauth_by_name(name, resource)
          binding.pry
        end
      end
    else
      binding.pry
      user = resource
    end
    
    auth = user.authentications.find_by_provider(provider) #rubymine traces dependencies?
    if auth.nil?
      binding.pry
      auth = user.authentications.build(:provider => provider)
      user.authentications << auth
    end
    auth.update_attributes auth_attr
    binding.pry
    return user
  end
 
  def self.find_for_oauth_by_uid(uid, resource=nil)
    user = nil
    binding.pry
    if auth = Authentication.find_by_uid(uid.to_s)
      user = auth.user
    end
    return user
  end
   
  def self.find_for_oauth_by_email(email, name, resource=nil)
    binding.pry
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
      binding.pry
      user
    else
      binding.pry
      user = User.new(:name => name, :password => Devise.friendly_token[0,20], :email => "#{UUIDTools::UUID.random_create}@host")
      user.save false
      binding.pry
    end
    return user
  end   

end
 