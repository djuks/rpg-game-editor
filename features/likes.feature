Feature: Likes
  In order to be able to keep track of likes
  As a user
  I should be able to like characters

Background:
  Given I am a registered user
  And I am logged in

Scenario: Listing all likes on character show page
  Given I have created character Ashe
  And I visit character Ashe show page
  When I like character Ashe
  Then I should see my like count is one on character show page
