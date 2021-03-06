Feature: view available jobs

  As a job applicant
  I want to be led to the most direct way to apply for a job
  So that I can more easily and efficiently send in an application

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
       | me@me.com            | 12345678   | school    | Carmel Valley| meow Berkeley, CA | 
       | e@me.com             | 12345678   | school    | Torrey Pines | meow Berkeley, CA |
       
Scenario: view job openings
  Given I am on the view open positions page
  Then I should see "Ashley Falls"
  And I should see "Torrey Pines"
  And the title for "Torrey Pines" should be "Math teacher"
  And the compensation_min for "Ashley Falls" should be "80,000"


Scenario: view job openings by title
  Given I am on the view open positions page
  When I follow "Math teacher"
  Then I should see "Math teacher"
  And I should see "Torrey Pines"
  Then I should not see "English teacher"
  And I should not see "Ashley Falls"
  
Scenario: view jobs alphabetical order by school
  Given I am on the view open positions page
  When I follow "School"
  Then I should see "Ashley Falls" before "Carmel Valley"
  And I should see "Carmel Valley" before "Torrey Pines"

Scenario: view jobs alphabetical order by title
  Given I am on the view open positions page
  When I follow "Title"
  Then I should see "Carmel Valley" before "Ashley Falls"
  And I should see "Torrey Pines" before "Ashley Falls"
  And I should see "English teacher" before "Math teacher"
  
Scenario: edit job opening
  Given I am signed in with a school name "Ashley Falls" 
  And I am on the view open positions page
  When I edit the job for the school "Ashley Falls"
  And I fill in "Job description" with "This school rocks in SD!"
  And I press "Update Job"
  Then I should see "Job was successfully updated."
  And I follow "Back"
  And I follow "Ashley Falls"
  Then I should see "This school rocks in SD!"

Scenario: edit job name
  Given I am signed in with a school name "Ashley Falls"
  And I am on the view open positions page
  When I edit the job for the school "Ashley Falls"
  And I fill in "Title" with "History 2 Teacher"
  And I press "Update Job"
  Then I should see "Job was successfully updated."
  And I follow "Back"
  Then I should see "History 2 Teacher"

Scenario: delete job opening
  Given I am signed in with a school name "Carmel Valley"
  And I am on the view open positions page
  Then I should see "Carmel Valley"
  When I delete the job for the school "Carmel Valley"
  Then I should see "Job was successfully destroyed."
  And I should not see "Carmel Valley"

 
