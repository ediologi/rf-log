*** Settings ***
Resource    ../../resources/Common.robot
Test Teardown    Cleanup Screenshots and Logs If Test Passed    ${TEST STATUS}

*** Test Cases ***
User Is Logged In
    [Tags]    login
    Given User Navigate To Login Page
    When User Enter Email
    When User Enter Password
    When User Click Terms
    When User Click Captcha
    And User Click Login
    Then Verify Logout Button Is Visible