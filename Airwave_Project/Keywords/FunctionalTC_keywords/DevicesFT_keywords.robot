*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../Locators/DevicesFT.robot
Resource          ../../Utilities/Data_Provider.robot
Library           ../../Utilities/Common/WebdriverHelper.py

*** Keywords ***
Enable Visual RF engine
    Navigate To Visual RF Page
    Navigate To Visual RF Setup Page1
    Log  Enabled Visual RF  console=True
    
Disable AMON vs SNMP Polling
    Navigate To AMP Setup Page
    DOMreadyByWaitTime  2
    Click  ${Loc_AdditionalAMPSettings}
    DOMreadyByWaitTime  3
    AssertForElementPresent  ${Loc_AMONvsSNMP}
    Click  ${Loc_DisableSNMPPolling}
    DOMreadyByWaitTime  5
    Element Should not be visible  ${Loc_SNMPvsVPN}
    Click  ${Loc_SaveButton}
    DOMreadyByWaitTime  3
    log  AMON vs SNMP Polling disabled!  console=True
    
Create a role for folder1
    [Arguments]  ${folder}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Roles Page
    DOMreadyByWaitTime  5
    Click  ${Loc_AddUser}
    DOMreadyByWaitTime  3
    Get Readonly user details  Client Monitoring
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Type  ${Loc_RoleUsername}  ${RoleUsername}
    DOMreadyByWaitTime  2
   # Select Dropdown LabelValue  ${Loc_FolderDropdown}  ${folder}
    Click  ${Loc_FolderDropdown}
    DOMreadyByWaitTime  3
    Click  ${Loc_FolderDropdown}//*[contains(text(),'${folder}')]
    DOMreadyByWaitTime  2
    Click  ${Loc_AdduserAdd}
    DOMreadyByWaitTime  10
    WaitForElementPresent  ${Loc_AddSuccessful}
    Log  New Role - ${ReadonlyUsername} for folder -${folder} created!  console=True
    
Create a user with role
    Navigate To AMP Setup Page
    Navigate To AMP Setup Users Page
    DOMreadyByWaitTime  5
    Click  ${Loc_AddUser}
    DOMreadyByWaitTime  3
    Get Readonly user details  Client Monitoring
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Type  ${Loc_ReadonlyUsername}  ${ReadonlyUsername}
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${Loc_RoleDropdown}  ${RoleUsername}
    DOMreadyByWaitTime  2
    Type  ${Loc_ReadonlyPwd}  ${ReadonlyPwd}
    Type  ${Loc_ReadonlycnfrmPwd}  ${ReadonlyPwd}
    Click  ${Loc_AdduserAdd}
    DOMreadyByWaitTime  10
    WaitForElementPresent  ${Loc_AddSuccessful}
    Log  New user- ${ReadonlyUsername} with role-${RoleUsername} created!  console=True
    
    
    
    
    
    
    
Create Campus, Building and New Floor
    Navigate To Visual RF Page
    Get VRF data  VRF   
    sleep  20s
    Creation of Campus  ${Campusname}  
    Creation of Buidling  ${Campusname}  ${Building_address}  ${Latitude}  ${Longitude}
    Creation of New Floor  ${Campusname}
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
    
Enable SNMP Traps and Syslog messages
    Navigate To AMP Setup Page
    DOMreadyByWaitTime  2
    Click  ${Loc_AdditionalAMPSettings}
    DOMreadyByWaitTime  3
    Click  ${Loc_enableSNMPandTrap}
    DOMreadyByWaitTime  3
    Click  ${Loc_SaveButton}
    DOMreadyByWaitTime  3
    log  SNMP Traps and Syslog messages enabled!  console=True
    
 
    
Enable Client Related Traps in Controller
    Get Readonly user details  Client Monitoring
    Log  received  console=True
    ${result}  Enable Client Traps  ${HostControllerIp}  ${ControllerUsername}  ${ControllerPwd}  ${EnablePwd}  ${SnmpCommunitycmd}  ${ServerIp} 
    Should be true  '${result}'!='0'
    Log  Community: ${result}  console=True
    
      
    
    


