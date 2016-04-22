Feature: follow job links to application page
    As a job applicant
    I want to be led to the most direct way to apply for a job
    So that I can more easily and efficiently send in an application

Background: jobs in database

   Given the following job openings exist:
   | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte | created_at |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 | .5  | 2016-4-21       |

Scenario: follow link to job application page
  Given I am signed in with a user type "candidate"
  And I am on the view open positions page
  And I follow "Ashley Falls"
  Then I should see "Apply Here"
  
Scenario: apply to a job
  Given I am signed in with a user type "candidate"
  And I am on the view open positions page
  And I follow "Ashley Falls"
  And I follow "Apply Here"
  Then I should see "Apply for Teacher"
 
Scenario: edit and show
  Given I am on the view open positions page
  And I follow "Ashley Falls"
  Then I should see "Compensation min"

Scenario: see job posting 
  Given I am on the view open positions page
  When I follow "Ashley Falls"
  Then I should see "Date of Posting"
  And I should see "2016-4-21"
