# Friendship.delete_all
# Competitor.delete_all
# Challenge.delete_all
# User.delete_all


def seed_users
  10.times do
    user = User.new(
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
    user.save
  end
end

def seed_challenges
  users = User.all
  
  users.each do |user|
    10.times do
      challenge = Challenge.new(
        user_id: user.id,
        title: Faker::Lorem.word,
        description: Faker::Lorem.sentence(word_count: 5),
        start_date: Faker::Time.between_dates(from: '2021/03/21', to: '2022/03/21'),
        end_date: Faker::Time.between_dates(from: '2021/04/21', to: '2022/04/21'),
        active: Faker::Boolean.boolean,
        goal: Faker::Number.within(range: 0.0..999.00)
      )
      challenge.save
    end
  end
end

def seed_competitor
  users = User.all
  challenges = Challenge.all

  challenges.each do |challenge|
    10.times do 
      challenge.competitors.build(user_id: Faker::Number.within(range: 1..users.size))
      challenge.save
    end
  end
end

def seed_friends
  users = User.all
  users.each do |user|
    5.times do
      friend = User.find(rand(1..users.size))
      Friendship.create!(user_id: user.id, friend_id: friend.id)
    end
  end
end

# def seed_challenge_details
#   @challenges = Challenge.all
#   @challenges.each do |challenge|
#     @users = @challenge.competitors.all


#   @challenges.each do |challenge|
#     challenge.user

# end


seed_users
seed_challenges
seed_competitor
seed_friends
# seed_challenge_details
