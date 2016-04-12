
Feature: home page guidelines
    As a SFCESS member
    I want job seekers to read and understand our purpose and desire for social justice
    So that they understand what their job will entail at one of the schools before applying
    
Background:
    Given the following job openings exist:
   | school         | title           | summary                  | compensation_min | compensation_max | expiration |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 |
    
Scenario: visiting the portal for the first time
  Given I am on the home page
  Then I should not see "Apply Here" 
  And I should see "Mission and Values" 
  When I follow "Look at job postings"
  When I follow "Ashley Falls"
  Then I should see "Apply Here"
  And I should not see "SFCESS Guidelines"

Scenario: visiting the portal for the second time
  Given I am on the guidelines page
  Then I should not see "Apply Here" 
  And I should see "Mission and Values" 
  When I follow "Look at job postings"
  When I follow "Ashley Falls"
  Then I should see "Apply Here"
  And I should not see "SFCESS Guidelines"

# Iteration 3-1 tests #

Scenario: there should be two links on the guideline page
  Given I am on the guidelines page
  Then I should see "Candidates: click here to see job postings"
  And I should see "SFCESS Schools: login to post a job"
  