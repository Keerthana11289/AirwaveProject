*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/FunctionalTC_keywords/DevicesFT_keywords.robot
Resource          ../../Locators/DevicesFT.robot

*** Test Cases ***

Client Monitoring setup and configuration
    [Documentation]  Enable client related traps on the controller and point it to AMP server.
    ...    
    [Tags]  Case 4
    
  #  Enable Visual RF engine
  #  Disable AMON vs SNMP Polling
    Get Folder and controller details   Client Monitoring
  #  Create group  ${GroupName1}
  #  Create folder  ${FolderName1}
  #  Create folder  ${FolderName2}
  #  Create a role for folder1  ${FolderName1}
  #  Create a user with role
  #  Create Campus, Building and New Floor
  #  Enable SNMP Traps and Syslog messages
  #  Enable Client Related Traps in Controller
    


Role based visibility of clients
    [Documentation]  Login to AMP as newly created user
    ...    
    [Tags]  Case 6
    Navigate To AMP Setup Page
    Navigate To AMP Setup Users Page
    Add new user with readonly and monitoring role
    Logout of AMP
    Login with readonly and monitoring role
    Run keyword and continue on Failure  Get Client Count and compare Readonly
    Logout of Readonly user
    Login To AMP after TestReadonly



    
    
    




Delete devices from AMP
    [Documentation]   Delete all devices from AMP
    [Tags]  Case 78
    DOMreadyByWaitTime  10
    ${count}  Get device count FT
    Run keyword if  ${count}!=0  Delete existing Devices from AMP
    ...  ELSE  Fail  No device to be deleted!
    Reload page
    DOMreadyByWaitTime  30

SNMP and AMON settings
    [Documentation]   SNMP and AMON settings
    [Tags]  Case 79
    Navigate To AMP Setup Page
    Customize Additional AMP services and verify SNMP polling
    
Add Devices and Poll
    [Documentation]  Add 2 controllers in folder1 and folder2 and poll the device
    ...
    [Tags]  Case 80
    Get Folder and controller details  Devices
    Create group  ${GroupName1}
    Create group  ${GroupName2}
    Create folder  ${FolderName1}
    Create folder  ${FolderName2}
    Run keyword and Continue on Failure  Add Controller  ${DeviceType1}  ${DeviceIPAddress1}  ${DeviceCommunityString1}  ${TelnetSSHUsername1}  ${TelnetSSHPassword1}  ${GroupName1}  ${FolderName1}
    DOMreadyByWaitTime  5
    Add Controller  ${DeviceType2}  ${DeviceIPAddress2}  ${DeviceCommunityString2}  ${TelnetSSHUsername2}  ${TelnetSSHPassword2}  ${GroupName2}  ${FolderName2}
    
Connected clients to the controller on Controller Monitoring Page
    [Documentation]   Compare Client count in AMP and Controller
    [Tags]  Case 18
    Navigate To Device Page
    Navigate To Device List Page
    DOMreadyByWaitTime  3
    Select Controller with Clients
    Get Client count and Compare
    




    
    


*** Variables ***
${SheetName}  Device_FT