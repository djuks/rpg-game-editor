Feature: Like
  In order to have like characters
  As a user
  I should be able to like or dislike character

Background:
  Given I am a registered user
  And I am logged in
  And I have created character
  And I visit character show page

Scenario: Like character
  When I like character
  Then I should see the likes count is one

Scenario: Dislike character
  Given I like character
  When I Dislike character
  Then I should see the likes count is zero
