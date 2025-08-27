*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../resources/deposit_page/DepositPage.robot
Test Teardown    Cleanup Screenshots and Logs If Test Passed    ${TEST STATUS}

*** Test Cases ***
Feature: Navigate to Deposit Page
    [Tags]    deposit
    Given User Is Logged In
    When Click Deposit Navigation Button
    Then Verify That Upload Bukti Bayar Button Is Visible

# Scenario: Deposit page scenarios can be added in this test file