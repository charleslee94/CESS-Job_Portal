Feature: allow only admins to edit their own things
    As a job applicant
    I want to be able to easily upload my resume
    So that I can apply for a job

Background: jobs in database
    Given the following job openings exist:
   | school         | title           | job_description          | compensation_min | compensation_max | expiration | fte |
   | Ashley Falls   | Teacher         | I love my job!           | 80,000           | 100,000          | 2018-10-20 | 1   |
   
    Given the following resumes exist:
    | firstname   | lastname    | attachment     | job_id   | 
    | Mathew      | Joseph      | haha.jpg       |  6000    | 
    
    Given the following users exist:
       | email                | password   | user_type | school       |
       | mathew@jopeph.com    | admin123   | admin     |              |
       | torrey@pines.com     | 12345678   | school    | Ashley Falls |

Scenario: upload resume sad path
    Given I am on the view open positions page
    And I follow "Ashley Falls"
    Then I should see "Submit Resume"
    And I follow "Submit Resume"
    And I should see "Log in"

Scenario: listing correct resume things on index
    Given I am logged in as "torrey@pines.com" with password "12345678"
    Given I am on the resumes page
    Then I should see "Download"
    And I follow "Back to Jobs"
    Then I should see "Ashley Falls"
