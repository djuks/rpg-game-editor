Given(/^I have created several characters$/) do
  FactoryBot.create(:character,
                    :user => @registered_user,
                    :name => "Trol",
                    :description => "My first trol")
  FactoryBot.create(:character,
                    :user => @registered_user,
                    :name => "Wizzard",
                    :description => "My first wizzard")
end

When("I visit the my characters page") do
  visit user_path(@registered_user)

end

Then("I should see the list of my characters") do
  expect(page).to have_content("Trol")
  expect(page).to have_content("Wizzard")
end

When("I submit a new character") do
  click_on "New"
  fill_in "character_name", :with => "Golem"
  fill_in "character_description", :with => "My first golem"
  click_button "Create Character"
end

Then("I should see new character at my listing of characters") do
  visit user_path(@registered_user)
  expect(page).to have_content("Golem")
end

Given(/^I have created character$/) do
  FactoryBot.create(:character,
                    :user => @registered_user,
                    :name => "Golem",
                    :description => "My first Golem")
end

When("I edit character") do
  visit user_path(@registered_user)
  click_on "Golem"
  click_on "Edit Character"
  fill_in "character_name", :with => "Edited golem"
  fill_in "character_description", :with => "My edited golem"
  click_on "Update Character"
end


Then("I should see show character page with new data") do
  visit user_path(@registered_user)
  expect(page).to have_content("Edited golem")
  expect(page).to have_content("My edited golem")
end

When("I delete character") do
  visit user_path(@registered_user)
  click_on "Golem"
  click_on "Delete Character"
end

Then("I should not see character on My characters page") do
  visit user_path(@registered_user)
  expect(page).to_not have_content("Golem")
  expect(page).to_not have_content("My first golem")
end
