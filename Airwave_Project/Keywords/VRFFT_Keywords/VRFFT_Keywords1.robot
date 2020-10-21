*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
#Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../Locators/DevicesFT.robot
Resource          ../../Locators/VRF.robot
Resource          ../../Utilities/Data_Provider.robot
Library           ../../Utilities/Common/WebdriverHelper.py

*** Keywords ***

Create Role for user
    [Arguments]  ${TestCase}
    Get role and user details  ${TestCase}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    DOMreadyByWaitTime  5
    Click  ${Loc_AddUser}
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Type  ${Loc_RoleUsername}  ${RoleForUser}
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${Loc_DevAccess_Dropdown}  ${DeviceAccess}
    DOMreadyByWaitTime  2
    Click  ${Loc_FolderDropdown}
    DOMreadyByWaitTime  3
    Click  ${Loc_FolderDropdown}//*[contains(text(),'${RoleFolder}')]
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${VRF_Dropdown}  ${VisualRf}
    DOMreadyByWaitTime  2
    Click  ${Loc_AdduserAdd}
    DOMreadyByWaitTime  5
    WaitForElementPresent  ${Loc_AddSuccessful}
    Log  New role - ${RoleForUser} created!  console=True
    
Create User with role
    [Arguments]  ${TestCase}
    Get role and user details  ${TestCase}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Users Page
    Click  ${Loc_AddUser}
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Type  ${Loc_ReadonlyUsername}  ${UserName}
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${Loc_RoleDropdown}  ${RoleForUser}
    DOMreadyByWaitTime  2
    Type  ${Loc_ReadonlyPwd}  ${UserPwd}
    Type  ${Loc_ReadonlycnfrmPwd}  ${UserPwd}
    DOMreadyByWaitTime  2
    Click  ${Loc_AdduserAdd}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_AddSuccessful}
    Log  New user- ${UserName} created!  console=True
    
Login with New User and Validate
    [Arguments]  ${TestCase}
    Get role and user details  ${TestCase}
    Login As User  ${UserName}  ${UserPwd}
    DOMreadyByWaitTime  10
    Verify groups,Device,System,VRF properties
    LogoutAW

Verify groups,Device,System,VRF properties
    Navigate to Group Page
    Navigate To Group List Page
    DOMreadyByWaitTime  5
    AssertForElementNotPresent  ${Loc_AddGroupButton_cssFT}
    Log  Group cannot be created in new user!  console=True
    AssertForElementNotPresent  ${DeviceSetupLink_css}
    Log  New Devices cannot be added to new user!  console=True
    Navigate To Systems Page
    DOMreadyByWaitTime  5
    AssertForElementNotPresent  ${System_Triggers_css}
    Log  System is not accessible to new user!  console=True
    Navigate To Visual RF Page
    DOMreadyByWaitTime  5
    AssertForElementNotPresent  ${VisualRF_Setup_css}
    AssertForElementNotPresent  ${VisualRF_Import_css}
    AssertForElementNotPresent  ${VisualRF_AuditLog_css}
    Log  Visual Rf doesn't have Audit, Setup and Import option for new user!  console=True
    

Create a role with details
    [Arguments]  ${TestCase}
    Get role details  ${TestCase}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    DOMreadyByWaitTime  5
    Click  ${Loc_AddUser}
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Type  ${Loc_RoleUsername}  ${RoleName}
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${Loc_DevAccess_Dropdown}  ${DeviceAccess}
    DOMreadyByWaitTime  2
    Click  ${Loc_FolderDropdown}
    DOMreadyByWaitTime  3
    Click  ${Loc_FolderDropdown}//*[contains(text(),'${RoleFolder}')]
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${Loc_RapidsDropdown}  ${RAPIDS}
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${VRF_Dropdown}  ${VisualRf}
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${Loc_SignonDropdown}  ${SignOnrole}
    DOMreadyByWaitTime  2
 #   Click  //*[@name="allow_reboot_device" and @value="${AllowReboot}"]
    Click  ${Loc_AdduserAdd}
    DOMreadyByWaitTime  5
    WaitForElementPresent  ${Loc_AddSuccessful}
    Log  New Role - ${RoleName} with Manage, ${DeviceAccess}, ${RAPIDS}, ${VisualRf}, ${SignOnrole} -${RoleFolder} folder created!  console=True


