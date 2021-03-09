require 'rails_helper'

RSpec.describe "challenges/new", type: :view do
  before(:each) do
    assign(:challenge, Challenge.new(
      user: nil
    ))
  end

  it "renders new challenge form" do
    render

    assert_select "form[action=?][method=?]", challenges_path, "post" do

      assert_select "input[name=?]", "challenge[user_id]"
    end
  end
end
