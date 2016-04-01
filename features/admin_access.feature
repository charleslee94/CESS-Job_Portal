Feature: admin access
    As a SFCESS member
    So that our job postings are secure
    I don't want anyone else to be able to edit or delete my posts.
    
    
Background:
    Given the following job openings exist:
      | school         | title           | summary                  | compensation_min | compensation_max | 
      | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 
      | Torrey Pines   | Math teacher    | This job rocks!          | 100,000          | 110,000          | 
    
Scenario: visiting the portal for the first time
  Given I am on the home page
  And I am logged in as "Torrey Pines"
  And I follow "Ashley Falls"
  Then I follow "delete"
  Then I see "Error: you do not have access to this job posting"
  And I follow "Torrey Pines"
  Then I follow "delete"
  Then I see "job successfully deleted"