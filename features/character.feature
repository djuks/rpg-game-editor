Feature: Characters
  In order to be able to keep track of my characters
  As a user
  I should be able to keep an inventory of my characters

Background:
  Given I am a registered user
  And I am logged in

Scenario: Listing all characters that user has made
  Given I have created several characters
  When I visit the my characters page
  Then I should see the list of my characters

Scenario: Adding a new character
  When I submit a new character
  Then I should see new character at my listing of characters

Scenario: Editing character
  Given I have created character
  When I edit character
  Then I should see show character page with new data

Scenario: Deleting character
  Given I have created character
  When I delete character
  Then I should not see character on My characters page
