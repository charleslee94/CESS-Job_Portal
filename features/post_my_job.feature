Feature: post job opening with static info

    As a school administrator
    So that I can save time with multiple applications
    I want the static info (job school info) to be preloaded after my first application.

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 |  1  |
   | Torrey Pines   | Math teacher    | This job rocks!          | 100,000          | 110,000          | 2018-10-20 |  .5 |

Scenario: static school info
    Given I am on the post open positions page
    And I am logged in as "torreypines@hotmail.com" with password "meowmix3"
    Then I should see "School" before "Torrey Pines" 
    And I should not see "Ashley Falls"
    
    


        


