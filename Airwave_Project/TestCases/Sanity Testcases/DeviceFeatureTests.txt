*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Locators/DeviceSetupPages.robot
Resource          ../../Keywords/Device/DeviceFeature.robot
Resource          ../../Keywords/RAPIDS/RAPIDSPage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Keywords/APMonitoringPage/APMonitoringPage.robot
Resource          ../../Keywords/AMPSetup/AMPSetupFeature.robot
Resource          ../../Utilities/Data_Provider.robot


*** Test Cases ***
None Rapids without device
    [Documentation]  Here Getting the test data from 'RAPIDS' sheet - "None Rapids without device" Test case column name. 
    [Tags]  smokeTest
    [Setup]  Login And Verify
    RAPIDS Data Setup  None Rapids without device
    Create a New Group  ${GroupName}
    Create a New Folder  ${FolderName}
    Create a New Role  ${RoleName}
    Create a New User
    Logout from AMP
    Login As RAPIDS User
    ${isDisplayed}  Assert RAPIDS Tab Displayed
    Logout from AMP
    Login To AMP
    Delete User
    Delete Role
    Delete Group  ${GroupName}
    Delete Folder  ${FolderName}
    Should Not Be True  ${isDisplayed}
    Log  'None Rapids without device' testcase executed successfully..!  console=true
    [Teardown]  LogoutAW
    
None RAPIDS with Device
   [Documentation]  Here Getting the test data from 'RAPIDS' sheet - "None RAPIDS with Device" Test case column name.
   ...     
   [Tags]  smokeTest
   [Setup]  Login And Verify
   RAPIDS Data Setup  None RAPIDS with Device
   Navigate To Home Page
   Create a New Group  ${GroupName}
   Create a New Folder  ${FolderName}
   Move the existing device to the created folder  ${DeviceName}  ${FolderName}
   Create a New Role  ${RoleName}  
   Create a New User
   Logout from AMP
   Login As RAPIDS User
   ${isDisplayed}  Assert RAPIDS Tab Displayed
   Logout from AMP
   Login To AMP
   Move the devices from the created folder to TOP folder  ${DeviceName}  ${FolderName}
   Delete User
   Delete Role
   Delete Group  ${GroupName}
   Delete Folder  ${FolderName}
   Should Not Be True  ${isDisplayed}
   Log  'None Rapids with device' testcase executed successfully..!  console=true
   [Teardown]  LogoutAW 

Read-Only Rapids without device
    [Documentation]  Here Getting the test data from 'RAPIDS' sheet - "Read-Only Rapids without device" Test case column name. 
    [Tags]  smokeTest1
    [Setup]  Login And Verify
    RAPIDS Data Setup  Read-Only Rapids without device
    Navigate To Home Page
    Create a New Group  ${GroupName}
    Create a New Folder  ${FolderName}
    Create a New Role  ${RoleName}
    Create a New User
    Logout from AMP
    Login As RAPIDS User
    Navigate To RAPIDS Page
    Navigate To RAPIDS List Page
    ${isDisplayed}  Check whether any rogues displayed or not
    ${isDisplayed}  Assert RAPIDS Tab Displayed
    Logout from AMP
    Login To AMP
    Delete User
    Delete Role
    Delete Group  ${GroupName}
    Delete Folder  ${FolderName}
    Should Be True  ${isDisplayed}
    Log  'Read-Only Rapids without device' testcase executed successfully..!  console=true
    [Teardown]  LogoutAW
   
Read-Only RAPIDS with Device
   [Documentation]  Here Getting the test data from 'RAPIDS' sheet - "Read-Only RAPIDS with Device" Test case column name.
   ...     
   [Tags]  smokeTest1
   [Setup]  Login And Verify
   RAPIDS Data Setup  Read-Only RAPIDS with Device
   Navigate To Home Page
   Create a New Group  ${GroupName}
   Create a New Folder  ${FolderName}
   Move the existing device to the created folder  ${DeviceName}  ${FolderName}
   Create a New Role  ${RoleName}  
   Create a New User
   Logout from AMP
   Login As RAPIDS User
   Navigate To RAPIDS Page
   Navigate To RAPIDS List Page
   ${isDisplayed}  Check whether any rogues displayed or not
   Run Keyword If  ${isDisplayed}  Click on AP link from rogue list
   ${apName}  Get the controller name from AP Monitor page
   ${status}  Should Be Equal As Strings  ${apName}  ${DeviceName}
   Logout from AMP
   Login To AMP
   Move the devices from the created folder to TOP folder  ${DeviceName}  ${FolderName}
   Delete User
   Delete Role
   Delete Group  ${GroupName}
   Delete Folder  ${FolderName}
   Should Not Be True  ${isDisplayed}
   Should Be True  ${status}
   Log  'Read-Only RAPIDS with Device' testcase executed successfully..!  console=true
   [Teardown]  LogoutAW 

