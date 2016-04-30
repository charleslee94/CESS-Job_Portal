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
       | email                | password   | user_type | school       |
       | mathew@jopeph.com    | admin123   | admin     |              |
       | torrey@pines.com     | 12345678   | school    | Ashley Falls |
   

Scenario: create a user login for a school
    Given I am signed in with a user type "admin"
    And I am on the admin page
    Then I should see "Admin Panel Signed in successfully"
    And I follow "Create a new school"
    And I fill in "Email" with "school@sc.com"
    And I fill in "Password" with "8characters"
    And I fill in "Password confirmation" with "8characters"
    And I fill in "School" with "Torrey Pines"
    And I press "Sign up"
    Then I should be on the view open positions page

Scenario: malformed user login
    Given I am signed in with a user type "admin"
    And I am on the admin page
    And I follow "Create a new school"
    And I fill in "Email" with "test@test.com"
    And I fill in "Password" with "short"
    And I fill in "Password confirmation" with "short"
    And I fill in "School" with "Torrey Pines"
    And I press "Sign up"
    Then I should be on the schools page
    Then I should see "Account not created!"

Scenario: I should not be able to see the admin panel if I am not logged in as an admin
    Given I am signed in with a user type "candidate"
    And I am on the admin page
    Then I should not see "Welcome to the admin panel!"
    And I should be on the view open positions page
    
Scenario: delete a posting 
    Given I am signed in with a user type "admin"
    And I am on the view open positions page
    And I follow "Ashley Falls"
    Then I should see "Destroy"
    And I follow "Destroy"
    Then I should see "successfully destroyed."
