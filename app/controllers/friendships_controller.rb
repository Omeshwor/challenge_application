class FriendshipsController < ApplicationController

  def create
    friend = User.find(params[:friend])
    user_friend = current_user.friendships.build(friend_id: friend.id)
    if user_friend.save
      flash.now[:notice] = "#{friend.email} add to friend's list"
      redirect_to friendship_path(current_user)
    else
      flash.now[:danger] = "Something went wrong"
      redirect_to users_path
    end
  end

  def show
    @tracked_friends  = current_user.friends.order(:created_at)
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:alert] = "Friend removed successfully"
    redirect_to friendship_path(current_user)
  end

end