Add User for Role
    [Arguments]  ${TestCase}
    Get role details  ${TestCase}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Users Page
    Click  ${Loc_AddUser}
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Type  ${Loc_ReadonlyUsername}  ${UserName}
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${Loc_RoleDropdown}  ${RoleName}
    DOMreadyByWaitTime  2
    Type  ${Loc_ReadonlyPwd}  ${UserPwd}
    Type  ${Loc_ReadonlycnfrmPwd}  ${UserPwd}
    DOMreadyByWaitTime  2
    Click  ${Loc_AdduserAdd}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_AddSuccessful}
    Log  New user- ${UserName} created!  console=True
   
Login with New User and role created
    [Arguments]  ${TestCase}
    Get role details  ${TestCase}
    Login As User  ${UserName}  ${UserPwd}
    DOMreadyByWaitTime  10
    Log  User - ${UserName} login verified!  console=True
    DOMreadyByWaitTime  5
    

Click FLoor
    [Arguments]  ${CampusName}
    Navigate to Visual Rf Page
    DOMreadyByWaitTime  5
    ${SelectCampus}  Catenate  ${Loc_SelectCampus_xpath}  text()='${CampusName}']
    Double Click  ${SelectCampus}
    Sleep  5s
    Click  ${viewbutton_css}
    Sleep  3s
    Click  //*[text()='Buildings']/parent::*//*[@class="table_component_column"]//*[text()='Default Building']
    Sleep  5s
    Click  ${viewbutton_css}
    Sleep  3s
    Click  //*[text()='Floors']/parent::*//*[@class="table_component_column"]//*[contains(@class,'fake_link')]
    Sleep  5s    

Add deployed device in admin
    [Arguments]  ${CampusName}
    Click FLoor  ${CampusName}
    Sleep  5s
    Add deployed device to floor plan
    
Validate Refresh option
    [Arguments]  ${CampusName}
    Click FLoor  ${CampusName}
    Click  ${Loc_RefreshIcon}
    DOMreadyByWaitTime  10
    assertForElementPresent  ${Loc_NetworkVer}
    Log  Refresh Floor plan verified!  console=True
        

Validate VRF properties
    Navigate To Visual RF Page
    DOMreadyByWaitTime  5
    AssertForElementNotPresent  ${VisualRF_Setup_css}
    AssertForElementNotPresent  ${VisualRF_Import_css}
    AssertForElementNotPresent  ${VisualRF_AuditLog_css}
    Log  Visual Rf doesn't have Audit, Setup and Import option for new user!  console=True
    
Check AP overlays
    Click  ${viewbutton_css}
    Sleep  3s
    @{list}  Create List  ${Attr1}  ${Attr2}  ${Attr3}  ${Attr4}  ${Attr5}  
    ${state}  Set Variable  True
    @{search_result1}    Get WebElements    ${sidenav_menu1}
    :FOR  ${var1}  IN  @{search_result1}
    \    ${search_result2}    Split String  ${var1.text}  \n
    \    log  ${search_result2}  console=True
     \    ${status}=  Run Keyword And Return Status  List Should Contain Value  ${list}  ${var1.text}  
    \    Log  ${status}  console=True
    \    ${state}  Set Variable If  '${Status}'=='False'  False  ${state}
    Should be true  ${state} 
    Log  AP overlays verified!  console=True
    
Check Deployed device in user
    sleep  5s
    Click  ${editbutton_css}
    sleep  3s
    AssertForElementNotPresent  ${Loc_AddDeployedDevices}
    Log  Deployed devices cannot be added to user!  console=True

 
