*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Utilities/Data_Provider.robot
Resource          ../../Locators/CleanupFT.robot
Resource          ../../Locators/AlertsFT.robot
Resource          ../../Locators/DevicesFT.robot



*** Keywords ***

Delete Created Report FT
    [Arguments]  ${title}
    Navigate To Reports Page
    Navigate To Reports Generated Page
    DOMreadyByWaitTime  3
    Type  ${Loc_ReportSearch}  ${title}
    Press Keys  None  RETURN
    DOMreadyByWaitTime  3
    AssertForElementPresent  //*[text()='${title}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
    Click  //*[text()='${title}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
    DOMreadyByWaitTime  3
    Click  ${Loc_ReportDeleteFT_button}
    DOMreadyByWaitTime  3
    Click  ${Loc_ApplyChangesButtonFT_css}
    DOMreadyByWaitTime  3
    Type  ${Loc_ReportSearch}  ${title}
    Press Keys  None  RETURN
    DOMreadyByWaitTime  3
    AssertForElementNotPresent  //*[text()='${title}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
    log  ${title} - Report deleted!  console=True
    
Delete Created Trigger
      [Arguments]  ${type}
      Navigate To Systems Page
      Navigate To Systems Triggers Page
      DOMreadyByWaitTime  3
      AssertForElementPresent  //*[text()='${type}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
      Click  //*[text()='${type}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
      DOMreadyByWaitTime  3
      Click  ${Loc_TriggerDeleteFT}
      DOMreadyByWaitTime  3
      AssertForElementPresent  ${Loc_SuccessfulMessage}
      Log  Trigger - ${type} deleted successfully!  console=True
      

Revert Additional AMP services AMON Vs SNMP polling
    DOMreadyByWaitTime  2
    Click  ${Loc_AdditionalAMPSettings}
    DOMreadyByWaitTime  3
    Element Should be visible  ${Loc_AMONvsSNMP}
    Click  ${Loc_DisableSNMPPolling}
    DOMreadyByWaitTime  2
    Element Should not be visible  ${Loc_SNMPvsVPN}
    log  SNMP Polling disabled!  console=True
    

Delete added Controller device
    [Arguments]  ${deviceIPAddress}
    Navigate to Home Page
    Click  ${Loc_icon_searchFT}
    Type  ${Loc_search_input_xpathFT}  ${deviceIPAddress}
    Click  ${Loc_searchPopupFT}
    DOMreadyByWaitTime  5
    Click  //*[@id="controllers_button"]
    sleep  5s
    ${Count}  get element count  //*[@title='${deviceIPAddress}']
    Run keyword if  ${Count}==0  Click  ${Loc_close_buttonFT}
    Run keyword if  ${Count}==0  Fail  No controller present in ${deviceIPAddress}!
    Click  //*[@title='${deviceIPAddress}']
    Wait Until Element Is Not Visible  ${loader}  30s
    Wait Until Element Is Visible  ${Device_manage_xpathFT}  30s
    Sleep  3s
    Click  ${Device_manage_xpathFT}
    Wait Until Element Is Not Visible  ${loader}  30s
    Click  ${Loc_Delete_buttonFT}
    DOMreadyByWaitTime  3
    Click  ${Loc_ApplyChangesButtonFT_css}
    DOMreadyByWaitTime  3
    Log  controller in ${deviceIPAddress} deleted!  console=True
    
Delete Created Folder
    [Arguments]  ${deviceFolder}
    Navigate To Device Page
    Navigate To Device List Page
    Click  //*[@name="jump_off"]
    DOMreadyByWaitTime  3
    Click  //*[@name="jump_off"]/*[contains(text(),'${deviceFolder}')]
    DOMreadyByWaitTime  3
    WaitForPageLoading
    WaitForElementPresent  ${Loc_DeleteFoldercssFT}
    Click  ${Loc_DeleteFoldercssFT}
    WaitForElementPresent  ${Loc_DeleteFolderConfirmButtoncssFT}
    Click  ${Loc_DeleteFolderConfirmButtoncssFT}
    Sleep  5s
    AssertForElementNotPresent  ${Loc_DeleteFoldercssFT}
    Log  Folder - ${deviceFolder} deleted successfully..!  console=true
    
