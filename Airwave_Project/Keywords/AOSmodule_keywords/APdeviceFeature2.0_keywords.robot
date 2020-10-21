*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../Locators/APdeviceFeature.robot
Library           ../../Utilities/Common/WebdriverHelper.py
Resource          ../../Utilities/Data_Provider.robot



*** Keywords ***


Select AOS controller
    [Arguments]  ${controller} 
    Click  ${Loc_icon_searchAP}
    Type  ${Loc_search_input_xpathAP}  ${controller}
    Sleep  5s
    Click  ${Loc_searchPopupAP}
    sleep  5s
    Click  ${Loc_ControllerButton}
    Sleep  5
    ${Count}  get element count  ${Loc_ControllerLink}
    Run keyword if  ${Count}==0  Click  ${Loc_close_buttonAP}
    Run keyword if  ${Count}==0  Fail  Controller not present!
    Click  ${Loc_ControllerLink}
    DOMreadyByWaitTime  5
    Wait Until Element Is Not Visible  ${loader}  60s
    DOMreadyByWaitTime  10
    
    
Select and Poll Controller device
    [Arguments]  ${controller}
    Webdriverlib Helper Init
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Click  ${Loc_DeviceActionDropdowm}
    DOMreadyByWaitTime  2
    Click  ${Loc_SelectPollDevice}
    DOMreadyByWaitTime  2
    ${Count}  get element count  //*[@title="${controller}"]/parent::*/preceding-sibling::*[@class="m_checkbox"]/* 
    Run keyword if  ${Count}==0  Fail  No Device present! 
    @{ControllerDevice}  Get Webelements  //*[@title="${controller}"]/parent::*/preceding-sibling::*[@class="m_checkbox"]/*
    :FOR  ${dev}  IN   @{ControllerDevice}
    \    Click  ${dev}
    \    DOMreadyByWaitTime  2
    Click  ${Loc_PollButton}
    DOMreadyByWaitTime  5
    Click  ${Loc_ApplyChangesButtonAP}
    DOMreadyByWaitTime  5
    Element Should be visible  ${Loc_SuccessfulMsg}
    Log  Polling the AOS8.0 controllers verified!  console=True
    
Select and Group Poll Controller
    [Arguments]  ${AOSGroup}
    Navigate To Group Page
    Sleep  5s
    Navigate To Group List Page
    sleep  5s
    Click  //a[text()='${AOSGroup}']/ancestor::tr/td/*/a
    DOMreadyByWaitTime  10
    Navigate to GroupMonitor PageAP
    DOMreadyByWaitTime  5
    Webdriverlib Helper Init
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Click  ${Loc_DeviceActionDropdowm}
    DOMreadyByWaitTime  2
    Click  ${Loc_SelectPollDevice}
    DOMreadyByWaitTime  2
    ${Count}  get element count  ${Loc_DevCount}
    Run keyword if  ${Count}==0  Fail  No Device present! 
    Click  ${Loc_AllDeviceCheckbox}
    DOMreadyByWaitTime  5
    Click  ${Loc_PollButton}
    DOMreadyByWaitTime  5
    Click  ${Loc_ApplyChangesButtonAP}
    DOMreadyByWaitTime  5
    Element Should be visible  ${Loc_SuccessfulMsg}
    Log  Group Polling the AOS8.0 controllers verified!  console=True
    
    
    
Verify Quick Link open web UI
     @{list}  Create List  ${UIcolumn1}  ${UIcolumn2}  ${UIcolumn3}  ${UIcolumn4}  ${UIcolumn5}  ${UIcolumn6}  ${UIcolumn7}  ${UIcolumn8}  ${UIcolumn9}  ${UIcolumn10}  ${UIcolumn11}  ${UIcolumn12}  ${UIcolumn13}  ${UIcolumn14}
     ${state}  Set Variable  True
     @{search_result}    Get WebElements  ${Columns_list_xpath}
    :FOR  ${var1}  IN  @{search_result}
    \    log  ${var1.text}  console=True
    \    ${status}=  Run Keyword And Return Status  List Should Contain Value  ${list}  ${var1.text}
    \    Log  ${status}  console=True
    \    ${state}  Set Variable If  '${status}'=='False'  False  ${state}
    Should be true  ${state}
    
    
Verify Quick Links
    [Arguments]  ${controller}  ${runcommand}
    Select Dropdown LabelValue  ${Loc_RuncommandQL}  ${runcommand}  
    DOMreadyByWaitTime  10
    Switch Window  locator=NEW
    Maximize Browser window
    DOMreadyByWaitTime  10
    ${Source}  Get Source
    ${Source}  Convert to string  ${Source}
    Log  ${Source}
    Close Window
    DOMreadyByWaitTime  3
    Switch Window  MAIN
    Should Contain  ${Source}  Device Name: ${controller}
    Log  Device Name: ${controller} verified in Quick link  console=True
    Should Contain  ${Source}  Command: ${runcommand}
    Log  Command: ${runcommand} verified in Quick link  console=True
    DOMreadyByWaitTime  5
    Log  Quick links in monitor page verified!  console=True
    
    

Create Group For AOS controller
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
    
Create Folder For AOS Controler
    [Arguments]  ${FolderName1}
    Navigate To Device Page
    Navigate To Device List Page
    Focus Element  ${Loc_AddNewFolder_XpathFT}
    Click  ${Loc_AddNewFolder_XpathFT}
    WaitForElementPresent  ${Loc_FolderNameField_cssFT}
    Type Text  ${Loc_FolderNameField_cssFT}  ${FolderName1}
    Focus Element  ${Loc_ParentFolderField_cssFT}
    Select Dropdown LabelValue  ${Loc_ParentFolderField_cssFT}  ${DefaultFolderName1}
    Click  ${Loc_FolderAddButtonField_cssFT}
    DOMreadyByWaitTime  3
    AssertForElementPresent  //p[@class="icofirst icon_confirmed ok"]
    AssertForElementPresent  //*[@name="jump_off"]/*[contains(text(),'${FolderName1}')]
    Log  Folder - ${FolderName1} created successfully..!  console=true
    
Select and Move Controller device
    [Arguments]  ${controller}  ${Groupname}
    Webdriverlib Helper Init
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Click  ${Loc_DeviceActionDropdowm}
    DOMreadyByWaitTime  2
    Click  ${Loc_SelectMoveDevice}
    DOMreadyByWaitTime  2
    Click  ${Loc_MoveGroupDropdowm}
    DOMreadyByWaitTime  2
    Click  //*[text()='${Groupname}']
    DOMreadyByWaitTime  10
    
    ${Count}  get element count  //*[@title="${controller}"]/parent::*/preceding-sibling::*[@class="m_checkbox"]/* 
    Run keyword if  ${Count}==0  Fail  No Device present!
    ${defaultgroup}  Get Element Text  //*[@title="${controller}"]/parent::*/preceding-sibling::*/*[contains(@href,'group')]
    @{ControllerDevice}  Get Webelements  //*[@title="${controller}"]/parent::*/preceding-sibling::*[@class="m_checkbox"]/*
    :FOR  ${dev}  IN   @{ControllerDevice}
    \    Click  ${dev}
    \    DOMreadyByWaitTime  2
    Click  ${Loc_MoveButton}
    DOMreadyByWaitTime  5
    Click  ${Loc_ContinueButton}
    DOMreadyByWaitTime  5
    Click  ${Loc_ApplyChangesButtonAP}
    DOMreadyByWaitTime  5
    Log  Devices moved from ${defaultgroup} to ${Groupname} successfully!  console=True
    [return]  ${defaultgroup}
    
