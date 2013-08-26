class UsersController < Devise::SessionsController
  before_action :authenticate_user!, only: :show
  layout 'application'

  def show
    @user = User.find(params[:id])
  end
end
