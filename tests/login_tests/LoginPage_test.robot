*** Settings ***
Resource    ../../resources/Common.robot
Test Teardown    Cleanup Screenshots and Logs If Test Passed    ${TEST STATUS}

*** Test Cases ***
Feature: User Login
    [Tags]    login
    Given User Navigate To Login Page
    When User Enter Email
    When User Enter Password
    When User Click Captcha
    When User Click Terms
    And User Click Login
    Then Verify Logout Button Is Visible