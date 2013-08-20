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