Select and Move Controller device1
    [Arguments]  ${controller}  ${Groupname}
    Webdriverlib Helper Init
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Click  ${Loc_DeviceActionDropdowm}
    DOMreadyByWaitTime  2
    Click  ${Loc_SelectMoveDevice}
    DOMreadyByWaitTime  2
    Click  ${Loc_MoveGroupDropdowm}
    DOMreadyByWaitTime  2
    Click  //*[text()='${Groupname}']
    DOMreadyByWaitTime  2
    
    
    ${Count}  get element count  //*[@title="${controller}"]/parent::*/preceding-sibling::*[@class="m_checkbox"]/* 
    Run keyword if  ${Count}==0  Fail  No Device present!
    @{ControllerDevice}  Get Webelements  //*[@title="${controller}"]/parent::*/preceding-sibling::*[@class="m_checkbox"]/*
    :FOR  ${dev}  IN   @{ControllerDevice}
    \    Click  ${dev}
    \    DOMreadyByWaitTime  2
    Click  ${Loc_MoveButton}
    DOMreadyByWaitTime  5
    Click  ${Loc_ContinueButton}
    DOMreadyByWaitTime  5
    Click  ${Loc_ApplyChangesButtonAP}
    DOMreadyByWaitTime  5
    Log  Device reverted back to ${Groupname}  console=True
    
Verify device in new group
    [Arguments]  ${controller}  ${Groupname}
    Navigate To Group Page
    Sleep  5s
    Navigate To Group List Page
    sleep  5s
    Click  //a[text()='${Groupname}']/ancestor::tr/td/*/a
    DOMreadyByWaitTime  10
    Navigate to GroupMonitor PageAP
    DOMreadyByWaitTime  5
    ${Count}  get element count  //*[@title="${controller}"]
    Run keyword if  ${Count}==0  Fail  Controller not present!
    AssertForElementPresent  //*[@title="${controller}"]
    Log  Devices present in new group!  console=True
    

Revert Back and Delete new group
    [Arguments]  ${controller}  ${Groupname}  ${defaultgrp}
  #  Select AOS controller  ${controller}
    Select and Move Controller device1  ${controller}  ${defaultgrp}
    Delete New group  ${Groupname}  
    Log  Device moved to new group and verified successfully!  console=True
    
    
Check Audit option
    Webdriverlib Helper Init
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Click  ${Loc_DeviceActionDropdowm}
    DOMreadyByWaitTime  2
    Click  ${Loc_SelectAuditDevice}
    DOMreadyByWaitTime  2
    Element Should be visible  ${Loc_AuditButtonAP}
    Log  Audit Setting verified!  console=True
    
    
Delete New group
    [Arguments]  ${GroupsName}
    Navigate To Group Page
    Sleep  5s
    Navigate To Group List Page
    sleep  5s
    Click  //a[text()='${GroupsName}']/ancestor::tr/td/input
    Click  ${Loc_DeleteGroupButton_cssAP}
    sleep  5s
    Navigate To Group Page
    Navigate To Group List Page
    AssertForElementNotPresent  //tbody//*[contains(text(),'${GroupsName}')]
    Log  New Group - ${GroupsName} deleted successfully..!  console=true    
    
    
    



Navigate to GroupMonitor PageAP
    Wait Until Element Is Visible  ${Loc_MonitorFT}
    Sleep  3s
    Click  ${Loc_MonitorFT}
    Wait Until Element Is Not Visible  ${loader}  30s
    
    

Check Firmware option in AMPsetup
    Navigate To AMP Setup Page
    Navigate To AMP Setup General Page
    DOMreadyByWaitTime  5
    Click  ${Loc_FirmwareOption}
    DOMreadyByWaitTime  5
    ${status}  Run keyword and return status  Radio button should be set to  ${Loc_rebootRadiobutton}  ${Loc_Rebootbutton_value}
    Run keyword If  '${status}'=='False'  Click  ${Loc_dis_FirmwareRadioButton}
    Run keyword If  '${status}'=='False'  Click  ${Loc_AMPSave}
    DOMreadyByWaitTime  5
    
Verify Firmware upgrade option in MM device
    Navigate To Device Manage Page
    DOMreadyByWaitTime  3
    AssertForElementNotPresent  ${Loc_FirmwareDevice_info}
    Log  Firmware upgrade option not present in MM device!  console=True
    


Navigate To Device Manage Page
    Wait Until Element Is Visible  ${Loc_Device_manage_xpath}  30s
    Sleep  3s
    Click  ${Loc_Device_manage_xpath}
    Wait Until Element Is Not Visible  ${loader}  30s
      
    
    
Add AOS Controller
    [Arguments]  ${DeviceType}  ${DeviceIPAddress}  ${DeviceCommunityString}  ${TelnetSSHUsername}  ${TelnetSSHPassword}  ${GroupName}  ${FolderName}
    Navigate To Device Setup Page
    Navigate To Device Setup Add Page
    WaitForElementPresent  ${Loc_DeviceTypeDropdown_cssAOS}
    Select Dropdown LabelValue  ${Loc_DeviceTypeDropdown_cssAOS}  ${DeviceType}
    Click  ${Loc_AddButton_cssAOS}
    ${value}  Catenate  Creating  ${DeviceType}
    Page Should Contain  ${value}
    #Type Text  ${Loc_NameField_css}  ${DeviceName}
    Type Text  ${Loc_IPAddressField_xpathAOS}  ${DeviceIPAddress}
    Type Text  ${Loc_CommunityStringField_cssAOS}  ${DeviceCommunityString}
    Type Text  ${Loc_ConfirmCommunityStringField_cssAOS}  ${DeviceCommunityString}
    Type Text  ${Loc_TelnetSSHUsernameField_cssAOS}  ${TelnetSSHUsername}
    Type Text  ${Loc_TelnetSSHPasswordField_cssAOS}  ${TelnetSSHPassword}
    Type Text  ${Loc_ConfirmTelnetSSHPasswordField_cssAOS}  ${TelnetSSHPassword}
    Select Dropdown LabelValue  ${Loc_SelectGroupField_cssAOS}  ${GroupName}
    Focus Element  ${Loc_SelectFolderField_cssAOS}
    DOMreadyByWaitTime  3
    Select From Dropdown List  ${Loc_SelectFolderField_cssAOS}  ${FolderName}
    Click  ${Loc_DeviceAddButton_cssAOS}
    WaitForPageLoading
    AssertForTableElementPresent  ${GroupName}
    AssertForTableElementPresent  ${FolderName}
    AssertForElementPresent  ${Loc_ApplyChangesButton_cssAOS}
    AssertForElementPresent  ${Loc_CancelButton_cssAOS}
    Click  ${Loc_ApplyChangesButton_cssAOS}
    WaitForPageLoading
    Sleep  5s
    ${ip_address}  Catenate  SEPARATOR=  ${Loc_IPAddressField_xpathAOS}  [@value='${DeviceIPAddress}']
    AssertForElementPresent  ${ip_address}
    Log  ${DeviceIPAddress} device created successfully..!  console=true
    sleep  20s
    Navigate to DeviceMonitor PageAOS
    sleep  5s
    Click PollAOS
   # Wait Until Element Is Visible  ${Loc_PollingMessage}  30s
    DOMreadyByWaitTime  320
    
    Log  Device - ${DeviceIPAddress} verified!  console=True
    
Exit Controller ExecutionAOS
   # Click  ${Loc_close_buttonFT}
    Fail  Up status controller not present
    
Navigate to DeviceMonitor PageAOS
    Wait Until Element Is Visible  ${Loc_MonitorFT}
    Sleep  3s
    Click  ${Loc_MonitorFT}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Click PollAOS
    ${controllerPollcount}  get element count  ${Loc_Poll_buttonAOS}
  #  ${switchPollcount}  get element count  ${Loc_switchPoll}
    Run Keyword if  ${controllerPollcount} > 0  Double click  ${Loc_Poll_buttonAOS}
    ...  ELSE    Double click  ${Loc_switchPollAOS}
    