Add new user
    [Arguments]  ${TestCase}
    Get User details  ${TestCase}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Users Page
    Click  ${Loc_AddUser}
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Type  ${Loc_ReadonlyUsername}  ${RoleName}
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${Loc_RoleDropdown}  ${RoleForUser}
    DOMreadyByWaitTime  2
    Type  ${Loc_ReadonlyPwd}  ${UserPwd}
    Type  ${Loc_ReadonlycnfrmPwd}  ${UserPwd}
    DOMreadyByWaitTime  2
    Click  ${Loc_AdduserAdd}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_AddSuccessful}
    Log  New Readonly user- ${RoleName} created!  console=True
   
Login with New User and verify
    [Arguments]  ${TestCase}
    Get User details  ${TestCase}
    Login As User  ${RoleName}  ${UserPwd}
    DOMreadyByWaitTime  10
    Log  User - ${RoleName} login verified!  console=True
    DOMreadyByWaitTime  5
    
Verify Delete role with user
    [Arguments]  ${TestCase}
    Get User details  ${TestCase}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    DOMreadyByWaitTime  5
    ${Status1}  Run keyword and return status  AssertForElementPresent  //*[text()='${RoleForUser}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
    ${Status2}  Run keyword and return status  Click  //*[text()='${RoleForUser}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
    Should be true  "${Status2}"=="False"
    Log  Role - ${RoleForUser} in user - ${RoleName} cannot be deleted!  console=True
    

Verify Delete role without user
    [Arguments]  ${TestCase}
    Get role details  ${TestCase}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    DOMreadyByWaitTime  5
    AssertForElementPresent  //*[text()='${RoleName}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
    Click  //*[text()='${RoleName}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
    DOMreadyByWaitTime  3
    Click  ${Loc_Delete_buttonFT}
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Click  ${Loc_Delete_buttonFT}
    DOMreadyByWaitTime  3
    AssertForElementPresent  ${Loc_AddSuccessful}
    Log  Role - ${RoleName} deleted successfully!  console=True
    
Delete user and role
    [Arguments]  ${TestCase}
    Get User details  ${TestCase}
    Delete user in AMP  ${TestCase}
    Delete role  ${TestCase}

Delete user in AMP
    [arguments]  ${TestCase}
    Get User details  ${TestCase}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Users Page
    DOMreadyByWaitTime  3
    AssertForElementPresent  //*[text()='${RoleForUser}']/ancestor::tr/*[text()='${RoleName}']/preceding-sibling::*/*[@type="checkbox"]
    Click  //*[text()='${RoleForUser}']/ancestor::tr/*[text()='${RoleName}']/preceding-sibling::*/*[@type="checkbox"]
    Click  ${Loc_Delete_buttonFT}
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Click  ${Loc_Delete_buttonFT}
    DOMreadyByWaitTime  3
    AssertForElementPresent  ${Loc_AddSuccessful}
    Log  User - ${RoleName} with role - ${RoleForUser} deleted successfully!  console=True
    
    
Delete role
    [arguments]  ${TestCase}
    Get User details  ${TestCase}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    DOMreadyByWaitTime  5
    AssertForElementPresent  //*[text()='${RoleForUser}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
    Click  //*[text()='${RoleForUser}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
    DOMreadyByWaitTime  3
    Click  ${Loc_Delete_buttonFT}
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Click  ${Loc_Delete_buttonFT}
    DOMreadyByWaitTime  3
    AssertForElementPresent  ${Loc_AddSuccessful}
    Log  Role - ${RoleForUser} deleted successfully!  console=True
    
Role cleanup
    [arguments]  ${RoleName}  ${LoginPwd}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    DOMreadyByWaitTime  5
    AssertForElementPresent  //*[text()='${RoleName}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
    Click  //*[text()='RoleName']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
    DOMreadyByWaitTime  3
    Click  ${Loc_Delete_buttonFT}
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Click  ${Loc_Delete_buttonFT}
    DOMreadyByWaitTime  3
    AssertForElementPresent  ${Loc_AddSuccessful}
    Log  Role - ${RoleName} deleted successfully!  console=True
    
