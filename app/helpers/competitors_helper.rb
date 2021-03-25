module CompetitorsHelper
  def challenge_competitor?(challenge, user)
    challenge_competitor = Competitor.where(challenge_id: challenge, user_id: user)
    challenge_competitor.count == 0
  end

  def challenge_competitor(challenge, user)
    challenge_competitor = Competitor.where(challenge_id: challenge, user_id: user).first
  end

end


