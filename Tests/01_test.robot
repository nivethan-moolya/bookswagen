***Settings***
Resource  ../utilities/utils.robot
Resource  ../utilities/testData.robot

Suite Setup  User launches browser
Suite Teardown  User terminates browser

#Robot -d results -i sanity Tests
#robotmetrics
#robotmetrics -I ./Results/

***Test Cases***
User should be able to Land on Bookswagon details Page
    [Tags]  regression 
    Given As a customer I login to bookswagon website  ${url}
    And verify user successfully landed on the home page
    When I navigate to Book > Technology & Engineering category
    And Scroll and search for the book named  ${book_name}
    Then Verify the author name of the book as  ${author_name}
