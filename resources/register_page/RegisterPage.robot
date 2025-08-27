*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${DATA_FILE}    ${CURDIR}/../../data/register_data/register_user.json

# Data Diri
${REGISTER_BUTTON}                   xpath=//a[text()='Daftar Sekarang']
${REGISTER_PAGE_HEADER}              xpath=//h1[contains(., "Form Pendaftaran")]
${NAMA_DEPAN_FIELD}                  xpath=//input[@placeholder="Nama Depan"]
${PEKERJAAN_FIELD}                   xpath=//input[@aria-placeholder="Pilih Pekerjaan"]
${PEGAWAI_SWASTA_OPTION}             id=multiselect-option-PEGAWAI SWASTA
${PROVINSI_FIELD}                    xpath=//input[@aria-placeholder="Pilih Provinsi"]
${BALI_OPTION}                       xpath=//li[@role='option' and text()='Bali']
${KOTA_FIELD}                        xpath=//input[@aria-placeholder="Pilih Kota"]
${KAB_BADUNG_OPTION}                 xpath=//li[@role='option' and text()='Kab. Badung']
${TEMPAT_LAHIR_FIELD}                xpath=//input[@placeholder="Tempat Lahir"]
${NOMOR_KTP_FIELD}                   xpath=//input[@placeholder="Nomor KTP"]
${JENIS_KENDARAAN_FIELD}             xpath=//input[@aria-placeholder="Jenis Kendaraan"]
${MOBIL_OPTION}                      xpath=//li[@role='option' and text()='Mobil']
${KENDARAAN_YANG_DICARI_FIELD}       xpath=//input[@aria-placeholder="Pilih Kendaraan"]
${KENDARAAN_PENUMPANG_OPTION}        xpath=//li[@role='option' and text()='Kendaraan Penumpang']
${TUJUAN_PEMBELIAN_FIELD}            xpath=//input[@aria-placeholder="Pilih Tujuan"]
${PRIBADI_OPTION}                    xpath=//li[@role='option' and text()='Pribadi']
${MASA_BERLAKU_KTP_FIELD}            //label[text()='Masa Berlaku KTP*']/following-sibling::div//input
${TANGGAL_LAHIR_FIELD}               //label[text()='Tanggal Lahir*']/following-sibling::div//input
${SELECT_DATE_BUTTON}                xpath=//span[text()='Select']
${UPLOAD_KTP}                        xpath=//button[normalize-space()='Upload File']
${DOMISILI_FIELD}                    xpath=//textarea
${NOMOR_TELEPON_FIELD}               xpath=//input[@placeholder="Nomor Telepon"]
${EMAIL_FIELD}                       xpath=//input[@placeholder="Email"]
${PASSWORD_FIELD}                    xpath=//input[@placeholder="Masukkan Kata Sandi Baru"]
${CONFIRM_PASSWORD_FIELD}            xpath=//input[@placeholder="Masukkan Ulang Kata Sandi Baru"]
${SELANJUTNYA_BUTTON}                xpath=//button[normalize-space()='Selanjutnya']

# Data Pembayaran
${DATA_PEMBAYARAN_TAB}               xpath=//div[normalize-space()='Data Pembayaran']
${INFO_REKENING_ALERT}               xpath=//div[.//div[normalize-space()='Info Nomor Rekening']]
${REKENING_FIELD}                    xpath=//input[@placeholder="Nomor Rekening"]
${BANK_FIELD}                        xpath=//input[@aria-placeholder="Pilih Bank"]
${BANK_BCA_OPTION}                   xpath=//li[@role='option' and text()='BANK BCA']
${ATAS_NAMA_FIELD}                   xpath=//input[@placeholder="Nama Pemilik Rekening"]
${SUMBER_DANA_FIELD}                 xpath=//input[@placeholder="Pilih Sumber Tabungan"]
${USAHA_OPTION}                      xpath=//li[@role='option' and text()='Usaha']
${METODE_PEMBAYARAN_FIELD}           xpath=//input[@aria-placeholder="Pilih Metode Pembayaran"]
${DEBIT_OPTION}                      xpath=//li[@role='option' and text()='Debit']
${DAFTAR_BUTTON}                     xpath=//button[normalize-space()='Daftar']

*** Keywords ***
User Click Register Button
    Click Element    ${REGISTER_BUTTON}

Verify Register Page Header Is Visible
    Wait Until Element Is Visible    ${REGISTER_PAGE_HEADER}    10s

User Fill Registration Form
    [Arguments]    ${namaDepan}    ${tempatLahir}    ${tanggalLahir}    ${nomorKTP}    ${masaBerlakuKTP}    ${domisili}    ${nomorTelepon}    ${email}    ${password}    ${confirmPassword}
    Input Text    ${NAMA_DEPAN_FIELD}         ${namaDepan}
    Input Text    ${TEMPAT_LAHIR_FIELD}       ${tempatLahir}
    Input Text    ${TANGGAL_LAHIR_FIELD}      ${tanggalLahir}
    Input Text    ${NOMOR_KTP_FIELD}          ${nomorKTP}
    Input Text    ${MASA_BERLAKU_KTP_FIELD}   ${masaBerlakuKTP}
    Input Text    ${DOMISILI_FIELD}           ${domisili}
    Input Text    ${NOMOR_TELEPON_FIELD}      ${nomorTelepon}
    Input Text    ${EMAIL_FIELD}              ${email}
    Input Text    ${PASSWORD_FIELD}           ${password}
    Input Text    ${CONFIRM_PASSWORD_FIELD}   ${confirmPassword}

