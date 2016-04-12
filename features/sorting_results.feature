Feature: Sort results
    As a job seeker 
    So that i can more easily search 
    I want to be able to look at the jobs in different orders (school/date/job/etc)
    
Background: jobs in database

   Given the following job openings exist:
        | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte |
        | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 |  1  |        
        | Torrey Pines   | Math teacher    | This job rocks!          | 100,000          | 120,000          | 2018-10-20 |  .5 |    
        | Carmel Valley  | English teacher |  Middle school is rough. | 87,000           | 98,000           | 2018-10-20 | .75 | 

Scenario: change result view
  Given I am on the view open positions page
  And I follow "School"
  Then I should see "Ashley Falls" before "Torrey Pines"
  When I follow "Title"
  Then I should see "English teacher" before "Math teacher"
  Then I should see "Math teacher" before "Teacher"
  