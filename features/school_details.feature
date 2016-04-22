Feature: be able to see school's website 

  As a job applicant
  So that I can see more information about the school thats listed
  I want a link to the school’s website (if they have one)

Background: jobs in database

    Given the following job openings exist:
        | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte |    website                |
        | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 |  1  |  http://www.dmusd.org/af  |   
        | Torrey Pines   | Math teacher    | This job rocks!          | 100,000          | 120,000          | 2018-10-20 |  1  | http://tp.sduhsd.net/     |
        | Carmel Valley  | English teacher |  Middle school is rough. | 87,000           | 98,000           | 2018-10-20 |  1  |  http://cv.sduhsd.net/    |
        
Scenario: visit school website
  Given I am on the view open positions page
  Then I should see "Ashley Falls"
  When I follow "Ashley Falls"
  Then I should see "Website"
  When I click on link "http://www.dmusd.org/af"
  Then the page title should be "Ashley Falls School / Homepage"

 

 
