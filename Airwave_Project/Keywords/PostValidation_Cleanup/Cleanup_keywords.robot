*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Locators/DeviceSetupPages.robot
Resource          ../../Keywords/Device/DeviceSetup_keywords.robot
#Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Locators/Postvalidation_Cleanup.robot
Resource          ../../Keywords/PostValidation_Cleanup/Postvalidation_keywords.robot
Resource          ../../Locators/AMPSetupPage.robot
Resource          ../../Locators/HomePage.robot
Resource          ../../Utilities/Data_Provider.robot

*** Keywords ***
### Groups ###
Delete created New Group in Airwave
    [Arguments]  ${GroupsName}
    Navigate To Group Page
    Sleep  5s
    Navigate To Group List Page
    sleep  5s
    Click  //a[text()='${GroupsName}']/ancestor::tr/td/input
    Click  ${Loc_DeleteGroupButton_css}
    sleep  5s
    Navigate To Group Page
    Navigate To Group List Page
    AssertForElementNotPresent  //tbody//*[contains(text(),'${GroupsName}')]
    Log  Group - ${GroupsName} deleted successfully..!  console=true
    
Delete created Sub Folder
    [Arguments]   ${FoldersName}  ${FoldersName1}
    Navigate To Device Page
    Navigate To Device List Page
    Click  //*[@name="jump_off"]
    DOMreadyByWaitTime  3
    Click  //*[@name="jump_off"]/*[contains(text(),'${FoldersName}')]/following-sibling::*[contains(text(),'${FoldersName1}')]
    DOMreadyByWaitTime  3
    WaitForPageLoading
    WaitForElementPresent  ${Loc_DeleteFoldercss}
    Click  ${Loc_DeleteFoldercss}
    WaitForElementPresent  ${Loc_DeleteFolderConfirmButtoncss}
    Click  ${Loc_DeleteFolderConfirmButtoncss}
    Sleep  5s
    AssertForElementNotPresent  //*[@name="jump_off"]/*[contains(text(),'${FoldersName}')]/following-sibling::*[contains(text(),'${FoldersName1}')]
    Log  Sub-folder - ${FoldersName1} deleted successfully!  console=True
    


Delete created New Folder
    [Arguments]  ${deviceFolder}
    Navigate To Device Page
    Navigate To Device List Page
    Click  //*[@name="jump_off"]
    DOMreadyByWaitTime  3
    Click  //*[@name="jump_off"]/*[contains(text(),'${deviceFolder}')]
    DOMreadyByWaitTime  3
   # Navigate To TOP Folder page
   # Select From Dropdown List  ${Home_TOP_FolderPage_css}  ${deviceFolder}
    WaitForPageLoading
    WaitForElementPresent  ${Loc_DeleteFoldercss}
    Click  ${Loc_DeleteFoldercss}
    WaitForElementPresent  ${Loc_DeleteFolderConfirmButtoncss}
    Click  ${Loc_DeleteFolderConfirmButtoncss}
    Sleep  5s
    AssertForElementNotPresent  ${Loc_DeleteFoldercss}
    Log  Folder - ${deviceFolder} deleted successfully..!  console=true
    
Delete a New Group with Status Polling after upgrade
    [Arguments]  ${GroupsName}
    Navigate To Group Page
    Sleep  5s
    Navigate To Group List Page
    sleep  5s
    Click  //a[text()='${GroupsName}']/ancestor::tr/td/input
    Click  ${Loc_DeleteGroupButton_css}
    sleep  5s
    Navigate To Group Page
    Navigate To Group List Page
    AssertForElementNotPresent  //tbody//*[contains(text(),'${GroupsName}')]
    Log  Group - ${GroupsName} deleted successfully..!  console=true
    
