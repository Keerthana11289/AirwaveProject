*** Settings ***
Documentation     Page/feature library for Login
...    
Suite Setup       Login And Verify
#Suite Teardown    LogoutAW
Library           SeleniumLibrary
Library           String
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Utilities/Data_Provider.robot
#Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../Keywords/Device/DeviceFeature.robot
Resource          ../../Keywords/VRFFT_Keywords/VRFFT_Keywords1.robot


      
*** Test Cases ***  

Add role Manage, monitor, None, Read, Disable
    [Documentation]  Add a role with Manage, monitor, None, Read, Disable
    ...    
    [Tags]  Case_AIR06
    Get role details  MMNRD06
    Create a role with details  MMNRD06
    Add User for Role  MMNRD06
    Add deployed device in admin  ${CampusName}
    LogoutAW
    Login with New User and role created  MMNRD06
    Validate VRF properties
    Validate Refresh option  ${CampusName}
    Check AP overlays
    Check Deployed device in user
    LogoutAW
    Login And Verify
    
    
    


*** Comments ***



Add role Manage, monitor, None, Read, Disable
    [Documentation]  Add a role with Manage, monitor, None, Read, Disable
    ...    
    [Tags]  Case_AIR06
    Create a role with details  MMNRD06
    

Add role Manage, monitor, None, Read, Read
    [Documentation]  Add a role with Manage, monitor, None, Read, Read
    ...    
    [Tags]  Case_AIR07
    Create a role with details  MMNRR07
    
Add role Manage, monitor, None, Read, Root
    [Documentation]  Add a role with Manage, monitor, None, Read, Root
    ...    
    [Tags]  Case_AIR08
    Create a role with details  MMNRR08

Add role Manage, monitor, None, Read/Write, Disable
    [Documentation]  Add role Manage, monitor, None, Read/Write, Disable
    ...    
    [Tags]  Case_AIR09
    Create a role with details  MMNRwD09
    
Add role Manage, monitor, None, Read/Write, Read
    [Documentation]  Add role Manage, monitor, None, Read/Write, Read
    ...    
    [Tags]  Case_AIR10
    Create a role with details  MMNRwR10
    
Add role Manage, monitor, None, Read/Write, Root
    [Documentation]  Add role Manage, monitor, None, Read/Write, Root
    ...    
    [Tags]  Case_AIR11
    Create a role with details  MMNRwR11
    
Add role Manage, monitor, Read, Read, Disable
    [Documentation]  Add role Manage, monitor, Read, Read, Disable
    ...    
    [Tags]  Case_AIR12
    Create a role with details  MMRRD12
    
Add role Manage, monitor, Read, Read, Read
    [Documentation]  Add role Manage, monitor, Read, Read, Read
    ...    
    [Tags]  Case_AIR13
    Create a role with details  MMRRR13
    
Add role Manage, monitor, Read, Read, Root
    [Documentation]  Add role Manage, monitor, Read, Read, Root
    ...    
    [Tags]  Case_AIR14
    Create a role with details  MMRRR14

Add role Manage, monitor, Read, Read/write, Disable
    [Documentation]  Add role Manage, monitor, Read, Read/write, Disable
    ...    
    [Tags]  Case_AIR15
    Create a role with details  MMRRwD15
    
Add role Manage, monitor, Read, Read/write, Read
    [Documentation]  Add role Manage, monitor, Read, Read/write, Read
    ...    
    [Tags]  Case_AIR16
    Create a role with details  MMRRwR16

Add role Manage, monitor, Read, Read/write, Root
    [Documentation]  Add role Manage, monitor, Read, Read/write, Root
    ...    
    [Tags]  Case_AIR17
    Create a role with details  MMRRwR17
    
Add role Manage, Manage, None, Read, Disable
    [Documentation]  Add role Manage, Manage, None, Read, Disable
    ...    
    [Tags]  Case_AIR18
    Create a role with details  MMNRD18

Add role Manage, Manage, None, Read, Read
    [Documentation]  Add role Manage, Manage, None, Read, Read
    ...    
    [Tags]  Case_AIR19
    Create a role with details  MMNRR19
    
