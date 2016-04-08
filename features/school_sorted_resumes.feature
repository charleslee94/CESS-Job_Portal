Feature: admin of a school can only see its schools applications
    As a school admin
    I want to be able to see who applied to my school
    So that I can hire employees qualified for my school

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | summary                  | compensation_min | compensation_max | 
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          |
   | Ashley Falls 2  | Teacher 2      | I love my job!           | 80,000           | 100,000          |    
    
    Given the following resumes exist:
   | name            | attachment     | job_id   |
   | Joseph, Mathew  | haha.jpg       |     1    |
   | Holmes, Nathan  | test.pdf       |     2    |
   
   Given the following users exist:
   | name            | password    | school       |
   | mathewjopeph    | admin       | Ashley Falls | 

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