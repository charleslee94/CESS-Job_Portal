Feature: follow job links to application page
    As a job applicant
    I want to be led to the most direct way to apply for a job
    So that I can more easily and efficiently send in an application

Background: jobs in database

   Given the following job openings exist:
   | school         | title           | summary                  | compensation_min | compensation_max | expiration |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 |

Scenario: follow link to job application page
  Given I am on the view open positions page
  And I follow "Ashley Falls"
  Then I should see "Apply Here"
  
Scenario: apply to a job
  Given I am on the view open positions page
  And I follow "Ashley Falls"
  And I follow "Apply Here"
  Then I should see "Apply for Teacher"
 
Scenario: edit and show
  Given I am on the view open positions page
  And I follow "Ashley Falls"
  And I follow "Edit"
  And I follow "Show"
  Then I should see "Compensation min"
