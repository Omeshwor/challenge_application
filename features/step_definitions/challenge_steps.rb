Given('I have added several challenges') do
  FactoryBot.create(:challenge,
                    user: @registered_user,
                    title: "Book Reading",
                    description: "Read number of books in a month",
                    start_date: "2021/03/02",
                    end_date: "2021/04/02",
                    goal: 2,
                    active: true)
  FactoryBot.create(:challenge,
                    user: @registered_user,
                    title: "Fundraising",
                    description: "Fundraising for books",
                    start_date: "2021/03/02",
                    end_date: "2021/04/02",
                    goal: 200,
                    active: false)
end

Then('I should see the list of my challenges') do
  expect(page).to have_content("Book Reading")
  expect(page).to have_content("Fundraising")
end


When('I submit a new challenge') do
  click_link "New Challenge"
  fill_in "challenge_title", with: "Pages of a book"
  fill_in "challenge_description", with: "Read no of pages of book a day"
  select_date('2021-03-02', from: "challenge_start_date")
  
  # select_date("challenge_start_date", :with => "03/01/2021")
  # select_date("challenge_start_date", :with => "1/1/2011")
  # select_date("2021-04-01", from: "challenge_end_date")
  fill_in "challenge_goal", with: "200"
  fill_in "challenge_active", with: "true"

  click_button "Create Challenge"
end

Then('I should see the new challenge in my challenges') do
  visit root_path
  expect(page).to have_content("Pages of a book")
  expect(page).to have_content("Read no of pages of book a day")
  expect(page).to have_content("03/01/2021")
  expect(page).to have_content("04/01/2021")
  expect(page).to have_content("200")
  expect(page).to have_content("true")
end