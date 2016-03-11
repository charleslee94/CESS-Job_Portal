Feature: view available jobs

  As a job applicant
  I want to be led to the most direct way to apply for a job
  So that I can more easily and efficiently send in an application

Background: jobs in database

        Given the following job openings exist:
        | school         | title           | summary                  | compensation_min | compensation_max | 
        | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          |
        | Torrey Pines   | Math teacher    | This job rocks!          | 100,000          | 120,000          |
        | Carmel Valley  | English teacher |  Middle school is rough. | 87,000           | 98,000           |

Scenario: view job openings
  Given I am on the view open positions page
  Then I should see "Ashley Falls"
  And I should see "Torrey Pines"
  And the title for "Torrey Pines" should be "Math teacher"
  And the compensation_min for "Ashley Falls" should be "80,000"

Scenario: edit job opening
  Given I am on the view open positions page
  When I edit the job for the school "Ashley Falls"
  And I fill in "Summary" with "This school rocks in SD!"
  And I press "Update Job"
  Then I should see "Job was successfully updated."
  And I follow "Back"
  Then the summary for "Ashley Falls" should be "This school rocks in SD!" 
  

Scenario: delete job opening
  Given I am on the view open positions page
  When I delete the job for the school "Carmel Valley"
  Then I should see "Job was successfully destroyed."
  And I should not see "Carmel Valley"
  
 
