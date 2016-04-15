Feature: job expirations
    As a SFCESS applicant
    So that I don't apply to old or expired jobs
    I want jobs to be deleted once they are expired
    
    
Background:
    Given the following job openings exist:
   | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 | 1   |
   | Ashley Falls 2  | Teacher 2      | I love my job!           | 80,000           | 100,000          | 2018-10-20 | .5  |
    
Scenario: post an expired job
  Given this is pending
    Given I am signed in
    Given I am on the post open positions page
    And  I fill in "Title" with "Pre-School"
    And I fill in "Job description" with "pre school is fun"
    And I fill in "Compensation min" with "60,000"
    And I fill in "Compensation max" with "70,000"
    And I fill in "Fte" with "1"
    And I select "2011" from "job_expiration_1i"
    And  I press "Create Job"
    Then I should see "this job has expired"
    
Scenario: post a valid job
  Given I am on the post open positions page
  Given this is pending
    And  I fill in "Title" with "Pre-School"
    And I fill in "Job description" with "pre school is fun"
    And I fill in "Compensation min" with "60,000"
    And I fill in "Compensation max" with "70,000"
    And I fill in "Fte" with "1"
    And I select "2017" from "job_expiration_1i"
    And  I press "Create Job"
    Then I should not see "this job has expired"