class Competitors < ApplicationRecord
  belongs_to :challenge
  has_many :users

end
