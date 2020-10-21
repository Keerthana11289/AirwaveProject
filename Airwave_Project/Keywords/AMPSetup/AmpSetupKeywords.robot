*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Locators/AMPSetupPage.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Login/LoginFeature.robot

*** Keywords ***
Customize Top Header and Verify
    Click  ${Loc_TopHeader}
    DOMreadyByWaitTime  3
    Click  ${Loc_VPNusers_checkbox}
    Click  ${Loc_Save}
    Navigate To AMP Setup Page
    AssertForElementPresent  ${Loc_VPNusers_header}
    Log  Top Header verified!  console=True
    
Verify Firmware Upgrade/Reboot Options
    Click  ${Loc_FirmwareReboot}
    DOMreadyByWaitTime  3
    Click  ${Loc_FirmwareRadioButton}
    Click  ${Loc_Save}
   # WaitForElementPresent  ${Loc_settingsSavedsuccessfull}
    Navigate To Device Page
    Navigate to Device Manage page
    AssertForElementPresent  ${Device_info}
    Navigate To AMP Setup Page
    Log  Firmware Upgrade/Reboot Options verified!  console=True

    
Customize Automatic Authorization and verify
    Click  ${Loc_NewDevice_Header}
    DOMreadyByWaitTime  3
    AssertForElementNotPresent  ${Loc_Whitelist_dropdown}
    Navigate To AMP Setup Page
    Click  ${Loc_AutomaticAuthorization}
    DOMreadyByWaitTime  3
    Click  ${Loc_APWhitelistRadioButton}
    Click  ${Loc_SwitchWhitelistRadioButton}
    Click  ${Loc_Save}
    WaitForElementPresent  ${Loc_settingsSavedsuccessfull}
    DOMreadyByWaitTime  8
    Navigate To Device Page
    Navigate To Device New Page
   # Click  ${Loc_NewDevice_Header}
    DOMreadyByWaitTime  3
    AssertForElementPresent  ${Loc_Whitelist_dropdown}
    Navigate To AMP Setup Page
    Log  Automatic Authorization verified!  console=True
    
Customize Additional AMP services and verify
    Click  ${Loc_AdditionalSettings}
    DOMreadyByWaitTime  3
    Radio button should be set to  ${Loc_AMONvsSNMPpoll_grpname}  ${Loc_AMONvsSNMP_value}
    Navigate To AMP Setup Page
    Log  Additional AMP services verified!  console=True
    
Verify Performance
    Click  ${Loc_Performance}
    DOMreadyByWaitTime  3
    ${value}  Get Value  ${Loc_ClientRelevanceFactor}
    ${value}  convert to integer  ${value}
    Log  ${value}  console=True
    Should be true  '${value}'>'0' and '${value}'<='60'
    Navigate To AMP Setup Page
    Log  Performance verified!  console=True
    
    
Navigate to Device Manage page
    Click  ${Loc_icon_search}
    Type  ${Loc_search_input_xpath}  ${Loc_searchinput_value}
    Click  ${Loc_searchPopup}
    sleep  5s
    ${count}  Get element count  ${UpStatus_Devices}
    Run keyword if  ${count}==0  Click  ${Loc_close_button}
    Run keyword if  ${count}==0  Fail  No devices found!
    Click  ${UpStatus_Devices}
    Wait Until Element Is Visible  ${Device_manage_xpath}  30s
    Sleep  3s
    Click  ${Device_manage_xpath}
    Wait Until Element Is Not Visible  ${loader}  30s


    

Verify Device Manage Page
    Click  ${Loc_FirmwareReboot}
    DOMreadyByWaitTime  3
    Click  ${Loc_FirmwareRadioButton}
    Click  ${Loc_Save}
   # WaitForElementPresent  ${Loc_settingsSavedsuccessfull}
    Navigate To Device Page
    Navigate to Device Manage page
    AssertForElementPresent  ${Device_info}
    Navigate To AMP Setup Page
    Log  Device Manage page verified!  console=True

### Client Page
    
Navigate To Client Detail Page
   Click  ${Loc_icon_search}
    Type  ${Loc_search_input_xpath}  ${Loc_searchinput_value}
    Click  ${Loc_searchPopup}
    sleep  5s
    Click  ${Loc_Clients}
    sleep  5s
    ${count}  Get element count  ${Loc_SelectClient}
    Run keyword if  ${count}==0  Click  ${Loc_close_button}
    Run keyword if  ${count}==0  Fail  No devices found!
    Set focus to element  ${Loc_SelectClient}
    sleep  5s
    Click  ${Loc_SelectClient}
    sleep  3s
    Wait Until Element Is Not Visible  ${loader}  30s
    sleep  5s
    Wait Until Element Is Visible  ${Loc_Client_detail}  30s
    Sleep  3s
    Click  ${Loc_Client_detail}
    Wait Until Element Is Not Visible  ${loader}  30s



    
Check UCC Data
    AssertForElementPresent  ${Loc_UCC_Calls}
    Log  Ucc Calls Data verified!  console=True
    