Delete all created roles
   [Arguments]  @{List}
   Navigate To AMP Setup Page
   Navigate To AMP Setup Roles Page
   DOMreadyByWaitTime  5
   :FOR  ${role}  IN  @{List}
   \    Get role details  ${role}
   \    Click  //*[text()='${RoleName}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
   \    DOMreadyByWaitTime  3
   \    Log  Role - ${RoleName} selected for deletion!  console=True
   Click  ${Loc_Delete_buttonFT}
   DOMreadyByWaitTime  3
   Type  ${Loc_CurrentPwd}  ${LoginPwd}
   DOMreadyByWaitTime  3
   Click  ${Loc_Delete_buttonFT}
   DOMreadyByWaitTime  10
   AssertForElementPresent  ${Loc_AddSuccessful}
   Log  All Selected roles deleted successfully!  console=True
   
Create Campus,building and floor
    [arguments]  ${TestCase}
    Navigate To Visual RF Page
    Get VRF data  ${TestCase}   
    sleep  20s
    Creation of Campus  ${Campusname}  
    Creation of Buidling  ${Campusname}  ${Building_address}  ${Latitude}  ${Longitude}
    Creation of New Floor  ${Campusname}
    Add deployed device to floor plan
    
Cleanup for Create Campus, Building and New Floor
    [arguments]  ${TestCase}
    Get VRF data  ${TestCase}
    Navigate To Visual RF Page
    sleep  5s
    ${SelectCampus}  Catenate  ${Loc_SelectCampus_xpath}  text()='${CampusName}']
    Click  ${SelectCampus}
    Sleep  5s
    Click  ${editbutton_css}
    DOMreadyByWaitTime  5
    Click  ${Loc_Clean_campusRemoveFT}
    DOMreadyByWaitTime  3
    Click  ${Loc_clean_confirmremoveFT}
    DOMreadyByWaitTime  3
    Log  Campus: ${CampusName} deleted!  console=True
    

Creation of Campus
    [Arguments]  ${CampusName}
    [Documentation]  Check for Creation of campus in Airwave page
    Sleep  5s
    Scroll element into view  ${editbutton_css}
    Click  ${editbutton_css} 
    Click  ${newcampus_css}
    Type  ${Campus_Xpath}  ${CampusName}
    Click  ${Save_button}
    Log  Campus- ${CampusName} created successfully!  console=True
    
Creation of Buidling
    [Documentation]  Check for Creation of Building in the campus
    [Arguments]  ${CampusName}  ${buidlingadd_value}  ${latitude_value}  ${longitude value}
    ${SelectCampus}  Catenate  ${Loc_SelectCampus_xpath}  text()='${CampusName}']
    Double Click  ${SelectCampus}
    Sleep  5s
    Click  ${editbutton_css}
    Sleep  5s
    Click  ${new_building}
    Sleep  5s
    Type  ${Campus_Xpath}  ${CampusName}
    Type  ${buildingaddress_xpath}  ${buidlingadd_value}
    Type  ${latitude xpath}  ${latitude_value}
    Type  ${longitude xpath}  ${longitude value}  
    Click  ${Save_button} 
    Log  Building- ${CampusName} created successfully!  console=True
    
Creation of New Floor
    [Arguments]  ${CampusName}
    [Documentation]  Check for Creation of New Floor
    ${SelectCampus}  Catenate  ${Loc_SelectCampus_xpath}  text()='${CampusName}']
    Double Click  ${SelectCampus}
    Sleep  5s
    Click  ${editbutton_css}
    Sleep  5s
    Click  ${New_FloorPlan}
    Sleep  5s
    Choose File  ${choose_img}  ${img_location}
    Click  ${Save_button}
    Click  ${Finish_button}
    Log  Floorplan Created successfully!  console=True
    
Add deployed device to floor plan
    sleep  5s
    Click  ${editbutton_css}
    sleep  3s
    Click  ${Loc_AddDeployedDevices}
    sleep  30s
    Wait Until Element Is Not Visible  ${loader}  50s
    Click  ${Loc_Drag_Xpath}
    Drag and Drop  ${Loc_Drag_Xpath}  ${Loc_Drop_Xpath}
    Wait Until Element Is Not Visible  ${loader}  50s
    sleep  3s
    Log  Deployed device added  console=True
    

