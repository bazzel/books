Feature:
  As a Kabisaan
  I can log in
  so I can do authorized tasks

  Scenario: Show the sign up page
    Given I open the application
    When I click the "Sign in" button
    Then I see the sign in page

  Scenario: Sign in with a valid email address
    Given I am on the Sign in page
    And I fill in "Email" with "john.doe@kabisa.nl"
    And I click "Sign in"
    Then "john.doe@kabisa.nl" should receive an email
    And I see a page with instructions for "john.doe@kabisa.nl" how to login

  Scenario: Sign in with valid url
    Given I sign up with my email address "john.doe@kabisa.nl"
    When I use the magic link
    Then I'm in

  Scenario: Sign out
    Given I signed in with my email address "john.doe@kabisa.nl"
    When I sign out
    Then I'm out

  @todo
  Scenario: Sign up with invalid email address

  @todo
  Scenario: Sign in with invalid url

  @todo
  Scenario: Sign in with expired valid url
