class UserChallengeDetailsController < ApplicationController

  def create
    @challenge = Challenge.find(params[:challenge])
    @user_challenge_detail = @challenge.user_challenge_details.build(user_id: current_user, detail: params[:detail])
    if @user_challenge_detail.save
      flash[:success] = "Successfully added the detail"
      redirect_to challenge_path(@challenge)
    else
      flash[:danger] = "Couldn't add the detail"
      redirect_to challenge_path(@chllenge)
    end
  end


end
