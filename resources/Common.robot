*** Settings ***
Library    SeleniumLibrary
Library    ../utils/Environment.py
Library    Process
Library    OperatingSystem

*** Variables ***
${BROWSER}                 chrome
${LOGIN_HEADER}            xpath=//h1[contains(., "Selamat Datang")]
${LOGIN_EMAIL_FIELD}       name=email
${LOGIN_PASSWORD_FIELD}    name=password
${RECAPTCHA_CHECKBOX}      id=recaptcha-anchor
${TERMS_CHECKBOX}          id=remember_me
${LOGIN_BUTTON}            xpath=//button[normalize-space()='Masuk']
${REGISTER_BUTTON}         xpath=//a[text()='Daftar Sekarang']
${LOGOUT_BUTTON}           xpath=//button[normalize-space()='Keluar']

*** Keywords ***
User Navigate To Login Page
    ${url}=    Get Env Variable    BASE_URL
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN_HEADER}     10s
    Wait Until Element Is Visible    ${REGISTER_BUTTON}
    
User Enter Email
    ${email}=    Get Env Variable    EMAIL
    Input Text    ${LOGIN_EMAIL_FIELD}    ${email}

User Enter Password
    ${password}=    Get Env Variable    PASSWORD
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}

# reCAPTCHA Limitation
# This application uses Google reCAPTCHA, which is designed to block automation.
# As a result, some test cases may fail or become flaky when reCAPTCHA is triggered. 
# In a real-world project, I would coordinate with the development team to disable or mock reCAPTCHA in the test environment
# In real browser, users are recognized as human (based on cookies, browser fingerprint, etc)
# In automation browser, Google reCAPTCHA detects tools like Selenium and increases its challenge level
# by passing the reCAPTCHA challenge (select image accordingly).
User Click Captcha
    Wait Until Element Is Visible    //iframe[contains(@src, "recaptcha")]    10s
    Select Frame    //iframe[contains(@src, "recaptcha")]
    Click Element    ${RECAPTCHA_CHECKBOX}
    Unselect Frame

User Click Terms
    Click Element    ${TERMS_CHECKBOX}

User Click Login
    Wait Until Element Is Not Visible    //iframe[contains(@src, "recaptcha")]
    Click Button    ${LOGIN_BUTTON}

Verify Logout Button Is Visible
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    10s

User Is Logged In
    User Navigate To Login Page
    User Enter Email
    User Enter Password
    User Click Captcha
    User Click Terms
    User Click Login
    Verify Logout Button Is Visible

User Click Daftar Sekarang
    Click Button    ${REGISTER_BUTTON}

Cleanup Screenshots and Logs If Test Passed
    [Arguments]        ${test_status}
    Run Keyword If    '${test_status}' == 'PASS'    Remove Files    output/*.png
    Run Keyword If    '${test_status}' == 'PASS'    Remove Files    output/*.log

User Close Browser
    Close Browser