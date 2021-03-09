require 'rails_helper'

RSpec.describe "challenges/index", type: :view do
  before(:each) do
    assign(:challenges, [
      Challenge.create!(
        user: nil
      ),
      Challenge.create!(
        user: nil
      )
    ])
  end

  it "renders a list of challenges" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
