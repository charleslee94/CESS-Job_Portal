Feature: allow only admins to edit their own things
    As a job applicant
    I want to be able to easily upload my resume
    So that I can apply for a job

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 | 1   |
   | Ashley Falls 2  | Teacher 2      | I love my job!           | 80,000           | 100,000          | 2018-10-20 | .5  |
    
    Given the following resumes exist:
   | firstname   | lastname         | attachment     | job_id   |
   | Mathew      | Joseph           | haha.jpg       |     1    |
   | Nathan      | Holmes           | test.pdf       |     2    |
   
   Given the following users exist:
   | email                | password   | school       | user_type |
   | mathew@jopeph.com    | admin123   | Ashley Falls | school    |

Scenario: create a user login for a school
    Given I am on the homepage
    And I follow "SFCESS School Sign In"
    And I follow "Sign up"
    And I fill in "Email" with "school@sc.com"
    And I fill in "Password" with "8characters"
    And I fill in "Password confirmation" with "8characters"
    And I press "Sign up"
    Then I should be on the guidelines page

Scenario: malformed user login
    Given I am on the homepage
    And I follow "SFCESS School Sign In"
    And I follow "Sign up"
    And I fill in "Email" with "test@test.com"
    And I fill in "Password" with "short"
    And I fill in "Password confirmation" with "short"
    And I press "Sign up"
    Then I should see "too short"

Scenario: delete a posting
    Given I am logged in as "mathew@joseph.com" with password "admin123"
    And I am on the homepage
    And I follow "Candidates: View Job Postings"
    Then I should see "Ashley Falls"
    And I follow "Ashley Falls"
    Then I should see "Destroy"
    And I click "Destroy"
    Then I should see "successfully destroyed."
    
# Iteration 3-1 test #

Scenario: Login and see only school resumes
    Given I am logged in as "mathew@joseph.com" with password "admin123"
    And I am on the homepage
    And I follow "Candidates: View Job Postings"
    And I click "View Submitted Resumes"
    Then I should see "Joseph"
    And I should not see "Holmes"

Scenario: Not logged in
    Given I am on the view open positions page
    And I follow "Ashley Falls"
    And I follow "Submit Resume"
    Then I should see "Log in"

Scenario: Login with incorrect password
    Given I am logged in as "mathewjoseph" with password "notadmin"
    Then I should not see "Guidelines"