Add MD To group
    [Arguments]  ${MD1}  ${MD2}  ${Group}
    Navigate to Device Page
    Navigate To Device New Page
    DOMreadyByWaitTime  5
    ${count}  Get Element Count  //*[text()='${MD1}']/ancestor::*/*[@class="m_checkbox"]
    Run keyword if  ${count}==0  Fail  No MD devices!
    Click  //*[text()='${MD1}']/ancestor::*/*[@class="m_checkbox"]
    Click  //*[text()='${MD2}']/ancestor::*/*[@class="m_checkbox"]
    Click  ${Loc_GroupSelect}
    DOMreadyByWaitTime  3
    Click  //*[text()='${Group}']
    DOMreadyByWaitTime  3
    Click  ${Loc_DevAdd}
    DOMreadyByWaitTime  3
    Click  ${Loc_ApplyChangesButton_cssAOS}
    Log  ${MD1} _ ${MD2} devices added to ${Group} group  console=True
    DOMreadyByWaitTime  300
    

Add AP To group
    [Arguments]  ${AP1}  ${AP2}  ${Group}
    Navigate to Device Page
    Navigate To Device New Page
    DOMreadyByWaitTime  5
    ${count}  Get Element Count  //*[text()='${AP1}']/ancestor::*/*[@class="m_checkbox"]
    Run keyword if  ${count}==0  Fail  No MD devices!
    Click  //*[text()='${AP1}']/ancestor::*/*[@class="m_checkbox"]
    Click  //*[text()='${AP2}']/ancestor::*/*[@class="m_checkbox"]
    Click  ${Loc_GroupSelect}
    DOMreadyByWaitTime  3
    Click  //*[text()='${Group}']
    DOMreadyByWaitTime  3
    Click  ${Loc_DevAdd}
    DOMreadyByWaitTime  3
    Click  ${Loc_ApplyChangesButton_cssAOS}
    Log  ${AP1} _ ${AP2} devices added to ${Group} group  console=True
    DOMreadyByWaitTime  300

    
        
Check MDs in Monitor Page
    [Arguments]  ${AOSMD1}  ${AOSMD2}
    DOMreadyByWaitTime  10
    Element should be visible  //*[@title="${AOSMD1}"]
    Element should be visible  //*[@title="${AOSMD2}"]
    Log  MD device verified!  console=True
    


Check Device Config Status
    [Arguments]  ${Status}  ${configuration}
    DOMreadyByWaitTime  5
    Click PollAOS
    DOMreadyByWaitTime  320
    AssertForElementPresent  ${Loc_PollStatusAOS}*[contains(.,'${Status}')]
    Log  Status: ${Status}  console=True
    AssertForElementPresent  ${Loc_PollConfigurationAOS}*[contains(.,'${configuration}')]
    Log  Configuration: ${configuration}  console=True
    Log  Device Config of MM controller verified!  console=True



Get AMP controller details
    Get AOS amp details  AMP details
    ${Firmware}  Getfirmwaredetails  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  ${Firmwarecmd}
    Log  AMP Firmware: ${Firmware}  console=True
    ${Type}  Get Controller Type  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  ${Typecmd}
    Log  AMP Type: ${Type}  console=True
    [return]  ${Firmware}  ${Type}

Verify Device Info with AMP
    [Arguments]  ${firmware}  ${type} 
    ${Firm}  Get element text  ${Loc_FirmwareText}
    Log  Controller Firmware: ${Firm}  console=True
    Should be true  "${Firm}" == "${firmware}"
    ${ControllerType}  Get Element Text  ${Loc_TypeText}
    ${ControllerType}  Replace string  ${ControllerType}  ${SPACE}  ${EMPTY}
    Log  Controller Type: ${ControllerType}  console=True
    Should be true  "${ControllerType}" == "${type}"
    Log  Controller Device info verified with AMP  console=True
    
Verify firmware upgrade
    [Documentation]  Check for Renaming the devices in AP List page
    Click  ${Loc_AP_List}
    DOMreadyByWaitTime  5
    Click  xpath=//*[contains(@key,'ap_group_id')]/following-sibling::div[2]
   
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
    Select From Dropdown List  xpath=//*[contains(text(),'Change device Group/Folder')]  upgrade firmware for selected devices

Verify rebooting the devices
    [Documentation]  Check for Renaming the devices in AP List page
    Click  ${Loc_AP_List}
    DOMreadyByWaitTime  5
    Click  xpath=//*[contains(@key,'ap_group_id')]/following-sibling::div[2]
   
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
    Select From Dropdown List  xpath=//*[contains(text(),'Change device Group/Folder')]  Reboot selected devices

Verify factory reset
    [Documentation]  Check for Renaming the devices in AP List page
    Click  ${Loc_AP_List}
    DOMreadyByWaitTime  5
    Click  xpath=//*[contains(@key,'ap_group_id')]/following-sibling::div[2]
   
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
    Select From Dropdown List  xpath=//*[contains(text(),'Change device Group/Folder')]  Factory reset selected devices

FactoryReset the device
    [Arguments]  ${input1}
    [Documentation]  Check for Renaming the devices in AP List page
    Navigate To Device Page
    Navigate To Device List Page
    DOMreadyByWaitTime  10
   # Click  ${Loc_AP_List}
    DOMreadyByWaitTime  5
    Click  ${Loc_GroupFilter}
   
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
  
    Type  ${Loc_Input1}  ${input1}
    Click  //*[@class="goog-menuitem-content"]/*[contains(.,'${input1}')]
    Webdriverlib Helper Init    
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    DOMreadyByWaitTime  5
    Input Text  ${Loc_Input2}  rrrr       
    Click  ${Loc_ChangeDeviceGroup}
    DOMreadyByWaitTime  2
    Click  ${Loc_FactoryResetDevice}
    DOMreadyByWaitTime  2

Reboot the device
    [Arguments]  ${input1}
    [Documentation]  Check for Renaming the devices in AP List page
     Navigate To Device Page
    Navigate To Device List Page
    DOMreadyByWaitTime  10
  #  Click  ${Loc_AP_List}
    DOMreadyByWaitTime  5
    Click  ${Loc_GroupFilter}
   
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
  
    Type  ${Loc_Input1}  ${input1}
    Click  //*[@class="goog-menuitem-content"]/*[contains(.,'${input1}')]
    Webdriverlib Helper Init    
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    DOMreadyByWaitTime  5
    Input Text  ${Loc_Input2}  rrrr       
    Click  ${Loc_ChangeDeviceGroup}
    DOMreadyByWaitTime  2
    Click  ${Loc_RebootDevice}
    DOMreadyByWaitTime  2




Check for Renaming the devices
    [Arguments]  ${input1}
    [Documentation]  Check for Renaming the devices in AP List page
    Navigate To Device Page
    Navigate To Device List Page
    DOMreadyByWaitTime  10
  #  Click  ${Loc_AP_List}
    DOMreadyByWaitTime  5
    Click  ${Loc_GroupFilter}
   
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
    Type  ${Loc_Input1}  ${input1}
    Click  //*[@class="goog-menuitem-content"]/*[contains(.,'${input1}')]
    DOMreadyByWaitTime  5
    Webdriverlib Helper Init    
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Type  ${Loc_Input2}  rrrr
    Click  ${Loc_ChangeDeviceGroup}
    DOMreadyByWaitTime  2
    Click  ${Loc_Rename_Devices}
    DOMreadyByWaitTime  2
    Click  css=.goog-button.m_inline_block
    DOMreadyByWaitTime  5
    Scroll element into view  ${Loc_AlertError}
    ${output}=  Get text  ${Loc_AlertError}
    log  ${output} 
    Should Be Equal As Strings  ${output}  ${expected_RenameResult}


