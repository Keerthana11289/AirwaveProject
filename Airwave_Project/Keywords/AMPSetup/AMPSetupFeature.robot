*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Locators/AMPSetupPage.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Utilities/Data_Provider.robot

*** Variables ***
${RoleName}  Role01
${adminPassword}  admin
${accessLevel}  Device Manager
${deviceaccessLevel}  Monitor (Read Only)
${FolderName}  Top
${RAPIDLevelAccess}  None
${VRFLevel}  Read Only
${username}  testuser
${password}  Aruba@123
${name}  User01
${email}  test@gmail.com
${phoneNo}  9876543210
${notes}  Test Notes


*** Keywords ***
Create a New Role
    [Documentation]  Creating a new role.
    ...    
    [Arguments]  ${RoleName}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    Click  ${Loc_AMPSetup_AddRole}
    WaitForElementPresent  ${Loc_AMPSetup_AddRolePage_AMPCancelButton}
    Type Text  ${Loc_AMPSetup_AddRolePage_AdminPassword}  ${aw10_ui_password}
    Type Text  ${Loc_AMPSetup_AddRolePage_RoleName}  ${RoleName}
    Select Dropdown LabelValue  ${Loc_AMPSetup_AddRolePage_AMPAccessLevel}  ${AccessLevel}
    Select Dropdown LabelValue  ${Loc_AMPSetup_AddRolePage_AMPDeviceAccessLevel}  ${DeviceAccessLevel}
    Select From Dropdown List  ${Loc_AMPSetup_AddRolePage_AMPFolderAccessLevel}  ${FolderName}
    Select Dropdown LabelValue  ${Loc_AMPSetup_AddRolePage_AMPRAPIDSAccessLevel}  ${RAPIDLevelAccess}
    Select Dropdown LabelValue  ${Loc_AMPSetup_AddRolePage_AMPVRFAccessLevel}  ${VRFLevel}
    Click  ${Loc_AMPSetup_AddRolePage_AMPAddButton}
    AssertForTableElementPresent  ${RoleName}
    Log  Role created successfully..!  console=true
    
Delete Role
    [Documentation]  Deleting a created user.
    ...    
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    ${locator}  Catenate  SEPARATOR=  //td[text()='  ${RoleName}']/ancestor::*/td/input
    Wait Until Element Is Visible  ${locator}  30s
    Click  ${locator}
    Click  ${Loc_AMPSetup_RoleTable_DeleteButton}
    # Confirmation page
    Wait Until Element Is Visible  ${Loc_AMPSetup_RoleTable_DeleteButton}  30s
    Click  ${Loc_AMPSetup_RoleTable_DeleteButton}
    AssertForTableElementNotPresent  ${RoleName}
    Log  Role deleted successfully..!  console=true
    
Create a New User
    [Documentation]  Creating a new user.
    Navigate To AMP Setup Page
    Navigate To AMP Setup Users Page
    Click  ${Loc_AMPSetup_AddUser}
    WaitForElementPresent  ${Loc_AMPSetup_AddUserPage_CancelButton}
    Type Text  ${Loc_AMPSetup_AddUserPage_AdminPassword}  ${aw10_ui_password}
    Type Text  ${Loc_AMPSetup_AddUserPage_Username}  ${Username}
    Select Dropdown LabelValue  ${Loc_AMPSetup_AddUserPage_Role}  ${RoleName}
    Type Text  ${Loc_AMPSetup_AddUserPage_Password}  ${Password}
    Type Text  ${Loc_AMPSetup_AddUserPage_ConfirmPassword}  ${Password}
    Type Text  ${Loc_AMPSetup_AddUserPage_Name}  ${Name}
    Type Text  ${Loc_AMPSetup_AddUserPage_Email}  ${Email}
    Type Text  ${Loc_AMPSetup_AddUserPage_Phone}  ${PhoneNo}
    Type Text  ${Loc_AMPSetup_AddUserPage_Notes}  ${Notes}
    Click  ${Loc_AMPSetup_AddUserPage_AddButton}
    AssertForTableElementPresent  ${Username}
    Log  User created successfully..!  console=true

