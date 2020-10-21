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
    Check ARP IP Match Timeout
    Check Negative Value Change  ${value1}
    Change ARP IP Match Timeout  ${Value}  
    
Check and modify the ROGUE classification rules
    [Documentation]  Make sure that modified rogue rules are retained  
    [Tags]  case27
    Navigate To RAPIDS Page
    Navigate To RAPIDS Rules Page
    Rapids Classification Setup  ROGUE classification
    Modify rogue rules
    Create new rule and verify  ${Rulename}  ${threat}  ${Signalmin}  ${classification}
    


    
    


    
    
*** Keywords ***

Rapids Classification Setup
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${RulenameList} =  Data_Provider.GetDataProviderColumnValue  Data_Rulename
  ${Rulename} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RulenameList}  1
  Set Suite Variable  ${Rulename}
  ${SignalminList} =  Data_Provider.GetDataProviderColumnValue  Data_Signalmin
  ${Signalmin} =  Data_Provider.DataProviderSplitterForMultipleValues  ${SignalminList}  1
  Set Suite Variable  ${Signalmin}
  ${classificationList} =  Data_Provider.GetDataProviderColumnValue  Data_classification
  ${classification} =  Data_Provider.DataProviderSplitterForMultipleValues  ${classificationList}  1
  Set Suite Variable  ${classification}
  ${ValueList} =  Data_Provider.GetDataProviderColumnValue  Data_Value
  ${Value} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ValueList}  1
  Set Suite Variable  ${Value}
  ${threatList} =  Data_Provider.GetDataProviderColumnValue  Data_threat
  ${threat} =  Data_Provider.DataProviderSplitterForMultipleValues  ${threatList}  1
  Set Suite Variable  ${threat}
  
  
  
*** Variables ***
${SheetName}  RapidsandAlerts
${Rulename}
${classification}
${threat}  
${Signalmin}  
${Value}  
${value1}  0