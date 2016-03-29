Feature: Pre-loaded default info
    As a SFCESs member
    So that I can save time with multiple applications
    I want the static info (job school info) to be preloaded after my first application.
    
Background:
  
Scenario:
    Given I am on the post open positions page
    When I fill in "School" with "Gillispie"
    And  I fill in "Title" with "Pre-School"
    And I fill in "Summary" with "pre school is fun"
    And I fill in "Compensation min" with "60,000"
    And I fill in "Compensation max" with "70,000"
    And  I press "Create Job"
    When I click on "new job"
    Then I should see "Gillispie"