### Ram Code ###

Check the role type of Airwave Management client
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    DOMreadyByWaitTime  5
    Click  ${Loc_AddUser}
    DOMreadyByWaitTime  3
    Get Vrf Case details  VrfDetails
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}    
    DOMreadyByWaitTime  3
    Type  ${Loc_RoleUsername}  ${RoleName1}   
    DOMreadyByWaitTime  2
   # Select Dropdown LabelValue  ${Loc_FolderDropdown}  ${folder}
    Click  ${clientairwave_css}
    DOMreadyByWaitTime  3
    Select Dropdown LabelValue  ${clientairwave_css}  ${clientairwave1_css}
    Click  ${Loc_AdduserAdd}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_AddSuccessful} 
    ${output}  Get Text  ${Loc_AddSuccessful}
    Log  Role - ${RoleName1} created!  console=True
    log  ${output}
    Should Be Equal As Strings  ${output}  ${expcted_output} 
    Page Should Contain Element  xpath=//*[contains(text(),'${RoleName1}')]   
      
      
Check the role type of Guest Access Sponsor
    [Arguments]  ${folder}  
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    DOMreadyByWaitTime  5
    Click  ${Loc_AddUser}
    DOMreadyByWaitTime  3
    Get Vrf Case details  VrfDetails
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}    
    DOMreadyByWaitTime  3
    Type  ${Loc_RoleUsername}  ${RoleName2}  
    DOMreadyByWaitTime  2
    Click  ${clientairwave_css}
    DOMreadyByWaitTime  3
    Select Dropdown LabelValue  ${clientairwave_css}  ${clientairwave2_css}
    DOMreadyByWaitTime  2
   # Select Dropdown LabelValue  ${Loc_FolderDropdown}  ${folder}
    Click  ${Loc_FolderDropdown}
    DOMreadyByWaitTime  3
    Click  ${Loc_FolderDropdown}//*[contains(text(),'${folder}')]
    DOMreadyByWaitTime  2
    Click  ${Loc_AdduserAdd}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_AddSuccessful} 
    ${output}  Get Text  ${Loc_AddSuccessful}
    Log  Role - ${RoleName2} created!  console=True
    log  ${output}
    Should Be Equal As Strings  ${output}  ${expcted_output} 
    Page Should Contain Element  xpath=//*[contains(text(),'${RoleName2}')]
    
      
Check the User page default view
    Navigate To AMP Setup Page
    Navigate To AMP Setup Users Page
    DOMreadyByWaitTime  5
    Page Should Contain Element  ${Loc_DefaultView}
   # Run Keyword And Return Status    Checkbox Should Not Be Selected  css=[name='delete_ids'][disabled=''] 
    
    ${Is_Checkbox_Selected}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${Loc_SelectedChkbox} 
    ${Actual_Chkbx_Value}=    Run Keyword If    '${Is_Checkbox_Selected}'== 'True'    Set Variable    Yes
    ...    ELSE IF    '${Is_Checkbox_Selected}'== 'False'    Set Variable    No
    Log    ${Actual_Chkbx_Value}
    Should Be Equal As Strings  ${Actual_Chkbx_Value}  Yes   
       
  
Check the Display client diagnostics screens
    #helpdesk_only_0[type='radio'][name='helpdesk_only']
    [Arguments]  ${folder}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    DOMreadyByWaitTime  5
    Click  ${Loc_AddUser}
    DOMreadyByWaitTime  3
    Get Vrf Case details  VrfDetails
    DOMreadyByWaitTime  3
  #  Type  ${Loc_CurrentPwd}  ${LoginPwd}
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Type  ${Loc_RoleUsername}  ${RoleName3}
    DOMreadyByWaitTime  2
    Click  ${Loc_FolderDropdown}
    DOMreadyByWaitTime  3
    Click  ${Loc_FolderDropdown}//*[contains(text(),'${folder}')]
    DOMreadyByWaitTime  2
    Click   ${VRF_Dropdown}
    DOMreadyByWaitTime  3
   # Select From Dropdown List  ${VRF_Dropdown}  Read Only
    Select From Dropdown List  ${VRF_Dropdown}  ${VisualRf}
    DOMreadyByWaitTime  5    
    Click  ${Loc_AdduserAdd}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_AddSuccessful}
    Log  Role - ${RoleName3} created!  console=True    
    ${output}=  Get Text  ${displayclient_xpath}
    log  ${output}
    Click  ${displayclient_xpath1}
    

