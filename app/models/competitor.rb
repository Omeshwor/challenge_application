class Competitor < ApplicationRecord
  belongs_to :challenge
  has_many :user_challenge_details, dependent: :destroy
end
