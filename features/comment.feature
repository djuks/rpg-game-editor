Feature: Comments
  In order to be able to comment characters
  As a user
  I should be able to create, delete and update comments

Background:
  Given I am a registered user
  And I am logged in
  And I have created character
  And I visit character show page

Scenario: Listing all character comments
  When I create character comment
  Then I should see the list of character comments

Scenario: Edit character comment
  Given I create character comment
  When I edit character comment
  Then I should see the new data in character comment

Scenario: Delete character comment
  Given I create character comment
  When I delete character comment
  Then I should not see character comment
