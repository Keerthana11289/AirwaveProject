*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../Locators/AlertsFT.robot
Resource          ../../Utilities/Data_Provider.robot


*** Keywords ***
Get Alert Count
    Navigate To Systems Page
    Navigate To Systems Alerts Page
    DOMreadyByWaitTime  2
    ${count}  get element text  ${Loc_AlertsCount}
    ${count}  remove string  ${count}  ,
    ${count}  Convert to integer  ${count}
    [return]  ${count}
    
Create a new client trigger
    [Arguments]  ${type}  ${count1}
    Navigate To Systems Triggers Page
    DOMreadyByWaitTime  3
    Click  ${Loc_Add_trigger}
    DOMreadyByWaitTime  3
    Click  ${Loc_triggertype}
    Click  //*[text()='${type}']
    DOMreadyByWaitTime  2
    Click  ${Loc_AddTriggerButton}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_TriggerSuccessful}
    Log  Trigger - ${type} added successfully!  console=True
    Check in Alerts Page  ${count1}
    Log  Trigger - ${type} verified in alerts!  console=True
    
Check in Alerts Page
    [Arguments]  ${count1}
    Wait until keyword succeeds  5 min  1 min  Check if count is incremented  ${count1}
    
    

Check if count is incremented
    [Arguments]  ${count1}
    DOMreadyByWaitTime  3
    ${count2}  Get Alert Count
    Should be true  ${count1} < ${count2}
    Log  Count before trigger: ${count1}  console=True
    Log  Count after trigger : ${count2}  console=True
    
Create a Connected client trigger
    [Arguments]  ${type}  ${count1}
    Navigate To Systems Triggers Page
    DOMreadyByWaitTime  3
    Click  ${Loc_Add_trigger}
    DOMreadyByWaitTime  3
    Click  ${Loc_triggertype}
    Click  //*[text()='${type}']
    DOMreadyByWaitTime  2
    Click  ${Loc_Suppress_NOButton}
    DOMreadyByWaitTime  3
    Click  ${Loc_AddTriggerButton}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_TriggerSuccessful}
    Log  Trigger - ${type} added successfully!  console=True
    Check in Alerts Page  ${count1}
    Log  Trigger - ${type} verified in alerts!  console=True
    
    
Create a Client Usage trigger
    [Arguments]  ${type}  ${duration}  ${value}  ${count1}
    Navigate To Systems Triggers Page
    DOMreadyByWaitTime  3
    Click  ${Loc_Add_trigger}
    DOMreadyByWaitTime  3
    Click  ${Loc_triggertype}
    Click  //*[text()='${type}']
    DOMreadyByWaitTime  2
    Type  ${Loc_durationText}  ${duration}
    DOMreadyByWaitTime  2
    Type  ${Loc_ValueText}  ${value}
    DOMreadyByWaitTime  2
    Click  ${Loc_Suppress_NOButton}
    DOMreadyByWaitTime  3
    Click  ${Loc_AddTriggerButton}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_TriggerSuccessful}
    Log  Trigger - ${type} added successfully!  console=True
    Check in Alerts Page  ${count1}
    Log  Trigger - ${type} verified in alerts!  console=True
    
    
Create a Clients Count trigger
    [Arguments]  ${type}  ${duration}  ${value}  ${count1}
    Navigate To Systems Triggers Page
    DOMreadyByWaitTime  3
    Click  ${Loc_Add_trigger}
    DOMreadyByWaitTime  3
    Click  ${Loc_triggertype}
    Click  //*[text()='${type}']
    DOMreadyByWaitTime  2
    Type  ${Loc_ClientCountText}  ${value}
    DOMreadyByWaitTime  2
    Type  ${Loc_durationText}  ${duration}
    DOMreadyByWaitTime  2
    DOMreadyByWaitTime  2
    Click  ${Loc_Suppress_NOButton}
    DOMreadyByWaitTime  3
    Click  ${Loc_AddTriggerButton}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_TriggerSuccessful}
    Log  Trigger - ${type} added successfully!  console=True
    Check in Alerts Page  ${count1}
    Log  Trigger - ${type} verified in alerts!  console=True
    
    
    
    
     






*** Keywords ***
Get Trigger Details to add
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${TriggertypeList} =  Data_Provider.GetDataProviderColumnValue  Data_Triggertype
    ${Triggertype} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TriggertypeList}  1
    Set Suite Variable  ${Triggertype}
    
    
Get Trigger Details to add for Client usage
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${TriggertypeList} =  Data_Provider.GetDataProviderColumnValue  Data_Triggertype
    ${Triggertype} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TriggertypeList}  1
    Set Suite Variable  ${Triggertype}
    ${DurationList} =  Data_Provider.GetDataProviderColumnValue  Data_Duration
    ${Duration} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DurationList}  1
    Set Suite Variable  ${Duration}
    ${ValueList} =  Data_Provider.GetDataProviderColumnValue  Data_Value
    ${Value} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ValueList}  1
    Set Suite Variable  ${Value}
    
    
    
    
    

*** Variables ***
${Triggertype}
${Value}
${Duration}