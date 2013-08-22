class UsersController < Devise::SessionsController
  before_action :authenticate_user!
  layout 'application'

  def show
    @user = User.find(params[:id])
  end
end