Delete Added New Device
    [Arguments]  ${DeviceName}  ${deviceIPAddress}
    Navigate to Home Page
    Click  ${Loc_icon_search}
    Type  ${Loc_search_input_xpath}  ${deviceIPAddress}
    Click  ${Loc_searchPopup}
    DOMreadyByWaitTime  5
    Click  //*[@id="switches_button"]
    Sleep  5    
    ${count}  get element count  //*[text()='${deviceIPAddress}']
    Run keyword if  ${count}==0  Click  ${Loc_close_button}
    Run keyword if  ${count}==0  Fail  Newly added device not present!
    Click  //*[text()='${deviceIPAddress}']
    Wait Until Element Is Not Visible  ${loader}  30s
    Wait Until Element Is Visible  ${Device_manage_xpath}  30s
    Sleep  3s
    Click  ${Device_manage_xpath}
    Wait Until Element Is Not Visible  ${loader}  30s
    Click  ${Loc_Delete_button}
    DOMreadyByWaitTime  3
    Click  ${Loc_ApplyChangesButton_css}
    DOMreadyByWaitTime  3
    Log  switch in ${deviceIPAddress} deleted!  console=True
    
    
    

### Visual RF ###
Delete created Campus
    [Arguments]  ${CampusName}
    ${SelectCampus}  Catenate  ${Loc_SelectCampus_xpath}  text()='${CampusName}']
    Click  ${SelectCampus}
    Sleep  5s
    Click  ${editbutton_css}
    DOMreadyByWaitTime  5
    Click  ${Loc_Clean_campusRemove}
    DOMreadyByWaitTime  3
    Click  ${Loc_clean_confirmremove}
    DOMreadyByWaitTime  3
    Log  Campus: ${CampusName} deleted!  console=True
    
    
    

Cleanup for Enable VisualRF after upgrade
    Click  ${Loc_Clean_VRFenablevalue}
    Click  ${Loc_save}
    DOMreadyByWaitTime  10
    Wait until element is visible  ${Loc_save}  50s
    Click  ${Loc_save}
    DOMreadyByWaitTime  3
    Log  VRF disabled!  console=True
    
    

### Client Monitoring Page ###
Delete Controller device
    [Arguments]  ${IP}
    Click  //*[@id="controllers_button"]
    sleep  5s
    ${Count}  get element count  //*[@title='${IP}']
    Run keyword if  ${Count}==0  Click  ${Loc_close_button}
    Run keyword if  ${Count}==0  Fail  No controller present in ${IP}!
    Click  //*[@title='${IP}']
    Wait Until Element Is Not Visible  ${loader}  30s
    Wait Until Element Is Visible  ${Device_manage_xpath}  30s
    Sleep  3s
    Click  ${Device_manage_xpath}
    Wait Until Element Is Not Visible  ${loader}  30s
    Click  ${Loc_Delete_button}
    DOMreadyByWaitTime  3
    Click  ${Loc_ApplyChangesButton_css}
    DOMreadyByWaitTime  3
    Log  controller in ${IP} deleted!  console=True
    
    
    

### Alerts Page ###
Delete the Generated specific Alarm
    [Arguments]  ${type}  ${severity}  ${value}
    Navigate To Systems Page
    Navigate To Systems Alerts Page
    AssertForElementPresent  //*[text()='${type}']/following-sibling::*[contains(text(),'${value}')]/parent::*/*/following-sibling::*/*[text()='${severity}']/parent::*/preceding-sibling::*/*[@type="checkbox"]
    Click  //*[text()='${type}']/following-sibling::*[contains(text(),'${value}')]/parent::*/*/following-sibling::*/*[text()='${severity}']/parent::*/preceding-sibling::*/*[@type="checkbox"]
    DOMreadyByWaitTime  3
    Click  ${Loc_Delete_button}
    DOMreadyByWaitTime  3
    
    Log  Alerts ${type}-${severity} Deleted!  console=True

