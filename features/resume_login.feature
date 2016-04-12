Feature: allow only admins to edit their own things
    As a school administrator
    I want job candidates to sign in before submitting a resume
    So that only serious candidates submit resumes

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 | 1   |
   
    Given the following resumes exist:
   | name            | attachment     | job_id   |
   | Joseph, Mathew  | haha.jpg       |     1    |

Scenario: must be logged in to upload resume
    Given I am on the view open positions page
    And I follow "Teacher"
    And I follow "Apply Here"
    Then I should see "You must be logged in to complete this action."
    And I fill in "Email" with "school@sc.com"
    And I fill in "Password" with "8characters"
    And I fill in "Password confirmation" with "8characters"
    And I press "Sign Up"
    Then I should be on the resumes page
    


