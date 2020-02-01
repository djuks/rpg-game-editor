When("I like character") do
  find('.like-button').click
end

Then("I should see the likes count is one") do
  expect(page).to have_content("Likes: 1")
end

When("I Dislike character") do
  find('.like-button').click
end

Then("I should see the likes count is zero") do
  expect(page).to have_content("Likes: 0")
end
