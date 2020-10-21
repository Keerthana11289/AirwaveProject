*** Settings ***
Documentation     Page/feature library for Login
...    
#Suite Setup       Login And Verify
#Suite Teardown    LogoutAW
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Locators/DeviceSetupPages.robot
Resource          ../../Keywords/Device/DeviceFeature.robot
Resource          ../../Keywords/Device/DeviceSetup_keywords.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Locators/AMPSetupPage.robot


*** Test Cases ***

Check Device Status after Polling
    Navigate to Home Page
    Get controller details  Check Device Status after Polling
    Click  ${Loc_icon_search}
    Type  ${Loc_search_input_xpath}  ${Controller_IP}
    Click  ${Loc_searchPopup}
    DOMreadyByWaitTime  5
    Check Device Status of controller  ${Controller_IP}  ${Controller_Name}  ${ControllerMAC}  ${Controller_Status}  ${Controller_configuration}


*** Keywords ***
Get controller details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${ControllerIPList} =  Data_Provider.GetDataProviderColumnValue  Data_ControllerIP
    ${Controller_IP} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerIPList}  1
    Set Suite Variable  ${Controller_IP}
    ${ControllerNameList} =  Data_Provider.GetDataProviderColumnValue  Data_ControllerName
    ${Controller_Name} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerNameList}  1
    Set Suite Variable  ${Controller_Name}
    ${ControllerMACList} =  Data_Provider.GetDataProviderColumnValue  Data_ControllerMACAddress
    ${ControllerMAC} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerMACList}  1
    Set Suite Variable  ${ControllerMAC}
    ${ControllerStatusList} =  Data_Provider.GetDataProviderColumnValue  Data_ControllerStatus
    ${Controller_Status} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerStatusList}  1
    Set Suite Variable  ${Controller_Status}
    ${ControllerconfigurationList} =  Data_Provider.GetDataProviderColumnValue  Data_Controllerconfiguration
    ${Controller_configuration} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerconfigurationList}  1
    Set Suite Variable  ${Controller_configuration}
    
*** Variables ***
${SheetName}  ClientMonitoring
${Controller_IP}
${Controller_Name}
${ControllerMAC}
${Controller_Status}
${Controller_configuration}

