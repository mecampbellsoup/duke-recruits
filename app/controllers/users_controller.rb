class UsersController < Devise::SessionsController
  before_action :authenticate_user!, only: :show
  layout 'application'

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
 
    respond_to do |format|
      if @user.update_attributes(user_params)
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to user_profile_path }
      else
        format.html { render :action => "edit" }
        @user.errors.full_messages.each do |msg|
          flash[:error] = msg
        end
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

end
