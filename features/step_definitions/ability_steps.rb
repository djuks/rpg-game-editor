Given("I have created character with several abilities") do
  FactoryBot.create(:character,
                    :user => @registered_user,
                    :name => "Trol",
                    :description => "My first trol")

  visit user_path(@registered_user)
  click_on "Trol"
  click_on "New Ability"
  fill_in "ability_name", :with => "Power"
  fill_in "ability_value", :with => "10"
  click_on "Create Ability"
  click_on "New Ability"
  fill_in "ability_name", :with => "Speed"
  fill_in "ability_value", :with => "15"
  click_on "Create Ability"
end

When("I visit character Trol show page") do
  visit user_path(@registered_user)
  click_on "Trol"
end

Then("I should see the list of character abilities") do
  visit user_path(@registered_user)
  click_on "Trol"
  expect(page).to have_content("Power: 10")
  expect(page).to have_content("Speed: 15")
end

Given("I have created character and ability") do
  FactoryBot.create(:character,
                    :user => @registered_user,
                    :name => "Golem",
                    :description => "My first golem")

  visit user_path(@registered_user)
  click_on "Golem"
  click_on "New Ability"
  fill_in "ability_name", :with => "Power"
  fill_in "ability_value", :with => "10"
  click_on "Create Ability"
end


When("I edit character ability") do
  visit user_path(@registered_user)
  click_on "Golem"
  click_on "Modify"
  fill_in "ability_name", :with => "Speed"
  fill_in "ability_value", :with => "15"
  click_on "Update Ability"
end

Then("I should see show character page with new ability data") do
  visit user_path(@registered_user)
  click_on "Golem"
  expect(page).to have_content("Speed: 15")
end

When("I delete character ability") do
  visit user_path(@registered_user)
  click_on "Golem"
  click_on "Destroy"
end

Then("I should not see ability on character show page") do
  visit user_path(@registered_user)
  click_on "Golem"
  expect(page).to_not have_content("Speed: 15")
end
