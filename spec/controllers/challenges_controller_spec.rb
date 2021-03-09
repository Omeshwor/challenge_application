require "rails_helper"

RSpec.describe ChallengesController do
  let(:user) { instance_double(User) }

  before { log_in(user) }
  describe "GET #index" do
    let(:challenges) { [ 
      instance_double(Challenge),
      instance_double(Challenge)
    ]}

    before do
      allow(user).to receive(:challenges).and_return(challenges)

      get :index
    end

    it "looks up all the challenges that current user created" do
      expect(assigns(:challenges)).to eq(challenges)
    end
    
  end
  
  
end