Check for firmware upgrade
    [Arguments]  ${input1}
    [Documentation]  Check for Renaming the devices in AP List page
    Navigate To Device Page
    Navigate To Device List Page
    DOMreadyByWaitTime  10
  #  Click  ${Loc_AP_List}
    DOMreadyByWaitTime  5
    Click  ${Loc_GroupFilter}
   
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
    Type  ${Loc_Input1}  ${input1}
    Click  //*[@class="goog-menuitem-content"]/*[contains(.,'${input1}')]
    DOMreadyByWaitTime  5
    Webdriverlib Helper Init    
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Type  ${Loc_Input2}  rrrr    
    Click  ${Loc_ChangeDeviceGroup}
    DOMreadyByWaitTime  2
    Click  ${Loc_UpgradeFirmware}
    DOMreadyByWaitTime  2
    Click  css=.goog-button.m_inline_block
    DOMreadyByWaitTime  5
    Scroll element into view  ${Loc_AlertError}
    ${output}=  Get text  ${Loc_AlertError}
    log  ${output} 
    Should Be Equal As Strings  ${output}  ${expected_Upgraderesult}
    
Check for Reprovisioning 
    [Arguments]  ${input1}
    [Documentation]  Check for Renaming the devices in AP List page
    Navigate To Device Page
    Navigate To Device List Page
    DOMreadyByWaitTime  10
  #  Click  ${Loc_AP_List}
    DOMreadyByWaitTime  5
    Click  ${Loc_GroupFilter}
   
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
    Type  ${Loc_Input1}  ${input1}
    Click  //*[@class="goog-menuitem-content"]/*[contains(.,'${input1}')]
    DOMreadyByWaitTime  5
    Webdriverlib Helper Init    
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Type  ${Loc_Input2}  rrrr       
    Click  ${Loc_ChangeDeviceGroup}
    DOMreadyByWaitTime  2
    Click  ${Loc_ReProvisioning}
    DOMreadyByWaitTime  2
    Click  css=.goog-button.m_inline_block
    DOMreadyByWaitTime  5
    Scroll element into view  ${Loc_AlertError}
    ${output}=  Get text  ${Loc_AlertError}
    log  ${output} 
    Should Be Equal As Strings  ${output}  ${expected_ReProvisioning}
    
Check Aruba profile Import
    [Arguments]  ${input1}
    [Documentation]  Check for Renaming the devices in AP List page
    Navigate To Device Page
    Navigate To Device List Page
    DOMreadyByWaitTime  10
  #  Click  ${Loc_AP_List}
    DOMreadyByWaitTime  5
    Click  ${Loc_GroupFilter}
   
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
    Type  ${Loc_Input1}  ${input1}
    Click  //*[@class="goog-menuitem-content"]/*[contains(.,'${input1}')]
    DOMreadyByWaitTime  5
    Webdriverlib Helper Init    
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Type  ${Loc_Input2}  rrrr       
    Click  ${Loc_ChangeDeviceGroup}
    DOMreadyByWaitTime  2
    Click  ${Loc_ImportUnreferenced}
    DOMreadyByWaitTime  2
    Click  css=.goog-button.m_inline_block
    DOMreadyByWaitTime  5
    Scroll element into view  ${Loc_AlertError}
    ${output}=  Get text  ${Loc_AlertError}
    log  ${output} 
    Should Be Equal As Strings  ${output}  ${Expected_importingunreferenced}
    
Check for Updating APgroup Device
    [Arguments]  ${input1}
    [Documentation]  Check for Renaming the devices in AP List page
    Navigate To Device Page
    Navigate To Device List Page
    DOMreadyByWaitTime  10
   # Click  ${Loc_AP_List}
    DOMreadyByWaitTime  5
    Click  ${Loc_GroupFilter}
   
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
    Type  ${Loc_Input1}  ${input1}
    Click  //*[@class="goog-menuitem-content"]/*[contains(.,'${input1}')]
    DOMreadyByWaitTime  5
    Webdriverlib Helper Init    
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Type  ${Loc_Input2}  rrrr       
    Click  ${Loc_ChangeDeviceGroup}
    DOMreadyByWaitTime  2
    Click  ${Loc_UpdatingAPGroupDevice}
    DOMreadyByWaitTime  2
    Click  css=.goog-button.m_inline_block
    DOMreadyByWaitTime  5
    Scroll element into view  ${Expected_UpdateAPGroup}
    
Check for import settings
    [Arguments]  ${input1}
    [Documentation]  Check for Renaming the devices in AP List page
    Navigate To Device Page
    Navigate To Device List Page
    DOMreadyByWaitTime  10
   # Click  ${Loc_AP_List}
    DOMreadyByWaitTime  5
    Click  ${Loc_GroupFilter}
   
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
    Type  ${Loc_Input1}  ${input1}
    Click  //*[@class="goog-menuitem-content"]/*[contains(.,'${input1}')]
    DOMreadyByWaitTime  5
    Webdriverlib Helper Init    
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Click  ${Loc_FirstCheckbox}
    Click  ${Loc_ChangeDeviceGroup}
    DOMreadyByWaitTime  2
    Click  ${Loc_ImportSettings}
    DOMreadyByWaitTime  2
    Click  css=.goog-button.m_inline_block
    DOMreadyByWaitTime  5
    assertForElementPresent  ${Expected_UpdateAPGroup}
    Scroll element into view  ${Expected_UpdateAPGroup}
    Log  Import Settings Verified!  console=True
    
Check for Audit Device Option
    [Arguments]  ${input1}
    #[Documentation]  Check for Renaming the devices in AP List page
    Navigate To Device Page
    Navigate To Device List Page
    DOMreadyByWaitTime  10
   # Click  ${Loc_AP_List}
    DOMreadyByWaitTime  5
    Click  ${Loc_GroupFilter}
   
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
    Type  ${Loc_Input1}  ${input1}
    Click  //*[@class="goog-menuitem-content"]/*[contains(.,'${input1}')]
    DOMreadyByWaitTime  5
    Webdriverlib Helper Init    
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Click  ${Loc_FirstCheckbox}
    Click  ${Loc_ChangeDeviceGroup}
    DOMreadyByWaitTime  2
    Click  ${Loc_AuditSettins}
    DOMreadyByWaitTime  2
    Click  css=.goog-button.m_inline_block
    DOMreadyByWaitTime  5
    assertForElementPresent  ${Expected_UpdateAPGroup}
    Scroll element into view  ${Expected_UpdateAPGroup}
    Log  Audit Settings Verified!  console=True
    
Check for Management Level Option
    [Arguments]  ${input1}
    Navigate To Device Page
    Navigate To Device List Page
    DOMreadyByWaitTime  10
   # Click  ${Loc_AP_List}
    DOMreadyByWaitTime  5
    Click  ${Loc_GroupFilter}
   
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
    Type  ${Loc_Input1}  ${input1}
    Click  //*[@class="goog-menuitem-content"]/*[contains(.,'${input1}')]
    DOMreadyByWaitTime  5
    ${devName}  Get Element Text  ${Loc_readstate}
    Webdriverlib Helper Init    
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Click  ${Loc_FirstCheckbox}
    Click  ${Loc_ChangeDeviceGroup}
    DOMreadyByWaitTime  2
    Click  ${Loc_ManagementLvl}
    DOMreadyByWaitTime  2
    Click  ${Loc_ManageReadWrite}
    DOMreadyByWaitTime  2
    assertForElementPresent  ${Expected_UpdateAPGroup}
    Scroll element into view  ${Expected_UpdateAPGroup}
    Log  Management Options Verified!  console=True
    

