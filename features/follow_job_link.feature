Feature: follow job links to application page
    As a job applicant
    I want to be led to the most direct way to apply for a job
    So that I can more easily and efficiently send in an application

Background: jobs in database

  Given the following job openings exist:
  | school name    | position        | compensation | posting_date |
  | Ashley Falls   | Teacher         | 80,000       |   2016-02-25 |
  | Torrey Pines   | Math teacher    | 100,000      |   2016-03-03 |
  | Carmel Valley  | English teacher |  87,000      |   1979-05-25 |

Scenario: follow link to job application page
  Given I am on the home page
  And I follow "Torrey Pines"
  Then I should see "Apply here"
  
  