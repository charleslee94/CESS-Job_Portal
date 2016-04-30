Feature: follow job links to application page
    As a job applicant
    I want to be led to the most direct way to apply for a job
    So that I can more easily and efficiently send in an application

Background: jobs in database

   Given the following job openings exist:
   | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte | created_at |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 | .5  | 2016-4-21  |

  Given the following users exist:
       | email                | password   | user_type | school       |
       | mathew@jopeph.com    | admin123   | admin     |              |
       | torrey@pines.com     | 12345678   | school    | Ashley Falls |
       
Scenario: follow link to job application page
  Given I am signed in with a user type "candidate"
  And I am on the view open positions page
  And I follow "Ashley Falls"
  Then I should see "Submit Resume"
  
Scenario: apply to a job
  Given I am signed in with a user type "candidate"
  And I am on the view open positions page
  And I follow "Ashley Falls"
  And I follow "Submit Resume"
  Then I should see "Submit resume for Teacher"
 
Scenario: edit and show
  Given I am on the view open positions page
  And I follow "Ashley Falls"
  Then I should see "Compensation Min"

Scenario: see job posting 
  Given I am on the view open positions page
  When I follow "Ashley Falls"
  Then I should see "Posted On"
  And I should see "Thursday, April 21, 2016"
