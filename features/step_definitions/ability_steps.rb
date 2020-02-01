Given("I visit character show page") do
  visit character_path(@character)
end

When("I create character ability") do
  click_on "New Ability"
  fill_in "ability_name", :with => "Speed"
  fill_in "ability_value", :with => 2
  click_button "Create Ability"
end

Then("I should see the list of character abilities") do
  expect(page).to have_content("Speed: 2")
end

When("I edit character ability") do
  click_on "Modify"
  fill_in "ability_name", :with => "Power"
  fill_in "ability_value", :with => 10
  click_button "Update Ability"
end

Then("I should see the new data in character ability") do
  expect(page).to have_content("Power: 10")
end

When("I delete character ability") do
  click_on "Destroy"
end

Then("I should not see character ability") do
  expect(page).not_to have_content("Power: 10")
end
