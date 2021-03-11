require "rails_helper"

RSpec.describe ChallengesController, type: :controller do
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

  describe "POST challenges#create" do    
    let(:challenge) {FactoryBot.build_stubbed(:challenge)}

    let(:params){ { title: "Fundraising", description: "Fundraising for books",  start_date: "2021-03-02",  end_date: "2021/04/02",  goal: 200,  active: false } }
    before do
      allow(challenge).to receive(:save)
      allow(user).to receive_message_chain(:challenges, :build).and_return(challenge)
    end

    it "saves the challenge" do
      post :create, params: { challenge: params }
      expect(challenge).to have_received(:save)
    end

    context "when the challenge is successfully saved" do
      before do
        allow(challenge).to receive(:save).and_return true
  
        post :create, :params => { :challenge => params }    
      end
  
      it "redirects to the challenge show page" do
        expect(response).to redirect_to challenge_path(challenge)
      end
  
      it "redirects to challenge show page" do
        expect(flash[:notice]).to eq("Challenge was successfully created.")
      end
    end
    
    context "when the challenge can't be save" do
      before do
        allow(challenge).to receive(:save).and_return(false)
        post :create, params: { :challenge => params }
      end

      it "redirects back to challenge new page" do
        expect(response).to render_template(:new)
      end
    end

  end


  describe "PATCH challenge#update" do
    let(:challenge) {FactoryBot.build_stubbed(:challenge)}
    
    before do
      allow(Challenge).to receive(:find).and_return(challenge)
      allow(challenge).to receive(:update).and_return(true)
    end

    it "updates the book" do
      patch :update, :params => { id: challenge.id, challenge: {title: "New Title", description: "Fundraising for books",  start_date: "2021-03-02",  end_date: "2021/04/02",  goal: 200,  active: false }}
      expect(challenge).to have_received(:update)
    end

    context "when the update succeeds" do
      it "redirects to the challenge page" do
        patch :update, :params => { id: challenge.id, challenge: {title: "New Title", description: "Fundraising for books",  start_date: "2021-03-02",  end_date: "2021/04/02",  goal: 200,  active: false }}
        expect(response).to redirect_to challenge_path(challenge)
      end
    end

    context "when the update fails" do
      before do
        allow(challenge).to receive(:update).and_return(false)
      end
      it "redirects to the challenge edit page again" do
        patch :update, :params => { id: challenge.id, challenge: {title: "New Title", description: "Fundraising for books",  start_date: "2021-03-02",  end_date: "2021/04/02",  goal: 200,  active: false }}

        expect(response).to render_template(:edit)
      end
    end
    

  end
  
end
