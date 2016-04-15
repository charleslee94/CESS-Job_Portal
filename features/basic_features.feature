Feature: follow job links to application page
    As a job applicant
    I want to be led to the most direct way to apply for a job
    So that I can more easily and efficiently send in an application

Background: jobs in database

   Given the following users exist:
   | email                 | password        | school                     | user_type        | id |
   | school1@school.com    | mattmatt        | Ashley Falls               | school           | 1000  |
   
   Given the following job openings exist with a user:
   | school | title           | job_description          | compensation_min | compensation_max | expiration | fte    | user_id    |       
   | Ashley Falls    | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 | 1   | 1000        |

Scenario: follow link to job application page
  Given I am on the view open positions page
  Then I should see "Ashley Falls"
 