Check for Polling the Aps on controllers
    [Arguments]  ${AOScontroller}  ${AOSGroup}
    Navigate To Device Page
    Navigate To Device List Page
    DOMreadyByWaitTime  10
    DOMreadyByWaitTime  5
    Click  ${Loc_GroupFilter}
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
    Type  ${Loc_Input1}  ${AOSGroup}
    Click  //*[@class="goog-menuitem-content"]/*[contains(.,'${AOSGroup}')]
    DOMreadyByWaitTime  30
    ${Count}  get element count  //*[@title="${AOScontroller}"]/parent::*/preceding-sibling::*/*[@class="read_state"]/*   
    Run keyword if  ${Count}==0  Fail  No Device present!
    Click  (//*[@title="${AOScontroller}"]/parent::*/preceding-sibling::*/*[@class="read_state"]/*)[1]
    Sleep  20s
    ${Count}  get element count  ${Loc_readstate}
    Run keyword if  ${Count}==0  Fail  No Device present!
    Click  ${Loc_readstate}
    DOMreadyByWaitTime  5
    Double Click  //*[@name="poll_now"]
    DOMreadyByWaitTime  10
    AssertForElementPresent  ${Loc_SuccessfulMsg}
   # ${output}=  Get Text  //*[contains(@class,'icofirst icon_confirmed ok')]
   # log  ${output}
   # Should Contain Any  ${output}  ${confirm_msg}    
 
Add and Verify Maintenance window  
    [Arguments]  ${DeviceGroupsName}  ${WindowName}  ${Occurance}  ${Month}  ${Day}  ${Time}  ${Duration}  ${controller}
    Navigate To Device Page
    Navigate To Device List Page
    DOMreadyByWaitTime  10
    DOMreadyByWaitTime  5
    Click  ${Loc_GroupFilter}
    DOMreadyByWaitTime  5
    Click  ${Loc_ListView_filterMenu}
    DOMreadyByWaitTime  5
    Type  ${Loc_Input1}  ${DeviceGroupsName}
    Click  //*[@class="goog-menuitem-content"]/*[contains(.,'${DeviceGroupsName}')]
    DOMreadyByWaitTime  5
    
    ${Count}  get element count  ${Loc_readstate}
    Run keyword if  ${Count}==0  Fail  No Device present!
    ${devName}  Get Element Text  //*[@title="${controller}"]/parent::*/preceding-sibling::*/*[@class="read_state"]/*
    Webdriverlib Helper Init    
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Click  //*[@title="${controller}"]/parent::*/preceding-sibling::*//*[text()="${devName}"]/ancestor::*/preceding-sibling::*[@class="m_checkbox"]
    Click  ${Loc_ChangeDeviceGroup}
    DOMreadyByWaitTime  2
    Click  ${Loc_AddMaintanenceDevice}
    DOMreadyByWaitTime  2
    Click  css=.goog-button.m_inline_block
    DOMreadyByWaitTime  5
    Type  ${Loc_InputName}  ${WindowName}  
    Select Dropdown LabelValue  ${Loc_OccuranceDD}  ${Occurance}
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${Loc_MonthDD}  ${Month}
    DOMreadyByWaitTime  2
    Type  ${Loc_DayDD}  ${Day}
    DOMreadyByWaitTime  2
    Type  ${Loc_TimeBx}  ${Time}
    DOMreadyByWaitTime  2
    Type  ${Loc_DurationDD}  ${Duration}
    DOMreadyByWaitTime  2
    Click  ${Loc_ADDbutton}
    DOMreadyByWaitTime  2
    AssertForElementPresent  ${Loc_NoChangesButton}
    Log  Maintenance window option verified  console=True
  #  Click  ${Loc_ApplyChangesButtonAP}
  #  DOMreadyByWaitTime  5
  #  Log  Maintenance window added for ${devName}!  console=True
  #  DOMreadyByWaitTime  10
  #  DOMreadyByWaitTime  5
  #  Click  ${Loc_GroupFilter}
  #  DOMreadyByWaitTime  5
  #  Click  ${Loc_ListView_filterMenu}
  #  DOMreadyByWaitTime  5
  #  Type  ${Loc_Input1}  ${DeviceGroupsName}
  #  Click  //*[@class="goog-menuitem-content"]/*[contains(.,'${DeviceGroupsName}')]
  #  DOMreadyByWaitTime  5
  #  Click  //*[@title="${controller}"]/parent::*/preceding-sibling::*/*[@class="read_state"]/*[text()="${devName}"]
  #  DOMreadyByWaitTime  10
  #  Navigate To Device Manage Page
  #  DOMreadyByWaitTime  5
  #  AssertForElementPresent  //*[text()='Maintenance Windows']/ancestor::*/following-sibling::*//td[text()='${WindowName}']
  #  Scroll element into view  //*[text()='Maintenance Windows']/ancestor::*/following-sibling::*//td[text()='${WindowName}']
  #  Log  Maintenance window - ${WindowName} verified for ${devName}  console=True
    
Delete Maintenance Window 
    [Arguments]  ${WindowName}
    Click  //*[text()='Maintenance Windows']/ancestor::*/following-sibling::*//td[text()='${WindowName}']/parent::*/*/*[@type="checkbox"]
    Click  //*[@name="ap_maintenance_window_delete"]
    DOMreadyByWaitTime  5
    Log  Maintenance window - ${WindowName} deleted!  console=True
     
    
    
Verify Overrides device manage page
    Navigate To Device Manage Page
    DOMreadyByWaitTime  5
    Page Should Not Contain Element  Aruba Overrides
    Log  overrides verified in manage page!  console=True

Create PCI compliance Report
    [Arguments]  ${title}  ${Type}  ${group}  ${start}  ${stop}
    Click  ${Loc_New_Report}
    DOMreadyByWaitTime  5
    WaitForElementPresent  ${Loc_Report_Title}
    Type  ${Loc_Report_Title}  ${title}
    Select Dropdown LabelValue  ${Loc_Report_Type}  ${Type}
    Select Dropdown LabelValue  ${Loc_MM_apGroup}  ${group}
    Click  ${Loc_SelectAPGroup}
    Type  ${Loc_Report_Start}  ${start}
    Type  ${Loc_Report_Stop}  ${stop}
    Click  ${Loc_Report_AddandRun}

Verify Generated PCI compliance Report
    [Arguments]  ${Reporttitle}
    Type  ${Loc_ReportSearch}  ${Reporttitle}
    DOMreadyByWaitTime  3
    Press Keys  None  RETURN
    AssertForElementPresent  //*[contains(text(),'${Reporttitle}')]
    Log  ${Reporttitle} created!  console=True 
    Wait until keyword succeeds  5 min  30 sec  Generated report  ${Reporttitle}
    DOMreadyByWaitTime  5
    Click  //a[text()='${Reporttitle}']
    DOMreadyByWaitTime  10
    AssertForElementPresent  ${Loc_PCI_heading}
    Log  ${Reporttitle} verified!  console=True   

Generated report
    [Arguments]  ${title}
    Navigate to Reports Generated Page
    DOMreadyByWaitTime  5
    Type  ${Loc_ReportSearch}  ${title}
    Press Keys  None  RETURN
    DOMreadyByWaitTime  3
    Element should be visible  //a[text()='${title}'] 
    

Navigate To Device Config Page
    [Documentation]  Navigating to the Device - Config page by clicking on the list sublink under Device link.
    Wait Until Element Is Visible  ${Device_config_xpath}
    Sleep  3s
    Click  ${Device_config_xpath}
    Wait Until Element Is Not Visible  ${loader}  30s

Verify Backup option
    [Documentation]  Verify the flash backup option availability in the config page
    Navigate To Device Config Page
    DOMreadyByWaitTime  5
    Wait Until Element Is Visible  ${Loc_FlashBackup}
    Log  Backup option verified  console=True

Create and Verify Backup
    [Arguments]  ${controller}
    [Documentation]  Create and verify the flash backup in the config page
    Navigate To Device Config Page
    DOMreadyByWaitTime  5
    Wait Until Element Is Visible  ${Loc_FlashBackup}
    Click  ${Loc_FlashBackup}
    DOMreadyByWaitTime  10
    AssertForElementPresent  ${Loc_VerifyingConfig}
    Click  ${Loc_RunningConfig} 
    DOMreadyByWaitTime  5
    Switch Window  locator=NEW
    Maximize Browser window
    DOMreadyByWaitTime  10
    ${Source}  Get Source
    ${Source}  Convert to string  ${Source}
    Log  ${Source}
    Close Window
    DOMreadyByWaitTime  3
    Switch Window  MAIN
    DOMreadyByWaitTime  5
    Should Contain  ${Source}  hostname "${controller}"
    Log  hostname "${controller}" verified in flash backup  console=True
    
    Log  Flash backup Verified!  console=True    
    
Cleanup For Report
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
    Click  ${Loc_ApplyChangesButtonAP}
    DOMreadyByWaitTime  3
    Type  ${Loc_ReportSearch}  ${title}
    Press Keys  None  RETURN
    DOMreadyByWaitTime  3
    AssertForElementNotPresent  //*[text()='${title}']/ancestor::tr/*/preceding-sibling::*/*[@type="checkbox"]
    log  ${title} - Report deleted!  console=True

    
Verify restoring the flash backups
    Navigate To device Config Page
    DOMreadyByWaitTime  5
    ${count}  Get Element Count  ${Loc_Config_Status}
    Run Keyword If  ${count}>0  Log  configuration verified!  console=True
    ...  ELSE  Import and verify
    

    
Import and verify
    Click  ${Loc_ImportButton}
    DOMreadyByWaitTime  10
    Click  ${Loc_ApplyChangesButtonAP}
    DOMreadyByWaitTime  3
    Wait Until Keyword Succeeds  5 min  30 sec  Check Configuration status
    
    
    
Check Configuration status
    Navigate To Device Manage Page
    Navigate To device Config Page
    DOMreadyByWaitTime  5
    AssertForElementPresent  ${Loc_Config_Status}
    Log  flash backup restoring verified  console=True
    

Get Login Info From AMP
    Get AOS amp details  AMPLogin  
    
    @{LastLogin}  Get Last Login Info  ${CLIhost}  ${CLIUsername}  ${CLIpassword}
    ${CLIMonth}  Set Variable  @{LastLogin}[0]
    ${CLIDay}  Set variable  @{LastLogin}[1]
    ${CLIYear}  Set variable  @{LastLogin}[2]
    ${CLItime}  Set variable  @{LastLogin}[3]
    &{dict1}  Create dictionary  Jan=1  Feb=2  Mar=3  Apr=4  May=5  Jun=6  Jul=7  Aug=8  Sep=9  Oct=10  Nov=11  Dec=12
    &{dict2}  Create dictionary  01=1  02=2  03=3  04=4  05=5  06=6  07=7  08=8  09=9  10=10  11=11  12=12  13=1  14=2  15=3  16=4  17=5  18=6  19=7  20=8  21=9  22=10  23=11  00=12
    ${month}  Get from Dictionary  ${dict1}  ${CLIMonth}
    ${time}  Get from Dictionary  ${dict2}  ${CLItime}
    ${CLIlogindate}  Catenate  SEPARATOR=/  ${month}  ${CLIday}  ${CLIYear}  
    ${CLILogin}  Catenate  ${CLIlogindate}  ${time}
    Log  CLI Login Info: ${CLILogin}  console=True
    [return]  ${CLILogin}

Verify create Backup
    [Arguments]  ${CLILogin}
    DOMReadyByWaitTime  10
    Navigate To device Config Page
    DOMreadyByWaitTime  5
    Click  ${Loc_CreateBackup}
    DOMreadyByWaitTime  320
    Reload Page
    DOMReadyByWaitTime  20
    AssertForElementPresent  //*[text()='On Demand']/preceding-sibling::*[contains(text(),'${CLILogin}:')]
    Log  CLILogin: ${CLILogin} On Demand present  console=True
    
Create VLAN
    [Arguments]  ${VLANname}  ${VLANid}
    Navigate To Device Manage Page
    DOMreadyByWaitTime  5
    Click  ${Loc_ManageReadWriteoption}
    DOMReadyByWaitTime  5
    Click  ${Loc_SaveandApply}
    DOMReadyByWaitTime  5
    Click  ${Loc_ApplyChangesButtonAP}
    DOMReadyByWaitTime  3
    Click  ${Loc_CorrespondingGroup}
    DOMReadyByWaitTime  10
    Click  ${Loc_LocalConfig}
    DOMReadyByWaitTime  3
    Click  ${Loc_NetworkConfig}
    DOMReadyByWaitTime  3
    Click  ${Loc_VLANConfig}
    DOMReadyByWaitTime  3
    Click  ${Loc_VLAN}
    DOMReadyByWaitTime  3
    Click  ${Loc_ADDbutton}
    DOMReadyByWaitTime  3
    Type  ${Loc_VLANname}  ${VLANname}
    DOMReadyByWaitTime  3
    Type  ${Loc_VLANid}  ${VLANid}
    DOMReadyByWaitTime  3
    Click  ${Loc_ADDbutton}
    Click  ${Loc_SaveandApply}
    DOMReadyByWaitTime  5
    Click  ${Loc_ApplyChangesButtonAP}
    DOMReadyByWaitTime  3
    AssertForElementPresent  ${Loc_SuccessfulMsg}
    Log  VLAN: ${VLANname} added successfully  console=True
    

Verify VLAN
    Get VLAN Details  AMP details
    ${VLANAMP}  Getvlan Infofrom CLI  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  ${EnablePassword}  ${VLANcmd}  ${VLANname}
    Should be true  ${VLANAMP} == ${VLANname}
    Log  VLAN verified  console=True

Restore Device
    [Arguments]  ${CLILogin} 
    DOMReadyByWaitTime  10
    Navigate To device Config Page
    DOMreadyByWaitTime  5
    Click  //*[text()='On Demand']/preceding-sibling::*[contains(text(),'${CLILogin}:')]/following-sibling::*/*[text()='Restore']
    DOMreadyByWaitTime  10
    Click  ${Loc_ApplyChangesButtonAP}
    DOMReadyByWaitTime  5
    Log  Device Restored!  console=True
    
    

Verify Compliance Page
    [Documentation]  Verify compliance page availability and page information
    Wait Until Element Is Visible  ${Loc_compliancePage}
    Click  ${Loc_compliancePage}
    Wait Until Element Is Not Visible  ${loader}  30s   
    AssertForElementPresent  ${Loc_PCIcompliance}

    

Navigate To Controller config Page
    Wait Until Element Is Visible  //*[@ng-class="controller_config"]  30s
    Sleep  3s
    Click  //*[@ng-class="controller_config"]
    Wait Until Element Is Not Visible  ${loader}  30s

    
Upload firmware and verify
    [Arguments]  ${Type}  ${Title}  ${ServerProtocol}
    Navigate To Device Setup Page
    Navigate To Device Setup Upload Firmware Files Page
    DOMreadyByWaitTime  10
    Click  ${Loc_AddFirmware}
    DOMreadyByWaitTime  3
    Select Dropdown LabelValue  ${Loc_FirmwareType}  ${Type}
    DOMreadyByWaitTime  5
    Type  ${Loc_Description}  ${Title}
    DOMreadyByWaitTime  3
    Select Dropdown LabelValue  ${Loc_ServerProtocol}  ${ServerProtocol}
    DOMreadyByWaitTime  3
    Choose File  ${Loc_ChooseFileFirmware}  ${Loc_FileLocation}
    DOMreadyByWaitTime  3
    Click  ${Loc_FirmwareADD}
    DOMreadyByWaitTime  300
    
    AssertForElementPresent  //*[contains(text(),'${Type}')]/following-sibling::td[contains(text(),'${Title}')]
    Log  Firmware file - ${Type} uploaded and verified successfully!  console=True
    
    
Verify firmware upgrade option
    [Arguments]  ${FirmwareIp}  ${FirmwareName}
    Navigate To AMP Setup Page
    DOMreadyByWaitTime  5
    Click  ${Loc_FirmwareRebootAP}
    DOMreadyByWaitTime  3
    Click  ${Loc_FirmwareRadioButtonAP}
    Click  ${Loc_SaveAP}
    DOMreadyByWaitTime  5
    Select AOS controller  ${FirmwareIp}
    DOMreadyByWaitTime  5
    Navigate to Device Manage Page
    DOMreadyByWaitTime  3
    AssertForElementPresent  ${Loc_MonitorandFirmware}
    Log  Firmware upgrade option verified  console=True
    Click  ${Loc_FirmwareButton}
    DOMreadyByWaitTime  5
    Select Dropdown LabelValue  ${Loc_DesiredFirmware}  ${FirmwareName}
    DOMreadyByWaitTime  5
    Click  ${Loc_FirmwareButton1}
    DOMreadyByWaitTime  5
    Log  Firmware upgrading to ${FirmwareName}  console=True
    
Verify completion of firmware upgrade
    [Arguments]  ${FirmwareName}
    Navigate to DeviceMonitor PageAOS
    DOMreadyByWaitTime  5
    AssertForElementPresent  ${Loc_FirmwareProgress}
    Log  Firmware upgrade in progress  console=True
    DOMreadyByWaitTime  900
    Click PollAOS
    DOMreadyByWaitTime  320
    Reload Page
    DOMreadyByWaitTime  20
    ${Firm}  Get element text  ${Loc_FirmwareText}
    Log  Controller Firmware: ${Firm}  console=True
    Should contain  ${FirmwareName}  ${Firm}
    Log  Firmware upgraded!  console=True
    [return]  ${Firm}
    
Verify In Alerts
    [Arguments]  ${FirmwareName}
    DOMreadyByWaitTime  10
    ${version}  ${bnum}  split string  ${FirmwareName}  _
    Log  Version: ${version}  console=True
    Click  ${Loc_AlertsandEvents}
    DOMreadyByWaitTime  5
    AssertForElementPresent  //*[@class="eventLogLine"]/*[contains(.,"Firmware changed") and contains(.,"to '${version}'")]
    Log  firmware version changes verified in event log  console=True
    Click  ${Loc_DeviceTab}
    DOMreadyByWaitTime  5
    AssertforElementPresent  ${Loc_ConfigGood}
    Log  configuration for new firmware verified  console=True

    
    
    

    
    
    


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

Get AOS controller details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${AOScontrollerList} =  Data_Provider.GetDataProviderColumnValue  Data_AOScontroller
    ${AOScontroller} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AOScontrollerList}  1
    Set Suite Variable  ${AOScontroller}
    ${RunCommandList} =  Data_Provider.GetDataProviderColumnValue  Data_RunCommand
    ${RunCommand} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RunCommandList}  1
    Set Suite Variable  ${RunCommand}
    ${GroupNameList} =  Data_Provider.GetDataProviderColumnValue  Data_Groupname1
    ${GroupName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GroupNameList}  1
    Set Suite Variable  ${GroupName1}
    ${ControllerStatusList} =  Data_Provider.GetDataProviderColumnValue  Data_ControllerStatus
    ${Devstatus} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerStatusList}  1
    Set Suite Variable  ${Devstatus}
    ${ControllerconfigurationList} =  Data_Provider.GetDataProviderColumnValue  Data_Controllerconfiguration
    ${DevConfig} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerconfigurationList}  1
    Set Suite Variable  ${DevConfig}
    ${AOSGroupList} =  Data_Provider.GetDataProviderColumnValue  Data_AOSGroup
    ${AOSGroup} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AOSGroupList}  1
    Set Suite Variable  ${AOSGroup}
    ${EventAOSGroupList} =  Data_Provider.GetDataProviderColumnValue  Data_EventAOSGroup
    ${EventAOSGroup} =  Data_Provider.DataProviderSplitterForMultipleValues  ${EventAOSGroupList}  1
    Set Suite Variable  ${EventAOSGroup}
    
