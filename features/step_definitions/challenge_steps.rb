Given('I have added several challenges') do
  FactoryBot.create(:challenge,
                    user: @registered_user,
                    title: "Book Reading",
                    description: "Read number of books in a month",
                    start_date: "03/10/2021",
                    end_date: "04/10/2021",
                    goal: 2,
                    active: true)
  FactoryBot.create(:challenge,
                    user: @registered_user,
                    title: "Fundraising",
                    description: "Fundraising for books",
                    start_date: "03/10/2021",
                    end_date: "04/10/2021",
                    goal: 200,
                    active: false)
end

Then('I should see the list of my challenges') do
  expect(page).to have_content("Book Reading")
  expect(page).to have_content("Fundraising")
end