Check Clarity Data
    AssertForElementPresent  ${Loc_Clarity_data}
    Log  Clarity Data verified!  console=True
    
### Client Diagnostics Page

Navigate To Client Diagnostics Page
    Navigate To Clients Connected Page
    ${n}  set variable  5
    Wait Until Element Is Not Visible  ${loader}  30s
    DOMreadyByWaitTime  20
    ${MAC_count}  Get Element Count  ${Loc_MAC_Address}
    Run Keyword If  '${MAC_count}'=='0'  Fail  No Clients!
    ${range}  Run Keyword If  ${MAC_count}<5  Set variable  ${MAC_count}
    ...  ELSE  Set variable  ${n}
    :FOR  ${i}  IN RANGE  1  ${range}+1
    \    ${Value}  Set Variable  0
    \    Navigate To Clients Connected Page
    \    DOMreadyByWaitTime  10
    \    Set focus to element  (${Loc_MAC_Address})[${i}]
    \    sleep  5s
    \    Click  (${Loc_MAC_Address})[${i}]
    \    DOMreadyByWaitTime  3
    \    ${Data}  Get element count  ${Loc_Error_noData}
    \    Continue For Loop If  '${Data}'>'0'
    \    ${chart}  Check Charts in diagnostic page
    \    ${ucc}  Check UCC in diagnostic page
    \    ${clarity}  Check Clarity in diagnostic page
    \    ${TA}  Check Traffic Analysis in diagnostic page
    \    ${Verify}  Evaluate  ${chart}+${ucc}+${clarity}+${TA}
    \    Exit For Loop If  '${Verify}' == '4'
    Log  Charts,UCC,Clarity and Traffic Analysis verified in diagnostic page!  console=True




    
Check Charts in diagnostic page
    ${Value}  Set Variable  0
    ${Chartcount}  get element count  ${Loc_Charts}
    Run Keyword If  '${Chartcount}'=='0'  Log  No Charts!
    Run Keyword If  '${Chartcount}'!='0'  Click  ${Loc_Charts}
    Run Keyword If  '${Chartcount}'!='0'  DOMreadyByWaitTime  3
    Run Keyword If  '${Chartcount}'!='0'  AssertForElementPresent  ${Loc_Diag_chartCount}
    ${Value}  Run Keyword If  '${Chartcount}'!='0'  Set Variable  1
       ...  ELSE  Set Variable  0
    [Return]  ${Value}
    
Check UCC in diagnostic page
    ${Value}  Set Variable  0
    ${UCC_count}  get element count  ${Loc_UCC}
    Run Keyword If  '${UCC_count}'=='0'  Log  No UCC Data!
    Run Keyword If  '${UCC_count}'!='0'  Click  ${Loc_UCC}
    Run Keyword If  '${UCC_count}'!='0'  DOMreadyByWaitTime  3
    Run Keyword If  '${UCC_count}'!='0'  AssertForElementPresent  ${Loc_Diag_UCCdata}
    ${Value}  Run Keyword If  '${UCC_count}'!='0'  Set Variable  1
    ...  ELSE  Set Variable  0
    [Return]  ${Value}
    
Check Clarity in diagnostic page
    ${Value}  Set Variable  0
    ${Clarity_count}  get element count  ${Loc_Clarity}
    Run Keyword If  '${Clarity_count}'=='0'  Log  No Clarity Data!
    Run Keyword If  '${Clarity_count}'!='0'  Click  ${Loc_Clarity}
    Run Keyword If  '${Clarity_count}'!='0'  DOMreadyByWaitTime  3
    Run Keyword If  '${Clarity_count}'!='0'  AssertForElementPresent  ${Loc_Diag_Claritydata}
    ${Value}  Run Keyword If  '${Clarity_count}'!='0'  Set Variable  1
    ...  ELSE  Set Variable  0
    [Return]  ${Value}
    
Check Traffic Analysis in diagnostic page
    ${Value}  Set Variable  0
    ${TA_count}  get element count  ${Loc_TrafficAnalysis}
    Run Keyword If  '${TA_count}'=='0'  Log  No Clarity Data!
    Run Keyword If  '${TA_count}'!='0'  Click  ${Loc_TrafficAnalysis}
    Run Keyword If  '${TA_count}'!='0'  DOMreadyByWaitTime  3
    Run Keyword If  '${TA_count}'!='0'  AssertForElementPresent  ${Loc_Diag_TAData}
    ${Value}  Run Keyword If  '${TA_count}'!='0'  Set Variable  1
    ...  ELSE  Set Variable  0
    [Return]  ${Value}

    
    
Verify Clients Data
    Page should contain element  ${Loc_HomepageClients}


Verify Folder Overview Data
    Page should contain element   ${Loc_HomepageFolderQverView}


Verify Alert Summary
    Page should contain element   ${Loc_HomePageAlert}


Verify Quick Links
    Page should contain element   ${Loc_HomePage_QuickLink}


Verify Monitoring Status
    Page should contain element   ${Loc_HomepageMonitoring}

Verify the client Connected page
    Wait Until Element Is Visible  ${Loc_ClientConected}  30s


    
    