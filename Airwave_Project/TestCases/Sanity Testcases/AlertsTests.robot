*** Settings ***
Documentation     Page/feature library for Login
...    
#Suite Setup       Login And Verify
#Suite Teardown    LogoutAW
Library           SeleniumLibrary
Library           String
Resource          ../../Keywords/HomePage.robot

Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Utilities/Data_Provider.robot
Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../Keywords/Device/DeviceFeature.robot
Resource          ../../Keywords/Device/DeviceSetup_Keywords.robot




*** Test Cases ***
TestAlertsinAirwave
    [Documentation]  Here Getting the test data from 'LoginValidate' sheet - "TestLoginNegative" Test case column name. 
    [Tags]  smokeTest1
    Alerts Data Setup  TestAlertsinAirwave
    Generate the specific Alarm and check  ${TriggerList}  ${SeverityValue}  ${InputValue}
     
    



    
   
*** Keywords ***
Alerts Data Setup
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${TriggerTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_TriggerType
  ${TriggerList} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TriggerTypeList}  1
  Set Suite Variable  ${TriggerList}
  ${SeverityValueList} =  Data_Provider.GetDataProviderColumnValue  Data_SeverityValue
  ${SeverityValue} =  Data_Provider.DataProviderSplitterForMultipleValues  ${SeverityValueList}  1
  Set Suite Variable  ${SeverityValue}
 # ${ValueList} =  Data_Provider.GetDataProviderColumnValue  Data_InputValue
 # ${InputValue} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ValueList}  1
 # Set Suite Variable  ${InputValue}
   
    
*** Variables ***
${SheetName}  RapidsandAlerts
#${SheetName1}  Devices

${UserName1}
${Password1}
${UserName2}
${Password2}
${TriggerList}
${SeverityValue}
${InputValue}  10


