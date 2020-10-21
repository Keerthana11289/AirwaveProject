*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Locators/DevicesFT.robot
Resource          ../../Locators/VRF.robot
Resource          ../../Utilities/Data_Provider.robot
Library           ../../Utilities/Common/WebdriverHelper.py

*** Keywords ***
Create commom role
    [Arguments]  ${LoginPwd}  ${RoleName}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    DOMreadyByWaitTime  5
    Click  ${Loc_AddUser}
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Type  ${Loc_RoleUsername}  ${RoleName}
    DOMreadyByWaitTime  2
    Click  ${Loc_AdduserAdd}
    DOMreadyByWaitTime  10
    WaitForElementPresent  ${Loc_AddSuccessful}
    Log  New role - ${RoleName} created!  console=True
    
Create common User
    [Arguments]  ${LoginPwd}  ${UserName}  ${UserPwd}  ${RoleName} 
    Navigate To AMP Setup Page
    Navigate To AMP Setup Users Page
    DOMreadyByWaitTime  5
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
    DOMreadyByWaitTime  10
    WaitForElementPresent  ${Loc_AddSuccessful}
    Log  New user- ${UserName} created!  console=True
    
Creation of campus,building and floor
    [Arguments]  ${TestCase}
    Get VRF data  ${TestCase}
    Navigate To Visual RF Page
    sleep  20s
    Creation of Campus  ${CampusName}  
    Creation of Buidling  ${CampusName}  ${Building_address}  ${Latitude}  ${Longitude}
    Creation of New Floor  ${CampusName}
    Add deployed device to floor plan
    
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
    
    
     
Update role with details
    [Arguments]  ${TestCase}  ${RoleUser}
    Get Role and User details  ${RoleUser}
    Get Role Details  ${TestCase}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    DOMreadyByWaitTime  5
    Click  //*[text()='${RoleName}']/parent::*//*[@title="Edit"]
    Wait Until Element Is Not Visible  ${loader}  30s
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Select Dropdown LabelValue  ${Loc_DevAccess_Dropdownrole}  ${DeviceAccess}
    DOMreadyByWaitTime  2
    Click  ${Loc_FolderDropdown}
    DOMreadyByWaitTime  3
    Click  ${Loc_FolderDropdown}//*[contains(text(),'${RoleFolder}')]
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${Loc_RapidsDropdownrole}  ${RAPIDS}
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${VRF_Dropdownrole}  ${VisualRf}
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${Loc_SignonDropdownrole}  ${SignOnrole}
    DOMreadyByWaitTime  2
    Click  ${Loc_SaveButtonRole}
    DOMreadyByWaitTime  10
    WaitForElementPresent  ${Loc_AddSuccessful}
    Log  New Role - ${RoleName} with Manage, ${DeviceAccess}, ${RAPIDS}, ${VisualRf}, ${SignOnrole} -${RoleFolder} folder updated!  console=True

    
Login New user with role
    [Arguments]  ${TestCase}
    Get Role and User details  ${TestCase}
    Login As User  ${UserName}  ${UserPwd}
    DOMreadyByWaitTime  10
    Log  User - ${UserName} login verified!  console=True
    DOMreadyByWaitTime  5

Validate VRF properties
    Navigate To Visual RF Page
    DOMreadyByWaitTime  5
    AssertForElementNotPresent  ${VisualRF_Setup_css}
    AssertForElementNotPresent  ${VisualRF_Import_css}
    AssertForElementNotPresent  ${VisualRF_AuditLog_css}
    Log  Visual Rf doesn't have Audit, Setup and Import option for new user!  console=True

Validate VRF properties for ReadWrite
    Navigate To Visual RF Page
    DOMreadyByWaitTime  5
    AssertForElementPresent  ${VisualRF_Setup_css}
    AssertForElementPresent  ${VisualRF_Import_css}
    AssertForElementPresent  ${VisualRF_AuditLog_css}
    Log  Visual Rf has Audit, Setup and Import option for new user!  console=True