Delete User
    [Documentation]  Deleting a created user.
    Navigate To AMP Setup Page
    Navigate To AMP Setup Users Page
    ${locator}  Catenate  SEPARATOR=  //td[text()='  ${Username}']/ancestor::*/td/input
    Wait Until Element Is Visible  ${locator}  30s
    Click  ${locator}
    Click  ${Loc_AMPSetup_UserTable_DeleteButton}
    # Confirmation page
    Wait Until Element Is Visible  ${Loc_AMPSetup_UserTable_DeleteButton}  30s
    Click  ${Loc_AMPSetup_UserTable_DeleteButton}
    AssertForTableElementNotPresent  ${Username}
    Log  User deleted successfully..!  console=true

Login As RAPIDS User
    [Documentation]  Creating a new user.
    ...    
    Login As User  ${Username}  ${Password}
    Sleep  5s
    Log  Successfully logged in as RAPID user..!  console=true


Roles Data Setup
  # [Arguments]    ${TestcaseName}
  # ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  # Set Suite Variable  ${This_DataProvider}
  # Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${GroupNameList} =  Data_Provider.GetDataProviderColumnValue  Data_GroupName
  ${GroupName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GroupNameList}  1
  Set Suite Variable  ${GroupName}
  ${FolderNameList} =  Data_Provider.GetDataProviderColumnValue  Data_FolderName
  ${folderaccess} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FolderNameList}  1
  Set Suite Variable  ${folderaccess}
  ${ParentFolderNameList} =  Data_Provider.GetDataProviderColumnValue  Data_ParentFolderName
  ${ParentFolderName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ParentFolderNameList}  1
  Set Suite Variable  ${ParentFolderName}
  ${RoleNameList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleName
  ${roleName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleNameList}  1
  Set Suite Variable  ${roleName}
  ${UsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_Username
  ${username} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UsernameList}  1
  Set Suite Variable  ${username}
  ${PasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_Password
  ${password} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  1
  Set Suite Variable  ${password}
  ${NameList} =  Data_Provider.GetDataProviderColumnValue  Data_Name
  ${name} =  Data_Provider.DataProviderSplitterForMultipleValues  ${NameList}  1
  Set Suite Variable  ${name}
  ${EmailList} =  Data_Provider.GetDataProviderColumnValue  Data_Email
  ${email} =  Data_Provider.DataProviderSplitterForMultipleValues  ${EmailList}  1
  Set Suite Variable  ${email}
  ${AccessLevelList} =  Data_Provider.GetDataProviderColumnValue  Data_AccessLevel
  ${accessLevel} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AccessLevelList}  1
  Set Suite Variable  ${accessLevel}
  ${DeviceAccessLevelList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceAccessLevel
  ${deviceaccessLevel} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceAccessLevelList}  1
  Set Suite Variable  ${deviceaccessLevel}
  ${RAPIDLevelAccessList} =  Data_Provider.GetDataProviderColumnValue  Data_RAPIDLevelAccess
  ${RAPIDLevelAccess} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RAPIDLevelAccessList}  1
  Set Suite Variable  ${RAPIDLevelAccess}
  ${VRFLevelList} =  Data_Provider.GetDataProviderColumnValue  Data_VRFLevel
  ${VRFLevel} =  Data_Provider.DataProviderSplitterForMultipleValues  ${VRFLevelList}  1
  Set Suite Variable  ${VRFLevel}
  ${PhoneNoList} =  Data_Provider.GetDataProviderColumnValue  Data_PhoneNo
  ${phoneNo} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PhoneNoList}  1
  Set Suite Variable  ${phoneNo}
  ${NotesList} =  Data_Provider.GetDataProviderColumnValue  Data_Notes
  ${notes} =  Data_Provider.DataProviderSplitterForMultipleValues  ${NotesList}  1
  Set Suite Variable  ${notes}