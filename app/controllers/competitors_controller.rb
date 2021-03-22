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
  
end
