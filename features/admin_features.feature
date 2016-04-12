Feature: allow only admins to edit their own things
    As a job applicant
    I want to be able to easily upload my resume
    So that I can apply for a job

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | summary                  | compensation_min | compensation_max | expiration
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20
   | Ashley Falls 2  | Teacher 2      | I love my job!           | 80,000           | 100,000          | 2018-10-20
    
    Given the following resumes exist:
   | name            | attachment     | job_id   |
   | Joseph, Mathew  | haha.jpg       |     1    |
   | Holmes, Nathan  | test.pdf       |     2    |
   
   Given the following users exist:
   | name            | password    | school       |
   | mathewjopeph    | admin       | Ashley Falls | 

Scenario: create a user login for a school
    Given I am the admin
    And I follow "Sign In"
    And I follow "Sign up"
    And I fill in "Email" with "school@sc.com"
    And I fill in "Password" with "8characters"
    And I fill in "Password confirmation" with "8characters"
    And I press "Sign up"
    Then I should be on the guidelines page

Scenario: malformed user login
    Given I am the admin
    And I follow "Sign In"
    And I follow "Sign up"
    And I fill in "Email" with "test@test.com"
    And I fill in "Password" with "short"
    And I fill in "Password confirmation" with "short"
    And I press "Sign up"
    Then I should see "too short"

Scenario: delete a posting 
    Given I am the admin 
    And I follow "Ashley Falls"
    Then I should see "Destroy"
    And I follow "Destroy"
    Then I should see "successfully destroyed."
    
# Iteration 3-1 test #

Scenario: Login and see only school resumes
    Given I log in as "mathewjoseph" with the password "admin"
    And I am on the resumes page
    Then I should see "Joseph, Mathew"
    And I should not see "Holmes, Nathan"

Scenario: Not logged in
    Given I am on the resumes page
    Then I should see "Please log in"

Scenario: Login with incorrect password
    Given I log in as "mathewjoseph" with the password "notadmin"
    Then I should see "Invalid credentials"
