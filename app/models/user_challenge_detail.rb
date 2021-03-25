class UserChallengeDetail < ApplicationRecord
  belongs_to :challenge
  belongs_to :competitor
end
