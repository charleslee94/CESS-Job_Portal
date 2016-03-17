
Feature: home page guidelines
    As a SFCESS member
    So that our job postings are up to date
    I want job seekers to be able to delete jobs that are already filled
    
    
Background:
    Given the following job openings exist:
      | school         | title           | summary                  | compensation_min | compensation_max | 
      | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          |
    
Scenario: visiting the portal for the first time
  Given I am on the home page
  And I follow "Ashley Falls"
  Then I follow "delete"
  Then I see "Job successfully deleted"
  