Get Flash backup details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${FlashBackupList} =  Data_Provider.GetDataProviderColumnValue  Data_FlashBackup
    ${FlashBackup} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FlashBackupList}  1
    Set Suite Variable  ${FlashBackup}
    
        

Get AOS amp details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${CLIhostList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIhost
    ${CLIhost} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIhostList}  1
    Set Suite Variable  ${CLIhost}
    ${CLIUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIUsername
    ${CLIUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIUsernameList}  1
    Set Suite Variable  ${CLIUsername}
    ${CLIpasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIpassword
    ${CLIpassword} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIpasswordList}  1
    Set Suite Variable  ${CLIpassword}
    ${FirmwarecmdList} =  Data_Provider.GetDataProviderColumnValue  Data_Firmwarecmd
    ${Firmwarecmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FirmwarecmdList}  1
    Set Suite Variable  ${Firmwarecmd}
    ${TypecmdList} =  Data_Provider.GetDataProviderColumnValue  Data_Typecmd
    ${Typecmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TypecmdList}  1
    Set Suite Variable  ${Typecmd}
    
    
Get VLAN Details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${CLIhostList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIhost
    ${CLIhost} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIhostList}  1
    Set Suite Variable  ${CLIhost}
    ${CLIUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIUsername
    ${CLIUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIUsernameList}  1
    Set Suite Variable  ${CLIUsername}
    ${CLIpasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIpassword
    ${CLIpassword} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIpasswordList}  1
    Set Suite Variable  ${CLIpassword}
    ${EnablePasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_EnablePassword
    ${EnablePassword} =  Data_Provider.DataProviderSplitterForMultipleValues  ${EnablePasswordList}  1
    Set Suite Variable  ${EnablePassword}
    ${VLANcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_VLANcmd
    ${VLANcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${VLANcmdList}  1
    Set Suite Variable  ${VLANcmd}
    ${VLANnameList} =  Data_Provider.GetDataProviderColumnValue  Data_VLANname
    ${VLANname} =  Data_Provider.DataProviderSplitterForMultipleValues  ${VLANnameList}  1
    Set Suite Variable  ${VLANname}
    ${VLANidList} =  Data_Provider.GetDataProviderColumnValue  Data_VLANid
    ${VLANid} =  Data_Provider.DataProviderSplitterForMultipleValues  ${VLANidList}  1
    Set Suite Variable  ${VLANid}
    
    
Get AOS Controller Details To Add
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${GroupNameList} =  Data_Provider.GetDataProviderColumnValue  Data_Groupname1
    ${GroupName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GroupNameList}  1
    Set Suite Variable  ${GroupName1}
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
    ${AOSGroupList} =  Data_Provider.GetDataProviderColumnValue  Data_AOSGroup
    ${AOSGroup} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AOSGroupList}  1
    Set Suite Variable  ${AOSGroup}
    ${AOSMD1List} =  Data_Provider.GetDataProviderColumnValue  Data_AOSMD1
    ${AOSMD1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AOSMD1List}  1
    Set Suite Variable  ${AOSMD1}
    ${AOSMD2List} =  Data_Provider.GetDataProviderColumnValue  Data_AOSMD2
    ${AOSMD2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AOSMD2List}  1
    Set Suite Variable  ${AOSMD2}
    ${AOSap1List} =  Data_Provider.GetDataProviderColumnValue  Data_AOSap1
    ${AOSap1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AOSap1List}  1
    Set Suite Variable  ${AOSap1}
    ${AOSap2List} =  Data_Provider.GetDataProviderColumnValue  Data_AOSap2
    ${AOSap2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AOSap2List}  1
    Set Suite Variable  ${AOSap2}
    ${ControllerStatusList} =  Data_Provider.GetDataProviderColumnValue  Data_ControllerStatus
    ${Devstatus} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerStatusList}  1
    Set Suite Variable  ${Devstatus}
    ${ControllerconfigurationList} =  Data_Provider.GetDataProviderColumnValue  Data_Controllerconfiguration
    ${DevConfig} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerconfigurationList}  1
    Set Suite Variable  ${DevConfig}

    
    
  

Get Rename Data
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${DeviceGroupNameList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceGroupName
  ${DeviceGroupsName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceGroupNameList}  1
  Set Suite Variable  ${DeviceGroupsName}

Get Upgrade Data
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${FirmwareUpgradeDeviceList} =  Data_Provider.GetDataProviderColumnValue  Data_FirmwareUpgradeDevice
  ${FirmwareUpgradeDevice} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FirmwareUpgradeDeviceList}  1
  Set Suite Variable  ${FirmwareUpgradeDevice} 

Get ReProvisioning Data
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${ReprovisioningdeviceNameList} =  Data_Provider.GetDataProviderColumnValue  Data_ReprovisioningdeviceName
  ${ReprovisioningdeviceName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReprovisioningdeviceNameList}  1
  Set Suite Variable  ${ReprovisioningdeviceName} 
  
Get Aruba profile device Data
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${ImportDataList} =  Data_Provider.GetDataProviderColumnValue  Data_ImportData
  ${ImportData} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ImportDataList}  1
  Set Suite Variable  ${ImportData} 
  
Get AP group device Data
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${UpdateDeviceList} =  Data_Provider.GetDataProviderColumnValue  Data_UpdateDevice
  ${UpdateDevice} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UpdateDeviceList}  1
  Set Suite Variable  ${UpdateDevice} 

