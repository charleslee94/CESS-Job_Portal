Feature: post job opening

  As a school administrator
  I want to be able to post specific open job positions
  So that we can more effectively reach potential applicants

Scenario: post job opening
        Given I am on the post open positions page
        When I fill in "School" with "Gillispie"
        And  I fill in "Title" with "Pre-School"
        And I fill in "Summary" with "pre school is fun"
        And I fill in "Compensation min" with "60,000"
        And I fill in "Compensation max" with "70,000"
        And  I press "Create Job"
        Then I should see "Job was successfully created."
        And I follow "Back"
        Then I should see "Gillispie" 
        And the title for "Gillispie" should be "Pre-School"
  
