When("I create character comment") do
  click_on "New Comment"
  fill_in "comment_description", :with => "My first comment"
  click_on "Submit Comment"
end

Then("I should see the list of character comments") do
  expect(page).to have_content("My first comment")
end

When("I edit character comment") do
  click_on "Edit Comment"
  fill_in "comment_description", :with => "My edited comment"
  click_on "Submit Comment"
end

Then("I should see the new data in character comment") do
  expect(page).to have_content("My edited comment")
end

When("I delete character comment") do
  click_on "Delete Comment"
end

Then("I should not see character comment") do
  expect(page).not_to have_content("My edited comment")
end
