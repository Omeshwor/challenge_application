require 'rails_helper'

RSpec.describe "challenges/show", type: :view do
  before(:each) do
    @challenge = assign(:challenge, Challenge.create!(
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