Add role Manage, Manage, None, Read, Root
    [Documentation]  Add role Manage, Manage, None, Read, Root
    ...    
    [Tags]  Case_AIR20
    Create a role with details  MMNRR20
    
Add role Manage, Manage, None, Read/write, Disable
    [Documentation]  Add role Manage, Manage, None, Read/write, Disable
    ...    
    [Tags]  Case_AIR21
    Create a role with details  MMNRwD21
    
Add role Manage, Manage, None, Read/write, Read
    [Documentation]  Add role Manage, Manage, None, Read/write, Read
    ...    
    [Tags]  Case_AIR22
    Create a role with details  MMNRwR22
    
Add role Manage, Manage, None, Read/write, Root
    [Documentation]  Add role Manage, Manage, None, Read/write, Root
    ...    
    [Tags]  Case_AIR23
    Create a role with details  MMNRwR23
    
Add a user to the AMP
    [Documentation]  Add a user to the AMP
    ...    
    [Tags]  Case_AIR30
    Add new user  New user
    LogoutAW
    Login with New User and verify  New user
    Login And Verify
    
Check delete option unavailable for role with user
    [Documentation]  delete option unavailable
    ...    
    [Tags]  Case_AIR
    Verify Delete role with user  New user

Check delete option for role without user
    [Documentation]  delete option available
    ...    
    [Tags]  Case_AIR
    Verify Delete role without user  MMNRR07

Delete user and corresponding role
    [Documentation]  delete user and role 
    ...    
    [Tags]  Case_AIR
    Delete user and role  New user
    
Cleanup for all roles added  
    [Documentation]  delete all created role 
    ...    
    [Tags]  Case_AIR
    @{RoleList}  Create List  MMNRR08  MMNRwD09  MMNRwR10  MMNRwR11  MMRRD12  MMRRR13  MMRRR14  MMRRwD15  MMRRwR16  MMRRwR17  MMNRD18  MMNRR19  MMNRR20  MMNRwD21  MMNRwR22  MMNRwR23
    Delete all created roles  @{RoleList}

Create Readonly User - Monitor and validate 
    Create Role for user  ReadonlyUser(Monitor)
    Create User with role  ReadonlyUser(Monitor)
    LogoutAW
    Login with New User and Validate  ReadonlyUser(Monitor)
    Login And Verify

Create Readonly User - Audit and validate 
    Create Role for user  ReadonlyUser(Audit)
    Create User with role  ReadonlyUser(Audit)
    LogoutAW
    Login with New User and Validate  ReadonlyUser(Audit)
    Login And Verify
    
Create ReadWrite User and validate
    Create Role for user  ReadWriteUser
    Create User with role  ReadWriteUser
    LogoutAW
    Login with New User and verify  ReadWriteUser
  #  Check for the properties of Read Write User
    Create Campus,building and floor  ReadWriteUser
    Cleanup for Create Campus, Building and New Floor  ReadWriteUser
    LogoutAW
    Login And Verify



CleanUp For Roles And User created 
    Delete user and role  ReadonlyUser(Monitor)
    Delete user and role  ReadonlyUser(Audit)
    Delete user and role  ReadWriteUser
    
    
Verify role type Airwave Management client
    [Documentation]  Verify role type Airwave Management client
    Check the role type of Airwave Management client  
    
Verify the role type Guest Access Sponsor
    [Documentation]  Verify the role type Guest Access Sponsor
    Check the role type of Guest Access Sponsor  Top

    

Check for User page default view
    [Documentation]  Check for the User page default view
    Check the User page default view
    
Check for Display client diagnostics screens under roles
    [Documentation]  Display client diagnostics screen under roles
    Check the Display client diagnostics screens  Top
    

Check for VisualRF user Guide
    [Documentation]  Check for Enable of VisualRF
    [Tags]  Case 28
    Navigate To Home Page
    Navigate To Visual RF Page
    Check for the Help Icon Title
    
    
Cleanup for Roles 
    Get Vrf Case details  VrfDetails
    Role cleanup  ${RoleName1}  ${LoginPwd}
    Role cleanup  ${RoleName2}  ${LoginPwd}
    Role cleanup  ${RoleName3}  ${LoginPwd}
      


*** Comments ***


*** Variables ***
${SheetName}  VRF1_FT


  


