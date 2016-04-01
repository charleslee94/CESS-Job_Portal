Feature: job exipirations
    As a SFCESS applicant
    So that I don't apply to old or expired jobs
    I want jobs to be deleted once they are expired
    
    
Background:
    Given the following job openings exist:
      | school         | title           | summary                  | compensation_min | compensation_max | 
      | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          |
      | Torrey Pines   | Math teacher    | This job rocks!          | 100,000          | 110,000          |
    
Scenario: post an expired job
    Given I am on the post open positions page
    When I fill in "School" with "Gillispie"
    And  I fill in "Title" with "Pre-School"
    And I fill in "Summary" with "pre school is fun"
    And I fill in "Compensation min" with "60,000"
    And I fill in "Compensation max" with "70,000"
    And I select "2011" from "job_exipiration_1i"
    And  I press "Create Job"
    Then I should see "this job has expired"
    
Scenario: post a valid job
  Given I am on the post open positions page
    When I fill in "School" with "Gillispie"
    And  I fill in "Title" with "Pre-School"
    And I fill in "Summary" with "pre school is fun"
    And I fill in "Compensation min" with "60,000"
    And I fill in "Compensation max" with "70,000"
    And I select "2017" from "job_exipiration_1i"
    And  I press "Create Job"
    Then I should not see "this job has expired"