Delete Created Group
    [Arguments]  ${GroupsName}
    Navigate To Group Page
    Sleep  5s
    Navigate To Group List Page
    sleep  5s
    Click  //a[text()='${GroupsName}']/ancestor::tr/td/input
    Click  ${Loc_DeleteGroupButton_cssFT}
    sleep  5s
    Navigate To Group Page
    Navigate To Group List Page
    AssertForElementNotPresent  //tbody//*[contains(text(),'${GroupsName}')]
    Log  Group - ${GroupsName} deleted successfully..!  console=true
   
          
Delete New User
    [Arguments]  ${username}  ${role}  ${LoginPwd}
    Navigate To AMP Setup Page
    Navigate To AMP Setup Users Page
    DOMreadyByWaitTime  3
    AssertForElementPresent  //*[text()='${role}']/ancestor::tr/*[text()='${username}']/preceding-sibling::*/*[@type="checkbox"]
    Click  //*[text()='${role}']/ancestor::tr/*[text()='${username}']/preceding-sibling::*/*[@type="checkbox"]
    DOMreadyByWaitTime  3
    Click  ${Loc_Delete_buttonFT}
    DOMreadyByWaitTime  3
    Type  ${Loc_CurrentPwd}  ${LoginPwd}
    DOMreadyByWaitTime  3
    Click  ${Loc_Delete_buttonFT}
    DOMreadyByWaitTime  3
    AssertForElementPresent  ${Loc_SuccessfulMessage}
    Log  User - ${username} with role - ${role} deleted successfully!  console=True
    
Cleanup for Create Campus, Building and New Floor
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
    
Delete New Role
    [Arguments]  ${RoleName}
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
    AssertForElementPresent  ${Loc_SuccessfulMessage}
    Log  Role - ${RoleName} deleted successfully!  console=True
    
    
Enable AMON vs SNMP Polling
    Navigate To AMP Setup Page
    DOMreadyByWaitTime  2
    DOMreadyByWaitTime  2
    Click  ${Loc_AdditionalAMPSettings}
    DOMreadyByWaitTime  3
    Element Should be visible  ${Loc_AMONvsSNMP}
    Click  ${Loc_EnsableSNMPPolling}
    DOMreadyByWaitTime  2
    Element Should be visible  ${Loc_SNMPvsVPN}
    Click  ${Loc_SaveButton}
    DOMreadyByWaitTime  3
    Log  SNMP Polling Enabled  console=True
    
Disable RF engine
    Navigate To Home Page
    Navigate To Visual RF Page
    Navigate To Visual RF Setup Page
    DOMreadyByWaitTime  3
    Click  ${Loc_Clean_VRFenablevalueFT}
    Click  ${Loc_saveFT}
    DOMreadyByWaitTime  10
    Wait until element is visible  ${Loc_saveFT}  50s
    Click  ${Loc_saveFT}
    DOMreadyByWaitTime  3
    Log  VRF disabled!  console=True
    
Disble SNMP Traps and Syslog messages
    Navigate To AMP Setup Page
    DOMreadyByWaitTime  2
    Click  ${Loc_AdditionalAMPSettings}
    DOMreadyByWaitTime  3
    Click  ${Loc_disableSNMPandTrap}
    DOMreadyByWaitTime  3
    Click  ${Loc_SaveButton}
    DOMreadyByWaitTime  3
    log  SNMP Traps and Syslog messages disabled!  console=True
    






