### Reports Page ###
Delete created Report
    [Arguments]  ${title}  ${type}
    Type  ${Loc_ReportSearch}  ${title}
    Press Keys  None  RETURN
    DOMreadyByWaitTime  3
    AssertForElementPresent  //*[text()='${title}']/ancestor::tr/*[text()='${type}']/preceding-sibling::*/*[@type="checkbox"]
    Click  //*[text()='${title}']/ancestor::tr/*[text()='${type}']/preceding-sibling::*/*[@type="checkbox"]
    DOMreadyByWaitTime  3
    Click  ${Loc_ReportDelete_button}
    DOMreadyByWaitTime  3
    Click  ${Loc_ApplyChangesButton_css}
    DOMreadyByWaitTime  3
    Type  ${Loc_ReportSearch}  ${title}
    Press Keys  None  RETURN
    DOMreadyByWaitTime  3
    AssertForElementNotPresent  //*[text()='${title}']/ancestor::tr/*[text()='${type}']/preceding-sibling::*/*[@type="checkbox"]
    log  ${title} - Report deleted!  console=True

    
    
    
    
### Rapids Page ###
Change ARP IP Match Timeout to default
    [Arguments]  ${value}
    Type  ${Loc_ARPIPMatch}  ${value}
    Log  Changed to default ${value}  console=True
    Click  ${Loc_Save}
    DOMreadyByWaitTime  3
    
Modify rogue rules after upgrade
    Click  ${Loc_signalstrengthEditicon}
    DOMreadyByWaitTime  5
    Wait Until Element Is Not Visible  ${loader}  30s
    Click  ${Loc_enablebutton} 
    Click  ${Loc_savebutton}
    DOMreadyByWaitTime  3
    
Delete new rule and verify
    [Arguments]  ${Rulename}
    Click  //*[text()='${Rulename}']/parent::*//*[@type="checkbox"]
    Click  ${Loc_Delete_button}
    DOMreadyByWaitTime  3
    Drag and Drop  ${Loc_signalDrag}  (${Loc_dropRule})[1]
    DOMreadyByWaitTime  5
    Click  ${Loc_savandApply}
    DOMreadyByWaitTime  3
    Click  ${Loc_applychanges}
    DOMreadyByWaitTime  3
    Log  New rule - ${Rulename} deleted and priority set to default  console=True
    


### Device Setup Page ###
ModifyTelnetAndSSHusername to default
    [Arguments]  ${Username}
    Click  ${Loc_ArubaEdit}
    Type  ${Loc_Username}  ${Username}
    Click  ${Loc_CommunicationSave}
    
Delete Certificate
    [Arguments]  ${name}  ${Type}
    Click  //*[text()='${name}']/parent::*/following-sibling::*[text()='${Type}']/preceding-sibling::*/*[@type="checkbox"]
    Click  ${Loc_Delete_button}
    DOMreadyByWaitTime  5
    WaitForElementPresent  ${Loc_DeleteConfirm}
    Log  ${name}-${Type} certificate deleted!  console=True

### AMPsetup Page ###
Delete Customization of Top Header
    Click  ${Loc_TopHeader}
    DOMreadyByWaitTime  3
    Click  ${Loc_VPNusers_checkbox}
    Click  ${Loc_Save}
    Navigate To AMP Setup Page
    AssertForElementNotPresent  ${Loc_VPNusers_header}
    Log  Top Header reverted!  console=True
    
Delete customization of Firmware Upgrade/Reboot Options
    Click  ${Loc_FirmwareReboot}
    DOMreadyByWaitTime  3
    Click  ${Loc_Clean_FirmwareRadioButton}
    Click  ${Loc_Save}
    Navigate To AMP Setup Page
    Log  Firmware Upgrade/Reboot Options reverted!  console=True
    
Delete Customization for Automatic Authorization
    Navigate To AMP Setup Page
    Click  ${Loc_AutomaticAuthorization}
    DOMreadyByWaitTime  3
    Click  ${Loc_Clean_APWhitelistRadioButton}
    DOMreadyByWaitTime  3
    Click  ${Loc_Clean_SwitchWhitelistRadioButton}
    Click  ${Loc_Save}
    Navigate To AMP Setup Page
    Log  Automatic Authorization reverted!  console=True
    
