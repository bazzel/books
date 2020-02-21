Feature: Profile

  Scenario: Can edit profile
    Given I signed in as a Kabisaan
    When I choose "Profile" from the account menu
    Then I should be on my profile page

  @javascript
  Scenario: Exiting profile
    Given I signed in as a Kabisaan
    And I am on my profile page
    When I exit my profile page
    Then I should be back on the main page

  @wip
  Scenario: Edit a profile
    Given I signed in as a Kabisaan
    And I am on my profile page
    When I check "Post comments anonymously"
    And I click "Save"
    Then I should be back on the main page

  Scenario: Guest cannot access profile