Read-Write RAPIDS with Device
   [Documentation]  Here Getting the test data from 'RAPIDS' sheet - "Read-Write RAPIDS with Device" Test case column name.
   ...     
   [Tags]  smokeTest
   [Setup]  Login And Verify
   RAPIDS Data Setup  Read-Write RAPIDS with Device
   Navigate To Home Page
   Create a New Group  ${GroupName}
   Create a New Folder  ${FolderName}
   Move the existing device to the created folder  ${DeviceName}  ${FolderName}
   Create a New Role  ${RoleName}  
   Create a New User
   Logout from AMP
   Login As RAPIDS User
   Navigate To RAPIDS Page
   Navigate To RAPIDS List Page
   ${isDisplayed}  Check whether any rogues displayed or not
   Run Keyword If  ${isDisplayed}  Click on AP link from rogue list
   ${apName}  Get the controller name from AP Monitor page
   ${status}  Should Be Equal As Strings  ${apName}  ${DeviceName}
   Logout from AMP
   Login To AMP
   Move the devices from the created folder to TOP folder  ${DeviceName}  ${FolderName}
   Delete User
   Delete Role
   Delete Group  ${GroupName}
   Delete Folder  ${FolderName}
   Should Not Be True  ${isDisplayed}
   Should Be True  ${status}
   Log  'Read-Write RAPIDS with Device' testcase executed successfully..!  console=true
   [Teardown]  LogoutAW
   
List Page - Read-only RAPIDS
   [Documentation]  Here Getting the test data from 'RAPIDS' sheet - "List Page - Read-only RAPIDS" Test case column name.
   ...     
   [Tags]  smokeTest
   [Setup]  Login And Verify
   RAPIDS Data Setup  List Page - Read-only RAPIDS
   Navigate To Home Page
   Create a New Group  ${GroupName}
   Create a New Folder  ${FolderName}
   Move the existing device to the created folder  ${DeviceName}  ${FolderName}
   Create a New Role  ${RoleName}  
   Create a New User
   Change RAPIDS Export Threshold  ${RAPIDSExportThresholdType}
   Logout from AMP
   Login As RAPIDS User
   Navigate To RAPIDS Page
   Navigate To RAPIDS List Page
   ${isDisplayed}  Check whether Modify devices link is not present
   Logout from AMP
   Login To AMP
   Move the devices from the created folder to TOP folder  ${DeviceName}  ${FolderName}
   Delete User
   Delete Role
   Delete Group  ${GroupName}
   Delete Folder  ${FolderName}
   Should Not Be True  ${isDisplayed}
   Log  'List Page - Read-only RAPIDS' testcase executed successfully..!  console=true
   [Teardown]  LogoutAW

List Page - Read-write RAPIDS
   [Documentation]  Here Getting the test data from 'RAPIDS' sheet - "List Page - Read-write RAPIDS" Test case column name.
   ...     
   [Tags]  smokeTest
   [Setup]  Login And Verify
   RAPIDS Data Setup  List Page - Read-write RAPIDS
   Navigate To Home Page
   Create a New Group  ${GroupName}
   Create a New Folder  ${FolderName}
   Move the existing device to the created folder  ${DeviceName}  ${FolderName}
   Create a New Role  ${RoleName}  
   Create a New User
   Change RAPIDS Export Threshold  ${RAPIDSExportThresholdType}
   Logout from AMP
   Login As RAPIDS User
   Navigate To RAPIDS Page
   Navigate To RAPIDS List Page
   ${isDisplayed}  Check whether Modify devices link is not present
   Logout from AMP
   Login To AMP
   Move the devices from the created folder to TOP folder  ${DeviceName}  ${FolderName}
   Delete User
   Delete Role
   Delete Group  ${GroupName}
   Delete Folder  ${FolderName}
   Should Be True  ${isDisplayed}
   Log  'List Page - Read-write RAPIDS' testcase executed successfully..!  console=true
   [Teardown]  LogoutAW

Classify Rogue devices
   [Documentation]  Here Getting the test data from 'RAPIDS' sheet - "Classify Rogue devices" Test case column name.
   ...     
   [Tags]  smokeTest
   [Setup]  Login And Verify
   RAPIDS Data Setup  Classify ROGUE devices
   Navigate To Home Page
   Create a New Group  ${GroupName}
   Create a New Folder  ${FolderName}
   Move the existing device to the created folder  ${DeviceName}  ${FolderName}
   Create a New Role  ${RoleName}  
   Create a New User
   Change RAPIDS Export Threshold  ${RAPIDSExportThresholdType}
   Logout from AMP
   Login As RAPIDS User
   Navigate To RAPIDS Page
   Navigate To RAPIDS List Page
   ${rogueName}  Get the First Rogue Name from the RAPIDS table
   Click on Modify Devices link
   ${status}  Run Keyword And Return Status  Delete the rogue from RAPIDS list and Verfiy  ${rogueName}
   Logout from AMP
   Login To AMP
   Move the devices from the created folder to TOP folder  ${DeviceName}  ${FolderName}
   Delete User
   Delete Role
   Delete Group  ${GroupName}
   Delete Folder  ${FolderName}
   Should Be True  ${status}
   Log  'Classify ROGUE devices' testcase executed successfully..!  console=true
   [Teardown]  LogoutAW 