### Discover Devices ###
Delete device with eval license
    [Arguments]  ${network}
    ### network delete
    Delete devices  ${Loc_pv_addNetwork}  ${network}  ${loc_Networkdelete}
    ### Credential delete  
    Delete devices  ${Loc_pv_addCredential}  ${network}  ${Loc_credentialDelete}
    ### Scanset delete
    AssertForElementNotPresent  ${Loc_pv_addScanset}//td[contains(.,'${network}')]
   # Delete devices  ${Loc_pv_addScanset}  ${network}  ${Loc_ScansetDelete}
    Log  ${network} with eval license deleted!  console=True
    
Delete device with permanent license
    [Arguments]  ${network}
    ### network delete
    Delete devices  ${Loc_pv_addNetwork}  ${network}  ${loc_Networkdelete}
    ### Credential delete  
    Delete devices  ${Loc_pv_addCredential}  ${network}  ${Loc_credentialDelete}
    ### Scanset delete
    AssertForElementNotPresent  ${Loc_pv_addScanset}//td[contains(.,'${network}')]
  # Delete devices  ${Loc_pv_addScanset}  ${network}  ${Loc_ScansetDelete}
    Log  ${network} with permanent license deleted!  console=True
    
Delete added Devices after upgrade
    Navigate to Device Page
    Navigate To Device New Page
    
   # Click  ${Loc_NewDevice_Header}
    DOMreadyByWaitTime  5
    Click  ${Loc_DeviceActionDropdowm}
    DOMreadyByWaitTime  2
    Click  ${Loc_selectDeleteDevice}
    DOMreadyByWaitTime  2
    Click  ${Loc_DeviceCheckbox}
    Click  ${Loc_DeviceDeleteButton}
    DOMreadyByWaitTime  5
    Click  ${Loc_ApplyChangesButton}
    Wait Until Element Is Not Visible  ${loader}  30s
    Reload page
    DOMreadyByWaitTime  60
    
    
Delete Network Scan
    [Arguments]  ${network}
    ### network delete
    Delete devices  ${Loc_pv_addNetwork}  ${network}  ${loc_Networkdelete}
    ### Credential delete  
    Delete devices  ${Loc_pv_addCredential}  ${network}  ${Loc_credentialDelete}
    ### Scanset delete
    AssertForElementNotPresent  ${Loc_pv_addScanset}//td[contains(.,'${network}')]
  # Delete devices  ${Loc_pv_addScanset}  ${network}  ${Loc_ScansetDelete}
    Log  ${network} scan network deleted!  console=True
    
Delete devices
    [Arguments]  ${type}  ${added_network}  ${delete_button}
    Click  ${type}//td[contains(.,'${added_network}')]${Loc_clean_Checkbox}
    Click  ${delete_button}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_DeleteConfirm}
    
*** Variables ***

### device setup ###
${evalNetworkname}
${permanentNetworkname}
${scanNetworkname}
${Comm_DevType}
${Comm_TestUsername}
${TrustedCertName}
${IntermediateCertName}
${MultiIntermediateCertName}
${TrustedType}
${IntermediateType}
${MultiIntermediateType}
${Comm_Username}

### Reports ###
${Reporttitle}
${ReportType}

### Groups Page ###
${GroupsName}
${FoldersName}
${FoldersName1}
${GroupsName1}
${Pollingtime}
${StatusPolling}
${Groupname2}
${DeviceName}
${DeviceGroup}
${DeviceFolder}
${deviceIPAddress}


### alerts ###
${TriggerList}
${SeverityValue}
${InputValue}

### rapids ###
${Rulename}
${ValueClean}
### Client Monitoring ###
${Controller_IP}

### VRF ###
${CampusName}
${CleanCampusName}
