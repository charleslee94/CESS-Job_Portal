Feature: edit/delete/view only my own school's jobs

    As a school administrator
    So that only I can edit and delete my own job postings
    I want to only see my own job postings when I log in

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | summary                  | compensation_min | compensation_max | 
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          |
   | Torrey Pines   | Math teacher    | This job rocks!          | 100,000          | 110,000          |

Scenario: only view and destroy my own postings
    Given I am on the view open positions page
    And I am logged in as "torreypines@hotmail.com" with password "meowmix3"
    Then I should see "Torrey Pines" 
    And I should not see "Ashley Falls"
    When I follow "Destroy"
    Then I should see "Job was successfully destroyed."
    
Scenario: Can't edit or destroy
  Given I am on the view open positions page
  Then I should not see "Destroy"
  And I should not see "Edit"