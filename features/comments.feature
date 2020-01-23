Feature: Comments
  In order to be able to keep track of comments
  As a user
  I should be able to create comments for characters

Background:
  Given I am a registered user
  And I am logged in

Scenario: Listing all comments on character show page
  Given I have created character and comment
  When I visit character show page
  Then I should see my comment on character show page