Add new user with readonly and monitoring role
    Click  ${Loc_AddUser}
    Get Readonly user details  TestReadonly
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Type  ${Loc_ReadonlyUsername}  ${ReadonlyUsername}
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${Loc_RoleDropdown}  ${ReadonlyRole}
    DOMreadyByWaitTime  2
    Type  ${Loc_ReadonlyPwd}  ${ReadonlyPwd}
    Type  ${Loc_ReadonlycnfrmPwd}  ${ReadonlyPwd}
    Click  ${Loc_AdduserAdd}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_AddSuccessful}
    Log  New Readonly user- ${ReadonlyUsername} created!  console=True
    
Logout of AMP
    Logout from AMP Page
    
Logout of Readonly user
    Logout from AMP Page
    
Login with readonly and monitoring role
    Get Readonly user details  TestReadonly
    Login As User  ${ReadonlyUsername}  ${ReadonlyPwd}
    
Get Client Count and compare Readonly
    DOMreadyByWaitTime  5
    Enter the Search input
    Compare the client count
    
Enter the Search input
    Click  ${Loc_icon_searchFT}
    Type  ${Loc_search_input_xpathFT}  AP
    Sleep  5s
    Click  ${Loc_searchPopupFT}
    sleep  5s
    Click  //*[@id="aps_button"]
    Sleep  5
    ${Count}  get element count  ${Loc_APdev1}
    Run keyword if  ${count}==0  Click  ${Loc_close_buttonFT}
    Run keyword if  ${count}==0  Fail  No AP present!
    Click  ${Loc_APdev1}
    DOMreadyByWaitTime  5
    
Compare the client count
    Navigate to DeviceMonitor PageFT
    sleep  10s
    ${output}=  Get Text  ${Loc_clientMonitor}
    ${output}  Run Keyword if  '${output}'=='-'  Set variable  0
    ...  ELSE  Set variable  ${output}
    log  Client count-monitor page: ${output}  console=True
    Click  ${Loc_clientPanel}
    ${tot_rowcount}=  Get text  ${Loc_clientPanelcount}
    ${fst}  ${lst}  split string  ${tot_rowcount}  :
    ${count}  remove string  ${lst}  ]
    ${ClientPanel}  strip string  ${count}
    log  Client panel count: ${ClientPanel}  console=True
    Should be Equal  ${output}  ${ClientPanel} 

    
Login To AMP after TestReadonly
    Get Readonly user details  TestReadonly
    Login As User  ${LoginUsername}  ${LoginPwd}
    

Select Controller with Clients
    DOMreadyByWaitTime  3
    Click  ${Loc_folderDrop}
    DOMreadyByWaitTime  3
    Click  ${Loc_TopDevices}
    DOMreadyByWaitTime  5
    ${val}  set Variable  0
    ${DevCount}  Get element Count  ${Loc_ClientCol}
    Run keyword if  ${DevCount} == 0  Fail  No Devices found!
    :FOR  ${i}  IN RANGE  1  ${DevCount}+1
    \    ${ClientCount}  Get element Text  (${Loc_ClientCol})[${i}]
   # \    DOMreadyByWaitTime  2
   # \    Scroll element into view  (${Loc_ClientCol})[${i}]
    \    ${ClientCount}  Convert To Integer  ${ClientCount}
    \    Continue For Loop if  ${ClientCount}==0
    \    ${controller}  Get element Text  (${Loc_ClientCol})[${i}]/parent::*/td[5] 
    \    Continue For Loop if  '${controller}'=='-'
    \    DOMreadyByWaitTime  5
    \    scroll element into view  (${Loc_ClientCol})[${i}]/parent::*/td[5]
    \    DOMreadyByWaitTime  5
    \    Click  (${Loc_ClientCol})[${i}]/parent::*/td[5]
    \    ${val}  set Variable  1
    \    Exit For Loop If  '${controller}'!='-' and ${ClientCount}!=0
    Run keyword if  ${val}==0  Fail  No controller with client found!
    
