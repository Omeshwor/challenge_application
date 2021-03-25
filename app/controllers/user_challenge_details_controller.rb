class UserChallengeDetailsController < ApplicationController

  def create
    @user_details = UserChallengeDetail.new(user_challenge_details_params)
    @challenge = @user_details.competitor.challenge_id
    if @user_details.save
      flash.now[:success] = "Added successfully"
      redirect_to challenge_path(@challenge)
    else
      flash.now[:danger] = "Something went wrong"
      redirect_to challenge_path(@challenge)
    end
  end
  
  private
    def user_challenge_details_params
      params.require(:user_challenge_detail).permit(:competitor_id, :detail)
    end

end
