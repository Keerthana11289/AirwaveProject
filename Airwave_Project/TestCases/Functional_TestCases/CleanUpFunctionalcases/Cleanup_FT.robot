*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../../../Utilities/CommonFunctions.robot
Resource          ../../../Keywords/HomePage.robot
Resource          ../../../Keywords/FunctionalTC_keywords/CleanupFT_keywords.robot
Resource          ../../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../../Locators/CleanupFT.robot
Resource          ../../../Locators/ReportsFT.robot



*** Test Cases ***

Login To AMP
    [Documentation]  Here Getting the test data from 'ReportsFT' sheet - "Login Details" Test case column name. 
    [Tags]  Case1
    Login Data Setup CleanupFT  Login Details  
    Login To AMP page successful for Airwave after cleanup  ${LoginUserName1}  ${LoginPassword1} 
    
Cleanup For Client Monitoring setup and configuration
    [Documentation]  Enable client related traps on the controller and point it to AMP server.
    ...    
    [Tags]  Case 4
    Get Client Monitoring Details  ClientMonitor
    Disble SNMP Traps and Syslog messages
    Cleanup for Create Campus, Building and New Floor  ${Campusname}
    Delete New User   ${NewUserReadonlyUsername}  ${RoleUsername}  ${LoginPwd}
    Delete New Role  ${RoleUsername}
    Delete Created Folder  ${FolderName1}
    Delete Created Folder  ${FolderName2}
    Delete Created Group  ${GroupName1}
    Enable AMON vs SNMP Polling
    Disable RF engine
    


Cleanup For Role based visibility of clients
    [Documentation]  Delete newly created user
    ...    
    [Tags]  Case 6
    Get New User Details  DeviceFT
    Delete New User  ${NewUserReadonlyUsername}  ${NewUserReadonlyRole}  ${LoginPwd}
    

Cleanup For Generate Reports - Client Inventory
    [Documentation]  Delete Client Inventory Created report 
    [Tags]  Case 43
    Get Report Details  ReportsFT
    Delete Created Report FT  ${Client InventoryTitle}
    
Cleanup For Generate Reports -Client Session
    [Documentation]  Delete Created Client Session report 
    [Tags]  Case 44
    Get Report Details  ReportsFT
    Delete Created Report FT  ${Client SessionTitle}
    
Cleanup For Generate Reports - Device Summary
    [Documentation]  Delete Created Device Summary report 
    [Tags]  Case 45
    Get Report Details  ReportsFT
    Delete Created Report FT  ${Device SummaryTitle}
    
Cleanup For Generate Reports - New Clients
    [Documentation]  Delete Created New Clients report 
    [Tags]  Case 46
    Get Report Details  ReportsFT
    Delete Created Report FT  ${New ClientsTitle}
    
Cleanup For Triggers for New Clients
    [Documentation]  Delete New client trigger
    [Tags]  Case 50
    Get Trigger Details to delete  TriggersFT
    Delete Created Trigger  ${NewClientTriggertype}
    
Cleanup For Triggers for Connected Clients
    [Documentation]  Delete Connected Clients trigger
    [Tags]  Case 50
    Get Trigger Details to delete  TriggersFT
    Delete Created Trigger  ${ConnectedClientsTriggertype}
    
Cleanup For Triggers for Clients Count
    [Documentation]  Delete Clients Count trigger
    [Tags]  Case 50
    Get Trigger Details to delete  TriggersFT
    Delete Created Trigger  ${ClientCountTriggertype}
    
Cleanup For Triggers for Client Usage
    [Documentation]  Delete Client Usage trigger
    [Tags]  Case 50
    Get Trigger Details to delete  TriggersFT
    Delete Created Trigger  ${ClientUsagetriggertype}
    
Cleanup For SNMP and AMON settings
    [Documentation]   Revert SNMP and AMON settings
    [Tags]  Case 79
    Navigate To AMP Setup Page
    Revert Additional AMP services AMON Vs SNMP polling
    
Cleanup For Add Device
    [Documentation]  Delete Added 2 controllers in folder1 and folder2
    ...
    [Tags]  Case 80
    Get Controller and group details  DeviceFT
    ### Controller 1
    Delete added Controller device  ${DeviceIPAddress1}
    ### Controller 2
    Delete added Controller device  ${DeviceIPAddress2}
    ### Folder 1
    Delete Created Folder  ${FolderName1}
    ### Folder 2
    Delete Created Folder  ${FolderName2}
    ### Group 1
    Delete Created Group  ${GroupName1}
    ### Group 2
    Delete Created Group  ${GroupName2}
    
    
    

    



*** Variables ***
${SheetName}  Cleanup_FT
