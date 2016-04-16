Feature: allow only admins to edit their own things
    As a job applicant
    I want to be able to easily upload my resume
    So that I can apply for a job

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte | id   | user_id |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 | 1   | 6000 |  6000   |
   
    Given the following resumes exist:
    | firstname   | lastname    | attachment     |   job_id      |
    | Mathew      | Joseph      | haha.jpg       |     6000      |
    
Scenario: upload resume sad
    Given I am signed in with a user type "candidate"
    Given I am on the view open positions page
    And I follow "Ashley Falls"
    And I follow "Apply Here"
    Then I should see "Apply for Teacher"
    And I press "Save"
    Then I should see "The upload failed"

Scenario: listing correct resume things on index
    Given I am signed in with a school name "Gillispie"
    And I am on the school resumes page
    Then I should see "Mathew"
    And I should see "Joseph"
    And I should see "Download Resume"
