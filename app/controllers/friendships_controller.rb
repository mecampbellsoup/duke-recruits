class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to user_profile_path(current_user)
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
  end

  def index
    @friends = current_user.potential_friends
  end
end
