Given("I have created character Ashe and like it") do
  FactoryBot.create(:character,
                    :user => @registered_user,
                    :name => "Ashe",
                    :description => "My first Ashe")

  visit user_path(@registered_user)
  click_on "Ashe"
  find('.like-btn').click
end

When("I visit character Ashe show page") do
  visit user_path(@registered_user)
  click_on "Ashe"

end

Then("I should see my like count is one on character show page") do

  expect(page).to have_content("Likes: 1")
end
