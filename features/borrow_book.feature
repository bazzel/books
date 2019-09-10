Feature: As a Kabisaan
  I want to borrow a printed book
  So I can read it

  @javascript
  Scenario: Show `Borrow` button
    Given I signed in as a Kabisaan
    And the following locations:
      | city     |
      | Rome     |
    And I have the following printed book:
      | title       | location | copies |
      | Lorem Ipsum | Rome     | 1      |
    When I choose "Books" from the navigation drawer
    Then I can borrow "Lorem Ipsum"

  @wip
  @javascript
  Scenario: Borrow a book
    Given I signed in as a Kabisaan
    And the following locations:
      | city     |
      | Rome     |
    And I have the following printed book:
      | title       | location | copies |
      | Lorem Ipsum | Rome     | 1      |
    When I choose "Books" from the navigation drawer
    And I borrow the book "Lorem Ipsum"
    Then I see the book "Lorem Ipsum" has 0 copies left
    And I cannot borrow "Lorem Ipsum"
    But I can return the book "Lorem Ipsum"

  @todo
  Scenario: Show dialog when multiple copies

  @todo
  Scenario: Unable to borrow if all copies are gone

  @todo
  Scenario: Guests cannot borrow books

  Scenario: Undo a borrow action