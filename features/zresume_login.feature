Feature: allow only admins to edit their own things
    As a school administrator
    I want job candidates to sign in before submitting a resume
    So that only serious candidates submit resumes

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 | 1   |
   
    Given the following resumes exist:
   | firstname   | lastname     | attachment     | job_id   |
   | Mathew      | Joseph       | haha.jpg       |     1    |

Scenario: must be logged in to upload resume
    Given candidates exist
    Given I am on the view open positions page
    And I follow "Teacher"
    And I follow "Submit Resume"
    Then I should see "Log in"
    And I fill in "Email" with "candidate@notadmin.com"
    And I fill in "Password" with "12345678"
    And I press "Log in"
    Then I should be on the guidelines page

Scenario: Not logged in
    Given I am on the school resumes page
    Then I should see "You must be logged in as a school administrator to view this page"
    