Get Client count and Compare
    DOMreadyByWaitTime  5
    Scroll element into view  ${Loc_AMPclientCount}
    ${Amp_Count}  Get element Text  ${Loc_AMPclientCount}
    ${Amp_Count}  Convert To Integer  ${Amp_Count}
    Log  AMP Client count: ${Amp_Count}  console=True
    Click  ${Loc_IP}
    DOMreadyByWaitTime  3
    Get Controller Login details  ControllerLogin
    Login to Controller  ${ControllerUsername}  ${ControllerPwd}
    ${Wireless}  Get Element Text  ${Loc_WirelessClientCount}
    ${Wireless}  Convert to Integer  ${Wireless}
    ${Wired}  Get Element Text  ${Loc_WiredClientCount}
    ${Wired}  Convert to Integer  ${Wired}
    ${Controller_Clientcount}  Evaluate  ${Wireless}+${Wired}
    Log  Controller Client count: ${Controller_Clientcount}  console=True
    Should be true  ${Amp_Count}==${Controller_Clientcount}
    Log  Client Count of controller verified successfully!  console=True 
    Close Window
    Switch Window  MAIN
    DOMreadyByWaitTime  10
    
    
Login to Controller
    [Arguments]  ${username}  ${pwd}
    Switch Window  locator=NEW
    DOMreadyByWaitTime  5
    Wait Until Element is Visible  ${Cont_Username}  100s
    Type  ${Cont_Username}  ${username}
    Type  ${Cont_Password}  ${pwd}
    Click  ${Cont_Login}
    Wait until element is visible  ${Loc_verifyLogin}  100s
    DOMreadyByWaitTime  10
    
    
    
    
    

Customize Additional AMP services and verify SNMP polling
    DOMreadyByWaitTime  2
    Click  ${Loc_AdditionalAMPSettings}
    DOMreadyByWaitTime  3
    Click  ${Loc_diableAMONDatacollection}
    DOMreadyByWaitTime  2
    Element Should not be visible  ${Loc_AMONvsSNMP}
    log  Disabled AMON data collection  console=True
    Click  ${Loc_enableAMONDatacollection}
    DOMreadyByWaitTime  2
    Element Should be visible  ${Loc_AMONvsSNMP}
    Click  ${Loc_DisableSNMPPolling}
    DOMreadyByWaitTime  2
    Element Should not be visible  ${Loc_SNMPvsVPN}
    log  SNMP Polling is not enabled!  console=True
    Click  ${Loc_EnsableSNMPPolling}
    DOMreadyByWaitTime  2
    Element Should be visible  ${Loc_SNMPvsVPN}
    Click  ${Loc_SaveButton}
    DOMreadyByWaitTime  3
    Log  SNMP Polling Enabled  console=True
    
Create group
    [Documentation]  Creating a new group to AMP in 'Groups - Add' page.
    ...    
    [Arguments]  ${GroupsName}
    Navigate To Group Page
    Sleep  5s
    Navigate To Group List Page
    WaitForElementPresent  ${Loc_AddGroupButton_cssFT}
    Sleep  5s
    Click  ${Loc_AddGroupButton_cssFT}
    WaitForElementPresent  ${Loc_AddGroupNameField_cssFT}
    Type Text  ${Loc_AddGroupNameField_cssFT}  ${GroupsName}
    Sleep  3s
    Click  ${Loc_AddGroupAddButton_cssFT}
    Sleep  3s
    AssertForTableElementPresentInTheTextbox  ${GroupsName}
    Navigate To Group List Page
    Sleep  3s
    AssertForElementPresent  //tbody//*[contains(text(),'${GroupsName}')]
    Log  Group - ${GroupsName} created successfully..!  console=true
    
