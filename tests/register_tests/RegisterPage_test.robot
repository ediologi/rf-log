*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../resources/register_page/RegisterPage.robot
Resource    ../../resources/login_page/LoginPage.robot
Test Teardown    Cleanup Screenshots and Logs If Test Passed    ${TEST STATUS}

*** Test Cases ***
User Registration With Valid Data
    [Tags]    register
    Given User Navigate To Login Page
    When User Click Daftar Sekarang
    And Verify Register Page Header Is Visible
    When User Pilih Pekerjaan Pegawai Swasta