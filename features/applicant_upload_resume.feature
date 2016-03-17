Feature: allow regular users to upload their resumes
    As a job applicant
    I want to be able to easily upload my application
    So that I can apply for a job

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | summary                  | compensation_min | compensation_max | 
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          |


Scenario: upload my resume
    Given I am on the view open positions page
    And I follow "Ashley Falls"
    And I press "submit resume"
    And I attach the file "resume"
    And I press "submit"
    Then I should see "upload sucessful"

Scenario: cancel upload
    Given I am on the view open positions page
    And I follow "Ashley Falls"
    And I press "submit resume"
    And I press "cancel"
    Then I should see "upload failure"
