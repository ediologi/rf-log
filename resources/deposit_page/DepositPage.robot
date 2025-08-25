*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DEPOSIT_NAV_BUTTON}       xpath=//a[text()='Deposit']
${UPLOAD_BUKTI_BAYAR_BUTTON}       xpath=//button[normalize-space()='Upload Bukti Bayar']

*** Keywords ***
Click Deposit Navigation Button
    Wait Until Element Is Not Visible    //iframe[contains(@src, "recaptcha")]
    Click Element    ${DEPOSIT_NAV_BUTTON}

Verify That Upload Bukti Bayar Button Is Visible
    Wait Until Element Is Visible    ${UPLOAD_BUKTI_BAYAR_BUTTON}