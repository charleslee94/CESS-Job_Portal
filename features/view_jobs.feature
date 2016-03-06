Feature: view available jobs

  As a job applicant
  I want to be led to the most direct way to apply for a job
  So that I can more easily and efficiently send in an application

Background: jobs in database

  Given the following job openings exist:
  | school name    | position        | compensation | posting_date |
  | Ashley Falls   | Teacher         | 80,000       |   2016-02-25 |
  | Torrey Pines   | Math teacher    | 100,000      |   2016-03-03 |
  | Carmel Valley  | English teacher |  87,000      |   1979-05-25 |

Scenario: view job openings
  Given I am on the view open positions page
  Then I should see "Ashley Falls"
  And I should see "Torrey Pines"
  And the position for "Torrey Pines" should be "Math teacher"
  And the compensation for "Ashley Falls" should be "80,000"
 