*** Keywords ***
RAPIDS Data Setup
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${GroupNameList} =  Data_Provider.GetDataProviderColumnValue  Data_GroupName
  ${GroupName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GroupNameList}  1
  Set Suite Variable  ${GroupName}
  ${FolderNameList} =  Data_Provider.GetDataProviderColumnValue  Data_FolderName
  ${FolderName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FolderNameList}  1
  Set Suite Variable  ${FolderName}
  ${ParentFolderNameList} =  Data_Provider.GetDataProviderColumnValue  Data_ParentFolderName
  ${ParentFolderName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ParentFolderNameList}  1
  Set Suite Variable  ${ParentFolderName}
  ${DeviceTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceType
  ${DeviceType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceTypeList}  1
  Set Suite Variable  ${DeviceType}
  ${DeviceNameList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceName
  ${DeviceName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceNameList}  1
  Set Suite Variable  ${DeviceName}
  ${DeviceIPAddressList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceIPAddress
  ${DeviceIPAddress} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceIPAddressList}  1
  Set Suite Variable  ${DeviceIPAddress}
  ${DeviceCommunityStringList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceCommunityString
  ${DeviceCommunityString} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceCommunityStringList}  1
  Set Suite Variable  ${DeviceCommunityString}
  ${TelnetSSHUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_TelnetSSHUsername
  ${TelnetSSHUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TelnetSSHUsernameList}  1
  Set Suite Variable  ${TelnetSSHUsername}
  ${TelnetSSHPasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_TelnetSSHPassword
  ${TelnetSSHPassword} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TelnetSSHPasswordList}  1
  Set Suite Variable  ${TelnetSSHPassword}
  ${RoleNameList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleName
  ${RoleName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleNameList}  1
  Set Suite Variable  ${RoleName}
  ${UsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_Username
  ${Username} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UsernameList}  1
  Set Suite Variable  ${Username}
  ${PasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_Password
  ${Password} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  1
  Set Suite Variable  ${Password}
  ${NameList} =  Data_Provider.GetDataProviderColumnValue  Data_Name
  ${Name} =  Data_Provider.DataProviderSplitterForMultipleValues  ${NameList}  1
  Set Suite Variable  ${Name}
  ${EmailList} =  Data_Provider.GetDataProviderColumnValue  Data_Email
  ${Email} =  Data_Provider.DataProviderSplitterForMultipleValues  ${EmailList}  1
  Set Suite Variable  ${Email}
  ${AccessLevelList} =  Data_Provider.GetDataProviderColumnValue  Data_AccessLevel
  ${AccessLevel} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AccessLevelList}  1
  Set Suite Variable  ${AccessLevel}
  ${DeviceAccessLevelList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceAccessLevel
  ${DeviceAccessLevel} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceAccessLevelList}  1
  Set Suite Variable  ${DeviceAccessLevel}
  ${RAPIDLevelAccessList} =  Data_Provider.GetDataProviderColumnValue  Data_RAPIDLevelAccess
  ${RAPIDLevelAccess} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RAPIDLevelAccessList}  1
  Set Suite Variable  ${RAPIDLevelAccess}
  ${VRFLevelList} =  Data_Provider.GetDataProviderColumnValue  Data_VRFLevel
  ${VRFLevel} =  Data_Provider.DataProviderSplitterForMultipleValues  ${VRFLevelList}  1
  Set Suite Variable  ${VRFLevel}
  ${PhoneNoList} =  Data_Provider.GetDataProviderColumnValue  Data_PhoneNo
  ${PhoneNo} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PhoneNoList}  1
  Set Suite Variable  ${PhoneNo}
  ${NotesList} =  Data_Provider.GetDataProviderColumnValue  Data_Notes
  ${Notes} =  Data_Provider.DataProviderSplitterForMultipleValues  ${NotesList}  1
  Set Suite Variable  ${Notes}
  ${RAPIDSExportThresholdList} =  Data_Provider.GetDataProviderColumnValue  Data_RAPIDSExportThreshold
  ${RAPIDSExportThresholdType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RAPIDSExportThresholdList}  1
  Set Suite Variable  ${RAPIDSExportThresholdType}  
    
*** Variables ***
${SheetName}  RAPIDS
${GroupName}
${FolderName}
${RAPIDSExportThresholdType}