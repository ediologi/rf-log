*** Settings ***
Resource   ../../resources/Common.robot
Resource   ../../resources/register_page/RegisterPage.robot
Test Teardown    Cleanup Screenshots and Logs If Test Passed    ${TEST STATUS}

*** Test Cases ***
Feature: User Registration
    Given User Navigate To Login Page
    When User Click Register Button
    Then Verify Register Page Header Is Visible

Scenario: Filling the Personal Data Form With Valid Data
    [Tags]    register
    Given User Register With JSON Data
    When User Select Tanggal Lahir
    And User Click Upload KTP
    And User Select Masa Berlaku KTP
    And User Pilih Provinsi Bali
    And User Pilih Kab. Badung
    And User Pilih Pekerjaan Pegawai Swasta
    And User Pilih Jenis Kendaraan Mobil
    And User Pilih Kendaraan Penumpang
    And User Pilih Tujuan Pembelian
    And User Click Selanjutnya Button
    Then Data Pembayaran Tab Is Active