Get Maintanence window details
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${DeviceGroupNameList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceGroupName
  ${DeviceGroupsName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceGroupNameList}  1
  Set Suite Variable  ${DeviceGroupsName}
  ${WindowNameList} =  Data_Provider.GetDataProviderColumnValue  Data_WindowName
  ${WindowName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${WindowNameList}  1
  Set Suite Variable  ${WindowName}
    ${OccuranceList} =  Data_Provider.GetDataProviderColumnValue  Data_Occurance
  ${Occurance} =  Data_Provider.DataProviderSplitterForMultipleValues  ${OccuranceList}  1
  Set Suite Variable  ${Occurance}
    ${MonthList} =  Data_Provider.GetDataProviderColumnValue  Data_Month
  ${Month} =  Data_Provider.DataProviderSplitterForMultipleValues  ${MonthList}  1
  Set Suite Variable  ${Month}
  ${DayList} =  Data_Provider.GetDataProviderColumnValue  Data_Day
  ${Day} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DayList}  1
  Set Suite Variable  ${Day}
  ${TimeList} =  Data_Provider.GetDataProviderColumnValue  Data_Time
  ${Time} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TimeList}  1
  Set Suite Variable  ${Time}
  ${DurationList} =  Data_Provider.GetDataProviderColumnValue  Data_Duration
  ${Duration} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DurationList}  1
  Set Suite Variable  ${Duration}
  ${AOScontrollerList} =  Data_Provider.GetDataProviderColumnValue  Data_AOScontroller
    ${AOScontroller} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AOScontrollerList}  1
    Set Suite Variable  ${AOScontroller}
  
    