User Select Tanggal Lahir
    [Arguments]    ${tanggal}=11
    Click Element    ${TANGGAL_LAHIR_FIELD}
    Wait Until Element Is Visible    xpath=//div[contains(@class,"dp__calendar_wrap")]    5s
    Click Element    xpath=(//div[contains(@class,"dp__cell_inner")][normalize-space(.)="${tanggal}"])[1]
    Click Element    xpath=//span[contains(@class,"dp__action") and normalize-space(text())="Select"]

User Select Masa Berlaku KTP
    [Arguments]    ${tanggal}=30
    Click Element    ${MASA_BERLAKU_KTP_FIELD}
    Wait Until Element Is Visible    xpath=//div[contains(@class,"dp__calendar_wrap")]    5s
    Click Element    xpath=(//div[contains(@class,"dp__cell_inner")][normalize-space(.)="${tanggal}"])[1]
    Click Element    xpath=//span[contains(@class,"dp__action") and normalize-space(text())="Select"]


User Click Selanjutnya Button
    Click Button    ${SELANJUTNYA_BUTTON}

User Pilih Pekerjaan Pegawai Swasta
    Click Element    ${PEKERJAAN_FIELD}
    Click Element    ${PEGAWAI_SWASTA_OPTION}

User Pilih Provinsi Bali
    Click Element    ${PROVINSI_FIELD}
    Click Element    ${BALI_OPTION}

User Pilih Kab. Badung
    Click Element    ${KOTA_FIELD}
    Click Element    ${KAB_BADUNG_OPTION}

User Pilih Jenis Kendaraan Mobil
    Click Element    ${JENIS_KENDARAAN_FIELD}
    Click Element    ${MOBIL_OPTION}

User Pilih Kendaraan Penumpang
    Click Element    ${KENDARAAN_YANG_DICARI_FIELD}
    Click Element    ${KENDARAAN_PENUMPANG_OPTION}

User Pilih Tujuan Pembelian
    Click Element    ${TUJUAN_PEMBELIAN_FIELD}
    Click Element    ${PRIBADI_OPTION}

User Click Upload KTP
    Choose File    ${UPLOAD_KTP}    ${CURDIR}/../../data/register_data/Sample_KTP.png

Verify Info Rekening Alert Is Visible
    Wait Until Element Is Visible    ${INFO_REKENING_ALERT}

User Register With JSON Data
    ${data}=    Evaluate    __import__('json').load(open('${DATA_FILE}'))    json

    ${namaDepan}=         Set Variable    ${data["NamaDepan"]}
    ${tempatLahir}=       Set Variable    ${data["TempatLahir"]}
    ${tanggalLahir}=      Set Variable    ${data["TanggalLahir"]}
    ${nomorKTP}=          Set Variable    ${data["NomorKTP"]}
    ${masaBerlakuKTP}=    Set Variable    ${data["MasaBerlakuKTP"]}
    ${domisili}=          Set Variable    ${data["Domisili"]}
    ${nomorTelepon}=      Set Variable    ${data["NomorTelepon"]}
    ${email}=             Set Variable    ${data["Email"]}
    ${password}=          Set Variable    ${data["Password"]}
    ${confirmPassword}=   Set Variable    ${data["ConfirmPassword"]}

    User Fill Registration Form
    ...    ${namaDepan}
    ...    ${tempatLahir}
    ...    ${tanggalLahir}
    ...    ${nomorKTP}
    ...    ${masaBerlakuKTP}
    ...    ${domisili}
    ...    ${nomorTelepon}
    ...    ${email}
    ...    ${password}
    ...    ${confirmPassword}

User Fill Data Pembayaran
    Wait Until Element Is Visible    ${REKENING_FIELD}
    Wait Until Element Is Enabled    ${REKENING_FIELD}
    Input Text       ${REKENING_FIELD}           1234567890
    Input Text       ${ATAS_NAMA_FIELD}         Hire Me
    Click Element    ${BANK_FIELD}
    Click Element    ${BANK_BCA_OPTION}
    Click Element    ${SUMBER_DANA_FIELD}
    Click Element    ${USAHA_OPTION}
    Click Element    ${METODE_PEMBAYARAN_FIELD}
    Click Element    ${DEBIT_OPTION}

Data Pembayaran Tab Is Active
    Wait Until Element Is Visible    ${DATA_PEMBAYARAN_TAB}    10s
     ${class_attribute}=    Get Element Attribute    ${DATA_PEMBAYARAN_TAB}    class
    Should Contain    ${class_attribute}    pastel-blue
    Should Contain    ${class_attribute}    border-pastel-blue

User Click Daftar
    Click Element    ${DAFTAR_BUTTON}

Verify Registration Success
    Wait Until Page Contains    Selamat    timeout=10s