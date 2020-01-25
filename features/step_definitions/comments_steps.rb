Given("I have created character and comment") do
  FactoryBot.create(:character,
                    :user => @registered_user,
                    :name => "Wizzard",
                    :description => "My first wizzard")

  visit user_path(@registered_user)
  click_on "Wizzard"
  click_on "New Comment"
  fill_in "comment_description", :with => "My first comment"
  click_on "Submit Comment"
end

When("I visit character Wizzard show page") do
  visit user_path(@registered_user)
  click_on "Wizzard"
end

Then "I should see my comment on character show page" do
  expect(page).to have_content("My first comment")
end
