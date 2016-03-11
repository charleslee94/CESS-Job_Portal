Feature: post job opening

  As a school administrator
  I want to be able to post specific open job positions
  So that we can more effectively reach potential applicants

Scenario: post job opening
  Given I am on the post open positions page
  When I fill in "School" with "Ashley Falls"
  And  I fill in "Title" with "Teacher"
  And  I press "Post Job Opening"
  Then I should see "Ashley Falls" on the open positions page
  And the open position for "Ashley Falls" should be "Teacher"
  