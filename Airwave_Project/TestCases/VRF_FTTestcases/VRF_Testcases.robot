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
Resource          ../../Keywords/Device/DeviceFeature.robot
Resource          ../../Keywords/VRFFT_Keywords/VRFFT_Keywords.robot

*** Test Cases ***  




*** Comments ***
Create A role and user to add roles
    Get Role and User details  RoleUser
    Create commom role  ${LoginPwd}  ${RoleName} 
    Create common User  ${LoginPwd}  ${UserName}  ${UserPwd}  ${RoleName}  
    Creation of campus,building and floor  RoleUser



### Readonly VRF ###

Add role Manage, monitor, None, Read, Disable
    [Documentation]  Add a role with Manage, monitor, None, Read, Disable
    ...    
    [Tags]  Case_AIR06
    Update role with details  MMNRD06  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties
    Check Campus and building in user  RoleUser
    Validate Refresh option
    Check AP overlays
    LogoutAW
    Login And Verify
    
Add role Manage, monitor, None, Read, Read
    [Documentation]  Add a role with Manage, monitor, None, Read, Read
    ...    
    [Tags]  Case_AIR07
    Update role with details  MMNRR07  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties
    Check Campus and building in user  RoleUser
    Validate Refresh option
    Check AP overlays
    LogoutAW
    Login And Verify
    
Add role Manage, monitor, None, Read, Root
    [Documentation]  Add a role with Manage, monitor, None, Read, Root
    ...    
    [Tags]  Case_AIR08
    Update role with details  MMNRR08  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties
    Check Campus and building in user  RoleUser
    Validate Refresh option
    Check AP overlays
    LogoutAW
    Login And Verify
    
Add role Manage, monitor, Read, Read, Disable
    [Documentation]  Add role Manage, monitor, Read, Read, Disable
    ...    
    [Tags]  Case_AIR12
    Update role with details  MMRRD12  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties
    Check Campus and building in user  RoleUser
    Validate Refresh option
    Check AP overlays
    LogoutAW
    Login And Verify
    
Add role Manage, monitor, Read, Read, Read
    [Documentation]  Add role Manage, monitor, Read, Read, Read
    ...    
    [Tags]  Case_AIR13
    Update role with details  MMRRR13  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties
    Check Campus and building in user  RoleUser
    Validate Refresh option
    Check AP overlays
    LogoutAW
    Login And Verify
    
Add role Manage, monitor, Read, Read, Root
    [Documentation]  Add role Manage, monitor, Read, Read, Root
    ...    
    [Tags]  Case_AIR14
    Update role with details  MMRRR14  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties
    Check Campus and building in user  RoleUser
    Validate Refresh option
    Check AP overlays
    LogoutAW
    Login And Verify

      
Add role Manage, Manage, None, Read, Disable
    [Documentation]  Add role Manage, Manage, None, Read, Disable
    ...    
    [Tags]  Case_AIR18
    Update role with details  MMNRD18  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties
    Check Campus and building in user  RoleUser
    Validate Refresh option
    Check AP overlays
    LogoutAW
    Login And Verify

Add role Manage, Manage, None, Read, Read
    [Documentation]  Add role Manage, Manage, None, Read, Read
    ...    
    [Tags]  Case_AIR19
    Update role with details  MMNRR19  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties
    Check Campus and building in user  RoleUser
    Validate Refresh option
    Check AP overlays
    LogoutAW
    Login And Verify
    
Add role Manage, Manage, None, Read, Root
    [Documentation]  Add role Manage, Manage, None, Read, Root
    ...    
    [Tags]  Case_AIR20
    Update role with details  MMNRR20  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties
    Check Campus and building in user  RoleUser
    Validate Refresh option
    Check AP overlays
    LogoutAW
    Login And Verify
    

### ReadWrite VRF ###
Add role Manage, monitor, None, Read/Write, Disable
    [Documentation]  Add role Manage, monitor, None, Read/Write, Disable
    ...    
    [Tags]  Case_AIR09
    Update role with details  MMNRwD09  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties for ReadWrite
    Creation of campus,building and floor  MMNRwD09
    Get VRF data  MMNRwD09
    Cleanup for Campus, Building and New Floor  ${CampusName}
    LogoutAW
    Login And Verify
    
Add role Manage, monitor, None, Read/Write, Read
    [Documentation]  Add role Manage, monitor, None, Read/Write, Read
    ...    
    [Tags]  Case_AIR10
    Update role with details  MMNRwR10  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties for ReadWrite
    LogoutAW
    Login And Verify
    
Add role Manage, monitor, None, Read/Write, Root
    [Documentation]  Add role Manage, monitor, None, Read/Write, Root
    ...    
    [Tags]  Case_AIR11
    Update role with details  MMNRwR11  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties for ReadWrite
    LogoutAW
    Login And Verify
    
Add role Manage, monitor, Read, Read/write, Disable
    [Documentation]  Add role Manage, monitor, Read, Read/write, Disable
    ...    
    [Tags]  Case_AIR15
    Update role with details  MMRRwD15  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties for ReadWrite
    LogoutAW
    Login And Verify
    
Add role Manage, monitor, Read, Read/write, Read
    [Documentation]  Add role Manage, monitor, Read, Read/write, Read
    ...    
    [Tags]  Case_AIR16
    Update role with details  MMRRwR16  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties for ReadWrite
    LogoutAW
    Login And Verify

Add role Manage, monitor, Read, Read/write, Root
    [Documentation]  Add role Manage, monitor, Read, Read/write, Root
    ...    
    [Tags]  Case_AIR17
    Update role with details  MMRRwR17  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties for ReadWrite
    LogoutAW
    Login And Verify
    
Add role Manage, Manage, None, Read/write, Disable
    [Documentation]  Add role Manage, Manage, None, Read/write, Disable
    ...    
    [Tags]  Case_AIR21
    Update role with details  MMNRwD21  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties for ReadWrite
    LogoutAW
    Login And Verify
    
Add role Manage, Manage, None, Read/write, Read
    [Documentation]  Add role Manage, Manage, None, Read/write, Read
    ...    
    [Tags]  Case_AIR22
    Update role with details  MMNRwR22  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties for ReadWrite
    LogoutAW
    Login And Verify
    
Add role Manage, Manage, None, Read/write, Root
    [Documentation]  Add role Manage, Manage, None, Read/write, Root
    ...    
    [Tags]  Case_AIR23
    Update role with details  MMNRwR23  RoleUser
    LogoutAW
    Login New user with role  RoleUser
    Validate VRF properties for ReadWrite
    LogoutAW
    Login And Verify
    
    




### Cleanup ###
Cleanup for Create Campus, Building and New Floor
    [Documentation]  delete Campus, Building and New Floor 
    ...    
    [Tags]  Case_AIR
    Get VRF data  RoleUser
    Cleanup for Campus, Building and New Floor  ${CampusName}

Delete user and corresponding role
    [Documentation]  delete user and role 
    ...    
    [Tags]  Case_AIR
    Delete user and role  RoleUser
   
    















*** Variables ***
${SheetName}  VRF_FT