Check for the Help Icon Title
    [Documentation]  Check for the Help Icon Title
    Sleep  5s
    Click  ${Help_Icon}
    Switch Window  locator=NEW
    DOMreadyByWaitTime  5
    ${output}  Get Text  ${VRF_Text}
    log  ${output} 
    Close Window
    DOMreadyByWaitTime  3
    Switch Window  MAIN
    Should Be Equal As Strings  ${output}  ${expected_outputVRF1}
    

Check for the properties of Read Write User
    @{list}  Create List  ${Vrfcol1}  ${Vrfcol2}  ${Vrfcol3}  ${Vrfcol4}  ${Vrfcol5}  ${Vrfcol6}  ${Vrfcol7}  ${Vrfcol8}  ${Vrfcol9}  ${Vrfcol10}  ${Vrfcol11}  ${Vrfcol12}  ${Vrfcol13}  ${Vrfcol4}  ${Vrfcol5}  ${Vrfcol6}  ${Vrfcol7}  ${Vrfcol8}  ${Vrfcol9}  ${Vrfcol20}  ${Vrfcol21}  ${Vrfcol22}  ${Vrfcol23}
     ${state}  Set Variable  True
     @{search_result}    Get WebElements    ${Loc_ReadWriteProp}
    :FOR  ${var1}  IN  @{search_result}
    \    log  ${var1.text}  console=True
    \    ${status}=  Run Keyword And Return Status  List Should Contain Value  ${list}  ${var1.text}
    \    Log  ${status}  console=True
    \    ${state}  Set Variable If  '${status}'=='False'  False  ${state}
#      \   
    Should be true  ${state}



