Feature: be able to see school's website 

  As a job applicant
  So that I can see more information about the school thats listed
  I want a link to the school’s website (if they have one)

Background: jobs in database

    Given the following job openings exist:
        | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte |    
        | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 |  1  | 
        | Torrey Pines   | Math teacher    | This job rocks!          | 100,000          | 120,000          | 2018-10-20 |  1  | 
        | Carmel Valley  | English teacher |  Middle school is rough. | 87,000           | 98,000           | 2018-10-20 |  1  | 

Given the following users exist:
       | email                | password   | user_type | school       | address           |
       | mathew@jopeph.com    | admin123   | admin     |              |                   |
       | torrey@pines.com     | 12345678   | school    | Ashley Falls | meow Berkeley, CA | 

Scenario: visit school website
  Given I am on the view open positions page
  Then I should see "Ashley Falls"
  When I follow "Ashley Falls"
  Then I should see "Address"
  Then I should see "meow Berkeley, CA"

 

 
