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
   
   Given the following users exist:
       | email                | password   | user_type | school       |
       | mathew@jopeph.com    | admin123   | admin     |              |
       | torrey@pines.com     | 12345678   | school    | Ashley Falls |

Scenario: must be logged in to upload resume
    Given I am on the view open positions page
    And I follow "Teacher"
    And I should see "Submit Resume"
    And I follow "Submit Resume"
    Then I should see "Log in"
    When I follow "Sign up"
    And I fill in "Email" with "school@sc.com"
    And I fill in "Password" with "8characters"
    And I fill in "Password confirmation" with "8characters"
    And I press "Sign up"

    