*** Keywords ***
Get role details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${LoginPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginPwd
    ${LoginPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${LoginPwdList}  1
    Set Suite Variable  ${LoginPwd}
    ${RoleNameList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleName
    ${RoleName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleNameList}  1
    Set Suite Variable  ${RoleName}
    ${DeviceAccessList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceAccess
    ${DeviceAccess} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceAccessList}  1
    Set Suite Variable  ${DeviceAccess}
    ${RAPIDSList} =  Data_Provider.GetDataProviderColumnValue  Data_RAPIDS
    ${RAPIDS} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RAPIDSList}  1
    Set Suite Variable  ${RAPIDS}
    ${VisualRfList} =  Data_Provider.GetDataProviderColumnValue  Data_VisualRf
    ${VisualRf} =  Data_Provider.DataProviderSplitterForMultipleValues  ${VisualRfList}  1
    Set Suite Variable  ${VisualRf}
    ${SignOnroleList} =  Data_Provider.GetDataProviderColumnValue  Data_SignOnrole
    ${SignOnrole} =  Data_Provider.DataProviderSplitterForMultipleValues  ${SignOnroleList}  1
    Set Suite Variable  ${SignOnrole}
    ${AllowRebootList} =  Data_Provider.GetDataProviderColumnValue  Data_AllowReboot
    ${AllowReboot} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AllowRebootList}  1
    Set Suite Variable  ${AllowReboot}
    ${RoleFolderList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleFolder
    ${RoleFolder} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleFolderList}  1
    Set Suite Variable  ${RoleFolder}
    ${UserNameList} =  Data_Provider.GetDataProviderColumnValue  Data_UserName
    ${UserName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UserNameList}  1
    Set Suite Variable  ${UserName}
    ${UserPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_UserPwd
    ${UserPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UserPwdList}  1
    Set Suite Variable  ${UserPwd}
    ${CampusNameList} =  Data_Provider.GetDataProviderColumnValue  Data_CampusName
  ${CampusName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CampusNameList}  1
  Set Suite Variable  ${CampusName}
    


Get User details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${LoginPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginPwd
    ${LoginPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${LoginPwdList}  1
    Set Suite Variable  ${LoginPwd}
    ${RoleNameList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleName
    ${RoleName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleNameList}  1
    Set Suite Variable  ${RoleName}
    ${RoleForUserList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleForUser
    ${RoleForUser} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleForUserList}  1
    Set Suite Variable  ${RoleForUser}
    ${UserPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_UserPwd
    ${UserPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UserPwdList}  1
    Set Suite Variable  ${UserPwd}


Get role and user details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${LoginPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginPwd
    ${LoginPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${LoginPwdList}  1
    Set Suite Variable  ${LoginPwd}
    ${RoleForUserList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleForUser
    ${RoleForUser} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleForUserList}  1
    Set Suite Variable  ${RoleForUser}
    ${RoleNameList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleName
    ${UserName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleNameList}  1
    Set Suite Variable  ${UserName}
    ${DeviceAccessList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceAccess
    ${DeviceAccess} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceAccessList}  1
    Set Suite Variable  ${DeviceAccess}
    ${VisualRfList} =  Data_Provider.GetDataProviderColumnValue  Data_VisualRf
    ${VisualRf} =  Data_Provider.DataProviderSplitterForMultipleValues  ${VisualRfList}  1
    Set Suite Variable  ${VisualRf}
    ${RoleFolderList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleFolder
    ${RoleFolder} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleFolderList}  1
    Set Suite Variable  ${RoleFolder}
    ${UserPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_UserPwd
    ${UserPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UserPwdList}  1
    Set Suite Variable  ${UserPwd}
  
Get Vrf Case details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${LoginPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginPwd
    ${LoginPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${LoginPwdList}  1
    Set Suite Variable  ${LoginPwd}
    ${RoleNameList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleName
    ${RoleName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleNameList}  1
    Set Suite Variable  ${RoleName1}
    ${RoleNameList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleName
    ${RoleName2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleNameList}  2
    Set Suite Variable  ${RoleName2}
    ${RoleNameList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleName
    ${RoleName3} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleNameList}  3
    Set Suite Variable  ${RoleName3}
    ${VisualRfList} =  Data_Provider.GetDataProviderColumnValue  Data_VisualRf
    ${VisualRf} =  Data_Provider.DataProviderSplitterForMultipleValues  ${VisualRfList}  1
    Set Suite Variable  ${VisualRf}

  
Get VRF data
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${CampusNameList} =  Data_Provider.GetDataProviderColumnValue  Data_CampusName
  ${CampusName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CampusNameList}  1
  Set Suite Variable  ${CampusName}
  ${BuildingAddressList} =  Data_Provider.GetDataProviderColumnValue  Data_BuildingAddress
  ${BuildingAddress} =  Data_Provider.DataProviderSplitterForMultipleValues  ${BuildingAddressList}  1
  Set Suite Variable  ${BuildingAddress}
  ${LatitudeList} =  Data_Provider.GetDataProviderColumnValue  Data_Latitude
  ${Latitude} =  Data_Provider.DataProviderSplitterForMultipleValues   ${Latitude}  1
  Set Suite Variable   ${Latitude}
  ${LongitudeList} =  Data_Provider.GetDataProviderColumnValue  Data_Longitude
  ${Longitude} =  Data_Provider.DataProviderSplitterForMultipleValues   ${Longitude}  1
  Set Suite Variable   ${Longitude}

  
*** Variables ***
${ReadonlyUsername}
${ReadonlyPwd}
${LoginUsername}
${ReadonlyRole}
${RoleUsername}
${RoleUsername1}
${RoleUsername2}
${HostControllerIp}
${VisualRF_Readonly}
    
${RoleName}
${LoginPwd}
${DeviceAccess}
${RAPIDS}
${VisualRf}
${SignOnrole}
${AllowReboot}
${RoleFolder}
${RoleForUser}
${UserPwd}
${UserName}

${Campusname}
${Building_address}
${Latitude}
${Longitude}
${RoleName1}
${RoleName2}
${RoleName3}