Feature: Abilities
  In order to have character abilities
  As a user
  I should be able to create, edit and delete character abilities

Background:
  Given I am a registered user
  And I am logged in
  And I have created character
  And I visit character show page

Scenario: Listing all characters abilities
  When I create character ability
  Then I should see the list of character abilities

Scenario: Edit character ability
  Given I create character ability
  When I edit character ability
  Then I should see the new data in character ability

Scenario: Delete character ability
  Given I create character ability
  When I delete character ability
  Then I should not see character ability
