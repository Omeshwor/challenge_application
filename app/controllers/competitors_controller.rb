class CompetitorsController < ApplicationController
  
  def create
    @challenge = Challenge.find(params[:challenge])
    @challenge_competitor = @challenge.competitors.build(user_id: current_user.id)
    if @challenge_competitor.save
      flash[:success] = "Successfully joined #{@challenge.title}"
      redirect_to challenge_path(@challenge)
    else
      flash[:danger] = "Couldn't join this #{@challenge.title}"
      redirect_to challenge_path(@Challenge)
    end
  end

  def destroy
    @competitor = Competitor.find_by(user_id: params[:user], challenge_id: params[:challenge])
    @competitor.destroy
    flash[:success] = "Left challenge successfully"
    redirect_to challenges_path
  end
end
