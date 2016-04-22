
Feature: home page guidelines
    As a SFCESS member
    I want job seekers to read and understand our purpose and desire for social justice
    So that they understand what their job will entail at one of the schools before applying
    
Background:
    Given the following job openings exist:
   | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 | .75 |
    
Scenario: visiting the portal for the first time
  Given I am on the home page
  Then I should not see "Apply Here" 
  And I should see "Mission and Values" 
  When I follow "Candidates: View Job Postings"
  And I am signed in with a user type "candidate"
  And I follow "Candidates: View Job Postings"
  When I follow "Ashley Falls"
  Then I should see "Apply Here"
  And I should not see "SFCESS Guidelines"

Scenario: visiting the portal for the second time
  Given I am on the guidelines page
  Then I should not see "Apply Here" 
  And I should see "Mission and Values" 
  When I follow "Candidates: View Job Postings"
  And I am signed in with a user type "candidate"
  And I follow "Candidates: View Job Postings"
  When I follow "Ashley Falls"
  Then I should see "Apply Here"
  And I should not see "SFCESS Guidelines"

# Iteration 3-1 tests #

Scenario: there should be two links on the guideline page
  Given I am on the guidelines page
  Then I should see "Candidates: View Job Postings"
  And I should see "SFCESS School Sign In"
  
Scenario: Being a candidate displays the correct buttons
  Given I am signed in with a user type "candidate"
  Given I am on the guidelines page
  Then I should see "Candidates: View Job Postings"
  And I should see "Sign Out"

Scenario: Being a school displays the correct buttons
  Given I am signed in with a user type "school"
  Given I am on the guidelines page
  Then I should see "View Job Postings"
  And I should see "Sign Out"

Scenario: Being an admin displays the correct buttons
  Given I am signed in with a user type "admin"
  Given I am on the guidelines page
  Then I should see "View Job Postings"
  And I should see "Admin Panel"
  And I should see "Sign Out"