Click FLoor
    [Arguments]  ${CampusName}
    Navigate to Visual Rf Page
    DOMreadyByWaitTime  5
    ${SelectCampus}  Catenate  ${Loc_SelectCampus_xpath}  text()='${CampusName}']
    Double Click  ${SelectCampus}
    Sleep  5s
    Click  ${viewbutton_css}
    Sleep  3s
    Click  //*[text()='Buildings']/parent::*//*[@class="table_component_column"]//*[text()='${CampusName}']
    Sleep  5s
    Click  ${viewbutton_css}
    Sleep  3s
    Click  //*[text()='Floors']/parent::*//*[@class="table_component_column"]//*[contains(@class,'fake_link')]
    Sleep  5s    
    
Validate Refresh option
    Click  ${Loc_RefreshIcon}
    DOMreadyByWaitTime  10
    assertForElementPresent  ${Loc_NetworkVer}
    Log  Refresh Floor plan verified!  console=True
    
Check Campus and building in user
    [Arguments]  ${TestCase}
    Get Role and User details  ${TestCase}
    Click FLoor  ${CampusName}
    Log  Campus and building - ${CampusName} verified in User!  console=True
    
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
    
Delete user and role
    [arguments]  ${TestCase}
    Delete user in AMP  ${TestCase}
    Delete role  ${TestCase}

Delete user in AMP
    [arguments]  ${TestCase}
    Get Role and User details  ${TestCase}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Users Page
    DOMreadyByWaitTime  3
    AssertForElementPresent  //*[text()='${RoleName}']/ancestor::tr/*[text()='${UserName}']/preceding-sibling::*/*[@type="checkbox"]
    Click  //*[text()='${RoleName}']/ancestor::tr/*[text()='${UserName}']/preceding-sibling::*/*[@type="checkbox"]
    Click  ${Loc_Delete_buttonFT}
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Click  ${Loc_Delete_buttonFT}
    DOMreadyByWaitTime  3
    AssertForElementPresent  ${Loc_AddSuccessful}
    Log  User - ${UserName} with role - ${RoleName} deleted successfully!  console=True
    
    
Delete role
    [arguments]  ${TestCase}
    Get Role and User details  ${TestCase}
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

Cleanup for Campus, Building and New Floor
    [Arguments]  ${CampusName}
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




*** Keywords ***
Get Role and User details
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
    ${UserNameList} =  Data_Provider.GetDataProviderColumnValue  Data_UserName
    ${UserName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UserNameList}  1
    Set Suite Variable  ${UserName}
    ${UserPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_UserPwd
    ${UserPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UserPwdList}  1
    Set Suite Variable  ${UserPwd}
    ${CampusNameList} =  Data_Provider.GetDataProviderColumnValue  Data_CampusName
    ${CampusName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CampusNameList}  1
    Set Suite Variable  ${CampusName}
    
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
  ${Latitude} =  Data_Provider.DataProviderSplitterForMultipleValues   ${LatitudeList}  1
  Set Suite Variable   ${Latitude}
  ${LongitudeList} =  Data_Provider.GetDataProviderColumnValue  Data_Longitude
  ${Longitude} =  Data_Provider.DataProviderSplitterForMultipleValues   ${LongitudeList}  1
  Set Suite Variable   ${Longitude}
    
Get Role Details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${TypeList} =  Data_Provider.GetDataProviderColumnValue  Data_Type
    ${Type} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TypeList}  1
    Set Suite Variable  ${Type}
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
    ${RoleFolderList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleFolder
    ${RoleFolder} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleFolderList}  1
    Set Suite Variable  ${RoleFolder}
    

*** Variables ***
${RoleName}
${LoginPwd}
${UserPwd}
${UserName}
${DeviceAccess}
${RAPIDS}
${VisualRf}
${SignOnrole}
${Type}
${RoleFolder}
${CampusName}
${Building_address}
${Latitude}
${Longitude}