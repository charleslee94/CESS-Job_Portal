Feature: edit/delete/view only my own school's jobs

    As a school administrator
    So that only I can edit and delete my own job postings
    I want to only see my own job postings when I log in

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 | 1   |
   | Torrey Pines   | Math teacher    | This job rocks!          | 100,000          | 110,000          | 2018-10-20 | .5  |
    
Scenario: Can't edit or destroy
  Given I am on the view open positions page
  And I am signed in with a user type "candidate"
  Then I should not see "Destroy"
  And I should not see "Edit"