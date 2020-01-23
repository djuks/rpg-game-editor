Feature: Characters
  In order to be able to keep track of my character abilities
  As a user
  I should be able to keep an inventory of my characters abilities

Background:
  Given I am a registered user
  And I am logged in

Scenario: Listing all characters abilities that user has made
  Given I have created character with several abilities
  When I visit character Trol show page
  Then I should see the list of character abilities

Scenario: Editing character ability
  Given I have created character and ability
  When I edit character ability
  Then I should see show character page with new ability data

Scenario: Deleting character ability
  Given I have created character and ability
  When I delete character ability
  Then I should not see ability on character show page
