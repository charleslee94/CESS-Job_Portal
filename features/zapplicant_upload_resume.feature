Feature: allow only admins to edit their own things
    As a job applicant
    I want to be able to easily upload my resume
    So that I can apply for a job

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 | 1   |
   
    Given the following resumes exist:
    | firstname   | lastname    | attachment     | job_id   |
    | Mathew      | Joseph      | haha.jpg       |     1    |
    
Scenario: upload resume sad path
    Given this is pending
    Given I am on the view open positions page
    And I follow "I love my job"
    And I follow "Apply Here"
    And I should see "Log In"

Scenario: listing correct resume things on index
    Given this is pending
    Given I am on the resumes page
    Then I should see "Mathew"
    And I should see "Mat"
    And I follow "Back to Jobs"
    Then I should see "Ashley Falls"
