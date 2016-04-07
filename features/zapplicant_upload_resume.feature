Feature: allow only admins to edit their own things
    As a job applicant
    I want to be able to easily upload my resume
    So that I can apply for a job

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | summary                  | compensation_min | compensation_max | 
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          |
   
    Given the following resumes exist:
   | name            | attachment     | job_id   |
   | Joseph, Mathew  | haha.jpg       |     1   |

Scenario: upload resume sad path
    Given I am on the view open positions page
    And I follow "Teacher"
    And I follow "Apply Here"
    And I press "Save"
    Then I should see "The upload failed"

Scenario: listing correct resume things on index
    Given I am on the resumes page
    Then I should see "Joseph, Mathew"
    And I should see "Mat"
    And I follow "Back to Jobs"
    Then I should see "Ashley Falls"