*** Keywords ***
Login Data Setup CleanupFT
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${UserNameList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginUsername
  ${LoginUserName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UserNameList}  1
  Set Suite Variable  ${LoginUserName1}
  ${PasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginPassword
  ${LoginPassword1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  1
  Set Suite Variable  ${LoginPassword1}
  
Get Report Details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${Client InventoryTitleList} =  Data_Provider.GetDataProviderColumnValue  Data_Client Inventory
    ${Client InventoryTitle} =  Data_Provider.DataProviderSplitterForMultipleValues  ${Client InventoryTitleList}  1
    Set Suite Variable  ${Client InventoryTitle}
    ${Client SessionTitleList} =  Data_Provider.GetDataProviderColumnValue  Data_Client Session
    ${Client SessionTitle} =  Data_Provider.DataProviderSplitterForMultipleValues  ${Client SessionTitleList}  1
    Set Suite Variable  ${Client SessionTitle}
    ${Device SummaryTitleList} =  Data_Provider.GetDataProviderColumnValue  Data_Device Summary
    ${Device SummaryTitle} =  Data_Provider.DataProviderSplitterForMultipleValues  ${Device SummaryTitleList}  1
    Set Suite Variable  ${Device SummaryTitle}
    ${New ClientsTitleList} =  Data_Provider.GetDataProviderColumnValue  Data_New Clients
    ${New ClientsTitle} =  Data_Provider.DataProviderSplitterForMultipleValues  ${New ClientsTitleList}  1
    Set Suite Variable  ${New ClientsTitle}
    
Get Trigger Details to delete
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${NewClientTriggertypeList} =  Data_Provider.GetDataProviderColumnValue  Data_NewClientTrigger
    ${NewClientTriggertype} =  Data_Provider.DataProviderSplitterForMultipleValues  ${NewClientTriggertypeList}  1
    Set Suite Variable  ${NewClientTriggertype}
    ${ConnectedClientsTriggertypeList} =  Data_Provider.GetDataProviderColumnValue  Data_ConnectedClientsTrigger
    ${ConnectedClientsTriggertype} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ConnectedClientsTriggertypeList}  1
    Set Suite Variable  ${ConnectedClientsTriggertype}
    ${ClientCountTriggertypeList} =  Data_Provider.GetDataProviderColumnValue  Data_ClientCountTrigger
    ${ClientCountTriggertype} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ClientCountTriggertypeList}  1
    Set Suite Variable  ${ClientCountTriggertype}
    ${ClientUsagetriggertypeList} =  Data_Provider.GetDataProviderColumnValue  Data_ClientUsagetrigger
    ${ClientUsagetriggertype} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ClientUsagetriggertypeList}  1
    Set Suite Variable  ${ClientUsagetriggertype}
    
Get Controller and group details
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
  ${DeviceIPAddressList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceIPAddress1
    ${DeviceIPAddress1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceIPAddressList}  1
    Set Suite Variable  ${DeviceIPAddress1}
    ${DeviceIPAddress2List} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceIPAddress2
    ${DeviceIPAddress2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceIPAddress2List}  1
    Set Suite Variable  ${DeviceIPAddress2}
    
Get New User Details
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${ReadonlyUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_NewUserReadonlyUsername
  ${NewUserReadonlyUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReadonlyUsernameList}  1
  Set Suite Variable  ${NewUserReadonlyUsername}
  ${ReadonlyRoleList} =  Data_Provider.GetDataProviderColumnValue  Data_NewUserReadonlyRole
  ${NewUserReadonlyRole} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReadonlyRoleList}  1
  Set Suite Variable  ${NewUserReadonlyRole}
  ${LoginPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginPwd
  ${LoginPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${LoginPwdList}  1
  Set Suite Variable  ${LoginPwd}
  
Get Client Monitoring Details
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${LoginPwdList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginPwd
  ${LoginPwd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${LoginPwdList}  1
  Set Suite Variable  ${LoginPwd}
  ${CampusNameList} =  Data_Provider.GetDataProviderColumnValue  Data_CampusName
  ${CampusName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CampusNameList}  1
  Set Suite Variable  ${CampusName}
  ${ReadonlyUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_NewUserReadonlyUsername
  ${NewUserReadonlyUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReadonlyUsernameList}  1
  Set Suite Variable  ${NewUserReadonlyUsername}
  ${RoleUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleForUser
  ${RoleUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleUsernameList}  1
  Set Suite Variable  ${RoleUsername}
  ${GroupNameList} =  Data_Provider.GetDataProviderColumnValue  Data_Groupname1
  ${GroupName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GroupNameList}  1
  Set Suite Variable  ${GroupName1}
  ${FolderNameList} =  Data_Provider.GetDataProviderColumnValue  Data_FolderName1
  ${FolderName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FolderNameList}  1
  Set Suite Variable  ${FolderName1}
  ${FolderName2List} =  Data_Provider.GetDataProviderColumnValue  Data_FolderName2
  ${FolderName2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FolderName2List}  1
  Set Suite Variable  ${FolderName2}
  

*** Variables ***
${LoginUserName1}
${LoginPassword1}
${New ClientsTitle}
${Device SummaryTitle}
${Client SessionTitle}
${Client InventoryTitle}
${NewClientTriggertype}
${ConnectedClientsTriggertype}
${ClientCountTriggertype}
${ClientUsagetriggertype}
${GroupName1}
${GroupName2}
${FolderName1}
${FolderName2}
${DeviceIPAddress1}
${DeviceIPAddress2}
${NewUserReadonlyUsername}
${NewUserReadonlyRole}
${CampusName}
${RoleUsername}
${LoginPwd}

