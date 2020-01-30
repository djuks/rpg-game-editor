Given("I have created character Ashe") do
  FactoryBot.create(:character,
                    :user => @registered_user,
                    :name => "Ashe",
                    :description => "My first Ashe")
end

Given("I visit character Ashe show page") do
  visit user_path(@registered_user)
  click_on "Ashe"
end

When("I like character Ashe") do
  find('.like-btn').click
end

Then("I should see my like count is one on character show page") do
  expect(page).to have_content("Likes: 1")
end
