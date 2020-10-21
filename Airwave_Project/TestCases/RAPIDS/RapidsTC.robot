*** Settings ***
Library           SeleniumLibrary
Library           String
#Suite Setup       Login And Verify
#Suite Teardown    LogoutAW
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Locators/RAPIDSPage.robot
Resource          ../../Keywords/RAPIDS/RAPIDSPage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Utilities/Data_Provider.robot


*** Test Cases ***
Check the RAPIDS overview for Rogue Data
    [Documentation]  Make sure rogue data is retained  
    [Tags]  case24
    Navigate To RAPIDS Page
    Navigate To RAPIDS Overview Page
    Check for Rogue data
    
Check the ROGUE list page
    [Documentation]  Make sure that Rogues are listed out 
    [Tags]  case25
    Navigate To RAPIDS Page
    Navigate To RAPIDS List Page
    Check for Rogue List
    
Check and modify the ROGUE setup page
    [Documentation]  Make sure that configuration in Rogue setup page is retained  
    [Tags]  case26
    Navigate To RAPIDS Page
    Navigate To RAPIDS Setup Page
    Rapids Classification Setup  ROGUE classification
    Check configuration is retained  ${rapidsExportThreshold}
    
Check and modify the ROGUE classification rules
    [Documentation]  Make sure that modified rogue rules are retained  
    [Tags]  case27
    Navigate To RAPIDS Page
    Navigate To RAPIDS Rules Page
    Rapids Classification Setup  ROGUE classification
    Check rogue rules are retained  ${RapidsClassification}
    
*** Keywords ***

Rapids Classification Setup
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${RapidsClassificationList} =  Data_Provider.GetDataProviderColumnValue  Data_RapidsClassification
  ${RapidsClassification} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RapidsClassificationList}  1
  Set Suite Variable  ${RapidsClassification}
  ${rapidsExportThresholdList} =  Data_Provider.GetDataProviderColumnValue  Data_rapidsExportThreshold
  ${rapidsExportThreshold} =  Data_Provider.DataProviderSplitterForMultipleValues  ${rapidsExportThresholdList}  1
  Set Suite Variable  ${rapidsExportThreshold}
  
*** Variables ***
${SheetName}  RapidsandAlerts
${RapidsClassification}
${rapidsExportThreshold}