Create Folder
    [Documentation]  Creating a new folder to AMP in 'Device Setup - Add' page.
    ...    
    [Arguments]  ${deviceFolder}
    Navigate To Device Page
    Navigate To Device List Page
    Focus Element  ${Loc_AddNewFolder_XpathFT}
    Click  ${Loc_AddNewFolder_XpathFT}
    WaitForElementPresent  ${Loc_FolderNameField_cssFT}
    Type Text  ${Loc_FolderNameField_cssFT}  ${deviceFolder}
    Focus Element  ${Loc_ParentFolderField_cssFT}
    Select Dropdown LabelValue  ${Loc_ParentFolderField_cssFT}  ${deviceParentFolderFT}
    Click  ${Loc_FolderAddButtonField_cssFT}
    DOMreadyByWaitTime  3
    AssertForElementPresent  //p[@class="icofirst icon_confirmed ok"]
    AssertForElementPresent  //*[@name="jump_off"]/*[contains(text(),'${deviceFolder}')]
    Log  Folder - ${deviceFolder} created successfully..!  console=true
    
Add Controller
   [Arguments]  ${DeviceType}  ${DeviceIPAddress}  ${DeviceCommunityString}  ${TelnetSSHUsername}  ${TelnetSSHPassword}  ${GroupName}  ${FolderName}
    Navigate To Device Setup Page
    Navigate To Device Setup Add Page
    WaitForElementPresent  ${Loc_DeviceTypeDropdown_cssFT}
    Select Dropdown LabelValue  ${Loc_DeviceTypeDropdown_cssFT}  ${DeviceType}
    Click  ${Loc_AddButton_cssFT}
    ${value}  Catenate  Creating  ${DeviceType}
    Page Should Contain  ${value}
    #Type Text  ${Loc_NameField_css}  ${DeviceName}
    Type Text  ${Loc_IPAddressField_xpathFT}  ${DeviceIPAddress}
    Type Text  ${Loc_CommunityStringField_cssFT}  ${DeviceCommunityString}
    Type Text  ${Loc_ConfirmCommunityStringField_cssFT}  ${DeviceCommunityString}
    Type Text  ${Loc_TelnetSSHUsernameField_cssFT}  ${TelnetSSHUsername}
    Type Text  ${Loc_TelnetSSHPasswordField_cssFT}  ${TelnetSSHPassword}
    Type Text  ${Loc_ConfirmTelnetSSHPasswordField_cssFT}  ${TelnetSSHPassword}
    Select Dropdown LabelValue  ${Loc_SelectGroupField_cssFT}  ${GroupName}
    Focus Element  ${Loc_SelectFolderField_cssFT}
    DOMreadyByWaitTime  3
    Select From Dropdown List  ${Loc_SelectFolderField_cssFT}  ${FolderName}
    Click  ${Loc_DeviceAddButton_cssFT}
    WaitForPageLoading
    AssertForTableElementPresent  ${GroupName}
    AssertForTableElementPresent  ${FolderName}
    AssertForElementPresent  ${Loc_ApplyChangesButton_cssFT}
    AssertForElementPresent  ${Loc_CancelButton_cssFT}
    Click  ${Loc_ApplyChangesButton_cssFT}
    WaitForPageLoading
    Sleep  5s
    ${ip_address}  Catenate  SEPARATOR=  ${Loc_IPAddressField_xpathFT}  [@value='${DeviceIPAddress}']
    AssertForElementPresent  ${ip_address}
    Log  ${DeviceIPAddress} device created successfully..!  console=true
    sleep  20s
    Navigate to DeviceMonitor PageFT
    sleep  5s
    Click PollFT
   # Wait Until Element Is Visible  ${Loc_PollingMessage}  30s
    DOMreadyByWaitTime  320
    Navigate To Device Page
    Navigate To Device Up Page
    sleep  3s
    Click  //*[@name="jump_off"]
    Sleep  3s
    Click  //*[@name="jump_off"]/*[contains(text(),'${FolderName}')]
    sleep  3s
    ${count}  get element count  //*[@title='${DeviceIPAddress}']
    Run Keyword if  ${count} > 0  AssertForElementPresent  //*[@title='${DeviceIPAddress}']
    ...  ELSE     Exit Controller ExecutionFT
  #  AssertForElementPresent  //*[@title='${DeviceIPAddress}']
    Log  Device - ${DeviceIPAddress} verified!  console=True
    