Get device data to factoryReset
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${FactoryResetdeviceList} =  Data_Provider.GetDataProviderColumnValue  Data_FactoryResetdevice
  ${FactoryResetdevice} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FactoryResetdeviceList}  1
  Set Suite Variable  ${FactoryResetdevice} 
  
Get device data to Reboot
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${RebootdeviceList} =  Data_Provider.GetDataProviderColumnValue  Data_Rebootdevice
  ${Rebootdevice} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RebootdeviceList}  1
  Set Suite Variable  ${Rebootdevice} 

    
Get PCI compliance Report details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${TitleList} =  Data_Provider.GetDataProviderColumnValue  Data_Title
    ${Title} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TitleList}  1
    Set Suite Variable  ${Title}
    ${TypeList} =  Data_Provider.GetDataProviderColumnValue  Data_Type
    ${Type} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TypeList}  1
    Set Suite Variable  ${Type}
    ${groupList} =  Data_Provider.GetDataProviderColumnValue  Data_group
    ${group} =  Data_Provider.DataProviderSplitterForMultipleValues  ${groupList}  1
    Set Suite Variable  ${group}
    ${ReportStartList} =  Data_Provider.GetDataProviderColumnValue  Data_Report Start
    ${ReportStart} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReportStartList}  1
    Set Suite Variable  ${ReportStart}
    ${ReportStopList} =  Data_Provider.GetDataProviderColumnValue  Data_Report Stop
    ${ReportStop} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReportStopList}  1
    Set Suite Variable  ${ReportStop}

Get Firmware upload details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${TitleList} =  Data_Provider.GetDataProviderColumnValue  Data_Title
    ${Title} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TitleList}  1
    Set Suite Variable  ${Title}
    ${TypeList} =  Data_Provider.GetDataProviderColumnValue  Data_Type
    ${Type} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TypeList}  1
    Set Suite Variable  ${Type}
    ${ServerProtocolList} =  Data_Provider.GetDataProviderColumnValue  Data_group
    ${ServerProtocol} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ServerProtocolList}  1
    Set Suite Variable  ${ServerProtocol}
    ${FirmwareIpList} =  Data_Provider.GetDataProviderColumnValue  Data_FirmwareIp
    ${FirmwareIp} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FirmwareIpList}  1
    Set Suite Variable  ${FirmwareIp}
    ${FirmwareNameList} =  Data_Provider.GetDataProviderColumnValue  Data_FirmwareName
    ${FirmwareName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FirmwareNameList}  1
    Set Suite Variable  ${FirmwareName}
    
    
    

*** Variables ***
${UIcolumn1}  Open controller web UI...
${UIcolumn2}  Dashboard > Performance
${UIcolumn3}  Dashboard > Usage 
${UIcolumn4}  Dashboard > Security 
${UIcolumn5}  Dashboard > Potential Issues 
${UIcolumn6}  Dashboard > WLANs 
${UIcolumn7}  Dashboard > Access Points   
${UIcolumn8}  Dashboard > Clients 
${UIcolumn9}  Dashboard > Cluster   
${UIcolumn10}  Spectrum Analysis 
${UIcolumn11}  Configuration 
${UIcolumn12}  Maintenance
${UIcolumn13}  Diagnostics
${UIcolumn14}  Licensing
${AOScontroller}
${FlashBackup}
${LoginUserName1}
${LoginPassword1}
${RunCommand}
${GroupName1}
${DefaultFolderName1}  Top
${DeviceType1}   
${DeviceIPAddress1}  
${DeviceCommunityString1}  
${TelnetSSHUsername1}  
${TelnetSSHPassword1} 
${Devstatus}
${DevConfig}
${AOSGroup}
${AOSMD1}
${AOSMD2}
${AOSap1}
${AOSap2}
${CLIhost}
${CLIUsername}
${CLIpassword}
${Firmwarecmd}
${Typecmd}
${DeviceGroupsName}
${FirmwareUpgradeDevice}
${ReprovisioningdeviceName}
${ImportData}
${UpdateDevice} 
${WindowName}
${Occurance}
${Month}
${Day}
${Time}
${FactoryResetdevice} 
${Duration}
${Rebootdevice}
${Type}
${Title}
${group}
${ReportStart}
${ReportStop}
${Reporttitle}
${EnablePassword}
${VLANcmd}
${VLANname}
${VLANid}
${EventAOSGroup}
${ServerProtocol}
${FirmwareIp}
${FirmwareName}