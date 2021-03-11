class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many:challenges, dependent: :destroy
  has_many: friendships, dependent: :destroy
  has_many: friends, through: :friendship, dependent: :destroy
end