Exit Controller ExecutionFT
   # Click  ${Loc_close_buttonFT}
    Fail  Up status controller not present
    
Navigate to DeviceMonitor PageFT
    Wait Until Element Is Visible  ${Loc_MonitorFT}
    Sleep  3s
    Click  ${Loc_MonitorFT}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Click PollFT
    ${controllerPollcount}  get element count  ${Loc_Poll_buttonFT}
  #  ${switchPollcount}  get element count  ${Loc_switchPoll}
    Run Keyword if  ${controllerPollcount} > 0  Double click  ${Loc_Poll_buttonFT}
    ...  ELSE    Double click  ${Loc_switchPollFT}
    
Get device count FT
    ${count}  get element text  ${Loc_device_countFT}
    ${count}  Convert to integer  ${count}
    [return]  ${count}
    
Delete existing Devices from AMP
    Navigate To Device Page
    Navigate To Device New Page
    DOMreadyByWaitTime  3
    Click  ${Loc_DeviceActionDropdowm}
    DOMreadyByWaitTime  2
    Click  ${Loc_selectDeleteDevice}
    DOMreadyByWaitTime  2
    Click  ${Loc_DeviceCheckbox}
    Click  ${Loc_DeviceDeleteButton}
    DOMreadyByWaitTime  5
    Click  ${Loc_ApplyChangesButton}
    Wait Until Element Is Not Visible  ${loader}  30s
    


