Feature: allow only admins to edit their own things
    As a job applicant
    I want to be able to easily upload my resume
    So that I can apply for a job

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | summary                  | compensation_min | compensation_max | 
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          |


Scenario: create a user login for a school
    Given I am on the admin panel
    And I follow "Create new user"
    And I fill in "username" with "matt"
    And I fill in "password" with "joseph"
    And I fill in "school" with "haas"
    Then I press "Submit"
    Then I should see "User created"

Scenario: cancel upload
    Given I am on the view open positions page
    And I follow "Ashley Falls"
    And I press "submit resume"
    And I press "cancel"
    Then I should see "upload failure"