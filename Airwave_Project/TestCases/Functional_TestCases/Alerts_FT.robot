*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/FunctionalTC_keywords/AlertsFT_keywords.robot
Resource          ../../Locators/AlertsFT.robot

*** Test Cases ***

Verify Triggers for New Clients
    [Documentation]  Create New client trigger and verify alert details 
    [Tags]  Case 50
    ${count1}  Get Alert Count  
    Get Trigger Details to add  New Client
    Create a new client trigger  ${Triggertype}  ${count1}
    

Verify Triggers for Connected Clients 
    [Documentation]  Create Connected client trigger and verify alert details
    [Tags]  Case 51
    ${count1}  Get Alert Count
    Get Trigger Details to add  Connected Clients
    Create a Connected client trigger  ${Triggertype}  ${count1}
    
Verify Triggers for Clients Count
    [Documentation]  Create Connected client trigger and verify alert details
    [Tags]  Case 52
    ${count1}  Get Alert Count
    Get Trigger Details to add for Client usage  Client count
    Create a Clients Count trigger  ${Triggertype}  ${Duration}  ${Value}  ${count1}

Verify Triggers for Client Usage 
    [Documentation]  Create Connected client trigger and verify alert details
    [Tags]  Case 53
    ${count1}  Get Alert Count
    Get Trigger Details to add for Client usage  Client Usage
    Create a Client Usage trigger  ${Triggertype}  ${Duration}  ${Value}  ${count1}
    





























*** Variables ***
${SheetName}  Triggers_FT