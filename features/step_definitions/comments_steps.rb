Given("I have created character and comment") do
  FactoryBot.create(:character,
                    :user => @registered_user,
                    :name => "Trol",
                    :description => "My first trol")

  fill_in "comment_description", :with => "My first comment"
  click_on "Add comment"
end

When("I visit character show page") do
  visit user_path(@registered_user)
  click_on "Trol"
end

Then "I should see my comment on character show page" do
  expect(page).to have_content("My first comment")
end
