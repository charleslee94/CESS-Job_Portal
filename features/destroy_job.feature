
Feature: home page guidelines
    As a SFCESS member
    I want job seekers to read and understand our purpose and desire for social justice
    So that they understand what their job will entail at one of the schools before applying
    
Background:
    Given the following job openings exist:
      | school         | title           | summary                  | compensation_min | compensation_max | 
      | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          |
    
Scenario: visiting the portal for the first time
  Given I am on the home page
  Then I should not see "Apply Here" 
  And I should see "SF-CESS" 
  When I follow "Look at job postings"
  When I follow "Show"
  Then I should see "Apply Here"
  And I should not see "SFCESS Guidelines"
