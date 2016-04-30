Feature: schools can see what job an applicant applied to
    As a school administrator
    So that I know what job each resume was submitted for
    I want a field that says what job the applicant applied for

Background: jobs in database
    Given the following job openings exist:
   | school         | title            | job_description          | compensation_min | compensation_max | expiration | fte | id | user_id | 
   | Ashley Falls   | English Teacher  | I love my job!           | 80,000           | 100,000          | 2018-10-20 | 1   | 45 | 65      |
   
    Given the following resumes exist:
   | firstname   | lastname     | attachment     | job_id    |
   | Mathew      | Joseph       | haha.jpg       |     45    |
   
   Given the following users exist:
       | email                | password   | user_type | school       | id |
       | mathew@jopeph.com    | admin123   | admin     |              |    |
       | torrey@pines.com     | 12345678   | school    | Ashley Falls | 65 |

    
Scenario: see what resumes belong to what jobs
  Given I am logged in as "torrey@pines.com" with password "12345678"
  And I am on the school resumes page
  Then I should see "Mathew"
  And I should see "Joseph"
  And I should see "English Teacher"
    


