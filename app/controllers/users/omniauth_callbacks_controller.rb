class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    oauthorize "Facebook"
  end
  
  def google_oauth2
    oauthorize "Google"
  end
  
  def linkedin
    oauthorize "LinkedIn"
  end


  # def all
  #   @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

  #   if @user.persisted?
  #     flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
  #     sign_in_and_redirect @user, :event => :authentication
  #   else
  #     session["devise.google_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end

  # def facebook
  #   @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

  #   if @user.persisted?
  #     sign_in_and_redirect @user, :event => :authentication
  #     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  #   else
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end

  # def linkedin
  #   @user = User.find_for_linkedin_oauth(request.env["omniauth.auth"], current_user)

  #   if @user.persisted?
  #     sign_in_and_redirect @user, :event => :authentication
  #     set_flash_message(:notice, :success, :kind => "LinkedIn") if is_navigational_format?
  #   else
  #     session["devise.linkedin_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end
  
  #alias_method [:google_oauth2, :facebook, :linkedin], :all

  private

  def oauthorize(kind)
    @user = User.find_for_ouath(kind, request.env["omniauth.auth"], current_user)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => kind
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.#{kind.downcase}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url 
    end
  end
end