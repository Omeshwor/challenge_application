class Competitor < ApplicationRecord
  belongs_to :challenge
  has_many :user_challenge_details, through: :challenge, dependent: :destroy
end