*** Keywords ***
Get Folder and controller details
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${GroupNameList} =  Data_Provider.GetDataProviderColumnValue  Data_Groupname1
  ${GroupName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GroupNameList}  1
  Set Suite Variable  ${GroupName1}
  ${GroupName2List} =  Data_Provider.GetDataProviderColumnValue  Data_Groupname2
  ${GroupName2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GroupName2List}  1
  Set Suite Variable  ${GroupName2}
  ${FolderNameList} =  Data_Provider.GetDataProviderColumnValue  Data_FolderName1
  ${FolderName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FolderNameList}  1
  Set Suite Variable  ${FolderName1}
  ${FolderName2List} =  Data_Provider.GetDataProviderColumnValue  Data_FolderName2
  ${FolderName2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FolderName2List}  1
  Set Suite Variable  ${FolderName2}
  ${DeviceTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceType1
  ${DeviceType1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceTypeList}  1
    Set Suite Variable  ${DeviceType1}
    ${DeviceIPAddressList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceIPAddress1
    ${DeviceIPAddress1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceIPAddressList}  1
    Set Suite Variable  ${DeviceIPAddress1}
    ${DeviceCommunityStringList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceCommunityString1
    ${DeviceCommunityString1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceCommunityStringList}  1
    Set Suite Variable  ${DeviceCommunityString1}
    ${TelnetSSHUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_TelnetSSHUsername1
    ${TelnetSSHUsername1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TelnetSSHUsernameList}  1
    Set Suite Variable  ${TelnetSSHUsername1}
    ${TelnetSSHPasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_TelnetSSHPassword1
    ${TelnetSSHPassword1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TelnetSSHPasswordList}  1
    Set Suite Variable  ${TelnetSSHPassword1}
    ${DeviceTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceType2
  ${DeviceType2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceTypeList}  1
    Set Suite Variable  ${DeviceType2}
    ${DeviceIPAddress2List} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceIPAddress2
    ${DeviceIPAddress2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceIPAddress2List}  1
    Set Suite Variable  ${DeviceIPAddress2}
    ${DeviceCommunityString2List} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceCommunityString2
    ${DeviceCommunityString2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceCommunityString2List}  1
    Set Suite Variable  ${DeviceCommunityString2}
    ${TelnetSSHUsername2List} =  Data_Provider.GetDataProviderColumnValue  Data_TelnetSSHUsername2
    ${TelnetSSHUsername2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TelnetSSHUsername2List}  1
    Set Suite Variable  ${TelnetSSHUsername2}
    ${TelnetSSHPassword2List} =  Data_Provider.GetDataProviderColumnValue  Data_TelnetSSHPassword2
    ${TelnetSSHPassword2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TelnetSSHPassword2List}  1
    Set Suite Variable  ${TelnetSSHPassword2}
    
Get Controller Login details
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${ControllerUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_ControllerUsername
  ${ControllerUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerUsernameList}  1
  Set Suite Variable  ${ControllerUsername}
  ${ControllerPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_ControllerPwd
  ${ControllerPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerPwdList}  1
  Set Suite Variable  ${ControllerPwd}
    
   
Get Readonly user details
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${ReadonlyUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_ReadonlyUsername
  ${ReadonlyUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReadonlyUsernameList}  1
  Set Suite Variable  ${ReadonlyUsername}
  ${ReadonlyPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_ReadonlyPwd
  ${ReadonlyPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReadonlyPwdList}  1
  Set Suite Variable  ${ReadonlyPwd}
  ${LoginPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginPwd
  ${LoginPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${LoginPwdList}  1
  Set Suite Variable  ${LoginPwd}
  ${LoginUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginUsername
  ${LoginUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${LoginUsernameList}  1
  Set Suite Variable  ${LoginUsername}
  ${ReadonlyRoleList} =  Data_Provider.GetDataProviderColumnValue  Data_ReadonlyRole
  ${ReadonlyRole} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReadonlyRoleList}  1
  Set Suite Variable  ${ReadonlyRole}
  ${RoleUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleForUser
  ${RoleUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleUsernameList}  1
  Set Suite Variable  ${RoleUsername}
  ${HostControllerIpList} =  Data_Provider.GetDataProviderColumnValue  Data_HostControllerIp
  ${HostControllerIp} =  Data_Provider.DataProviderSplitterForMultipleValues  ${HostControllerIpList}  1
  Set Suite Variable  ${HostControllerIp}
  ${ControllerUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_ControllerUsername
  ${ControllerUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerUsernameList}  1
  Set Suite Variable  ${ControllerUsername}
  ${ControllerPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_ControllerPwd
  ${ControllerPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerPwdList}  1
  Set Suite Variable  ${ControllerPwd}
  ${EnablePwdList} =  Data_Provider.GetDataProviderColumnValue  Data_EnablePassword
  ${EnablePwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${EnablePwdList}  1
  Set Suite Variable  ${EnablePwd}
  ${SnmpCommunitycmdList} =  Data_Provider.GetDataProviderColumnValue  Data_SnmpCommunitycmd
  ${SnmpCommunitycmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${SnmpCommunitycmdList}  1
  Set Suite Variable  ${SnmpCommunitycmd}
  ${ServerIpList} =  Data_Provider.GetDataProviderColumnValue  Data_ServerIp
  ${ServerIp} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ServerIpList}  1
  Set Suite Variable  ${ServerIp}
  

  
  
    

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
${GroupName1}
${GroupName2}
${FolderName1}
${FolderName2}
${DeviceType1}   
${DeviceIPAddress1}  
${DeviceCommunityString1}  
${TelnetSSHUsername1}  
${TelnetSSHPassword1} 
${DeviceType2}   
${DeviceIPAddress2}  
${DeviceCommunityString2}  
${TelnetSSHUsername2}  
${TelnetSSHPassword2}
${deviceParentFolderFT}  Top  
${ControllerUsername}
${ControllerPwd}
${LoginPwd}
${ReadonlyUsername}
${ReadonlyPwd}
${ReadonlyRole}
${RoleUsername}
${LoginUsername}
${Campusname}
${Building_address}
${Latitude}
${Longitude}
${HostControllerIp}
${EnablePwd}
${SnmpCommunitycmd}
${ServerIp}
