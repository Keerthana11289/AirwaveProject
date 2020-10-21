*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Locators/DeviceSetupPages.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Utilities/Data_Provider.robot

*** Variables ***
${deviceType}  Aruba Device
${deviceName}  Aruba Controller
${deviceIPAddress}  10.22.157.50
${deviceCommunityString}  airwave
${deviceTelnetSSHUsername}  admin
${deviceTelnetSSHPassword}  airwave
${deviceGroup}  AUT_Test
${deviceFolder}  AUT_Folder
${deviceParentFolder}  Top
${js_ScrollToView}  return arguments[0].scrollIntoView(true);

*** Keywords ***
Navigate To Devices - Monitor Page
    [Documentation]  Navigating to the Devices - Monitor page by clicking on the Monitor link under devices section.
    Wait Until Element Is Visible  ${Loc_DevicesMonitorLink}
    Sleep  3s
    Click  ${Loc_DevicesMonitorLink}
    Wait Until Element Is Not Visible  ${loader}  30s

Add a New Device
    [Arguments]  ${deviceName}  ${deviceGroup}  ${deviceFolder}
    Navigate To Device Setup Page
    Navigate To Device Setup Add Page
    WaitForElementPresent  ${Loc_DeviceTypeDropdown_css}
    Select Dropdown LabelValue  ${Loc_DeviceTypeDropdown_css}  ${deviceType}
    Click  ${Loc_AddButton_css}
    ${value}  Catenate  Creating  ${deviceType}
    Page Should Contain  ${value}
    Type Text  ${Loc_NameField_css}  ${deviceName}
    Type Text  ${Loc_IPAddressField_xpath}  ${deviceIPAddress}
    Type Text  ${Loc_CommunityStringField_css}  ${deviceCommunityString}
    Type Text  ${Loc_ConfirmCommunityStringField_css}  ${deviceCommunityString}
    Type Text  ${Loc_TelnetSSHUsernameField_css}  ${deviceTelnetSSHUsername}
    Type Text  ${Loc_TelnetSSHPasswordField_css}  ${deviceTelnetSSHPassword}
    Type Text  ${Loc_ConfirmTelnetSSHPasswordField_css}  ${deviceTelnetSSHPassword}
    Select Dropdown LabelValue  ${Loc_SelectGroupField_css}  ${deviceGroup}
    Focus Element  ${Loc_SelectFolderField_css}
    DOMreadyByWaitTime  3
    Select From Dropdown List  ${Loc_SelectFolderField_css}  ${deviceFolder}
    Click  ${Loc_DeviceAddButton_css}
    WaitForPageLoading
    AssertForTableElementPresent  ${deviceGroup}
    AssertForTableElementPresent  ${deviceFolder}
    AssertForElementPresent  ${Loc_ApplyChangesButton_css}
    AssertForElementPresent  ${Loc_CancelButton_css}
    Click  ${Loc_ApplyChangesButton_css}
    WaitForPageLoading
    Sleep  5s
    ${ip}  Catenate  SEPARATOR=  ${Loc_IPAddressField_xpath}  [@value='${deviceIPAddress}']
    AssertForElementPresent  ${ip}
    Log  ${deviceIPAddress} device created successfully..!  console=true

Add New Device
    [Arguments]  ${deviceName}  ${deviceGroup}  ${deviceFolder}
    WaitForElementPresent  ${Loc_DeviceTypeDropdown_css}
    Select Dropdown LabelValue  ${Loc_DeviceTypeDropdown_css}  ${deviceType}
    Click  ${Loc_AddButton_css}
    ${value}  Catenate  Creating  ${deviceType}
    Page Should Contain  ${value}
    Type Text  ${Loc_NameField_css}  ${deviceName}
    Type Text  ${Loc_IPAddressField_xpath}  ${deviceIPAddress}
    Type Text  ${Loc_CommunityStringField_css}  ${deviceCommunityString}
    Type Text  ${Loc_ConfirmCommunityStringField_css}  ${deviceCommunityString}
    Type Text  ${Loc_TelnetSSHUsernameField_css}  ${deviceTelnetSSHUsername}
    Type Text  ${Loc_TelnetSSHPasswordField_css}  ${deviceTelnetSSHPassword}
    Type Text  ${Loc_ConfirmTelnetSSHPasswordField_css}  ${deviceTelnetSSHPassword}
    Select Dropdown LabelValue  ${Loc_SelectGroupField_css}  ${deviceGroup}
    Focus Element  ${Loc_SelectFolderField_css}
    DOMreadyByWaitTime  3
    Select From Dropdown List  ${Loc_SelectFolderField_css}  ${deviceFolder}
    Click  ${Loc_DeviceAddButton_css}
    WaitForPageLoading
    AssertForTableElementPresent  ${deviceGroup}
    AssertForTableElementPresent  ${deviceFolder}
    AssertForElementPresent  ${Loc_ApplyChangesButton_css}
    AssertForElementPresent  ${Loc_CancelButton_css}
    
Verify New Device Page
    [Tags]  Sanity
    [Documentation]  Verify a new device page fields.
    ...    
    Navigate To Device Setup Page
    Navigate To Device Setup Add Page
    WaitForElementPresent  ${Loc_DeviceTypeDropdown_css}
    Select Dropdown LabelValue  ${Loc_DeviceTypeDropdown_css}  ${deviceType}
    Click  ${Loc_AddButton_css}
    ${value}  Catenate  Creating  ${deviceType}
    Page Should Contain  ${value}
    @{formFileds}  Create List  ${Loc_NameField_css}  ${Loc_IPAddressField_xpath}  ${Loc_SNMPPortField_css}  ${Loc_SSHPortField_css}  ${Loc_CommunityStringField_css}  ${Loc_ConfirmCommunityStringField_css}  ${Loc_SNMPv3UsernameField_css}  ${Loc_AuthPasswordField_css}  ${Loc_ConfirmAuthPasswordField_css}  ${Loc_SNMPv3AuthProtocolField_css}  ${Loc_PrivacyPasswordField_css}  ${Loc_ConfirmPrivacyPasswordField_css}  ${Loc_SNMPv3PrivacyProtocolField_css}  ${Loc_TelnetSSHUsernameField_css}  ${Loc_TelnetSSHPasswordField_css}  ${Loc_ConfirmTelnetSSHPasswordField_css}  ${Loc_SelectGroupField_css}  ${Loc_SelectFolderField_css}  ${Loc_DeviceUpdateGroupSettings_css}  ${Loc_MoniterOnlySettings_css}  ${Loc_ManageRWSettings_css}  ${Loc_DeviceAddButton_css}  ${Loc_DeviceCancelButton_css}
    Assert The Elements From List  @{formFileds}   
    Click  ${Loc_DeviceCancelButton_css}
    AssertForElementPresent  ${Loc_DeviceTypeDropdown_css}
    AssertForElementPresent  ${Loc_AddButton_css}
    Navigate To Home Page
    
Add a New Device Page
    [Tags]  Sanity
    [Documentation]  Adding a new device to AMP in 'Device Setup - Add' page.
    ...    
    [Arguments]  ${deviceName}  ${deviceGroup}  ${deviceFolder}
    Navigate To Device Setup Page
    Navigate To Device Setup Add Page
    @{elementList}  Create List  ${Loc_CancelButton_css}  ${Loc_ApplyChangesButton_css}
    :FOR  ${button}  IN  @{elementList}
    \    
    \    Add New Device  ${deviceName}  ${deviceGroup}  ${deviceFolder}
    \    Click  ${button}
    \    
    AssertForTableElementPresent  ${deviceGroup}
    AssertForTableElementPresent  ${deviceFolder}
    Log  Device added successfully..!  console=true
    
Create a New Group
    [Documentation]  Creating a new group to AMP in 'Groups - Add' page.
    ...    
    [Arguments]  ${deviceGroup}
    Navigate To Group Page
    Navigate To Group List Page
    WaitForElementPresent  ${Loc_AddGroupButton_css}
    Click  ${Loc_AddGroupButton_css}
    WaitForElementPresent  ${Loc_AddGroupNameField_css}
    Type Text  ${Loc_AddGroupNameField_css}  ${deviceGroup}
    Click  ${Loc_AddGroupAddButton_css}
    AssertForTableElementPresentInTheTextbox  ${deviceGroup}
    Navigate To Group List Page
    #Verify in Group list page.
    AssertForTableElementPresent  ${deviceGroup}
    Log  Group created successfully..!  console=true
    
Delete Group
    [Arguments]  ${deviceGroup}
    Navigate To Group Page
    Navigate To Group List Page
    ${locator}  Catenate  SEPARATOR=  //a[text()='  ${deviceGroup}']/ancestor::tr/td/input
    Wait Until Element Is Visible  ${locator}  30s
    Click  ${locator}
    Click  ${Loc_DeleteGroupButton_css}
    AssertForTableElementNotPresent  ${deviceGroup}
    Log  Group deleted successfully..!  console=true
    
Create a New Folder
    [Documentation]  Creating a new folder to AMP in 'Device Setup - Add' page.
    ...    
    [Arguments]  ${deviceFolder}
    Navigate To Device Page
    Navigate To Device List Page
    Focus Element  ${Loc_AddNewFolder_Xpath}
    Click  ${Loc_AddNewFolder_Xpath}
    WaitForElementPresent  ${Loc_FolderNameField_css}
    Type Text  ${Loc_FolderNameField_css}  ${deviceFolder}
    Focus Element  ${Loc_ParentFolderField_css}
    Select Dropdown LabelValue  ${Loc_ParentFolderField_css}  ${deviceParentFolder}
    Click  ${Loc_FolderAddButtonField_css}
    DOMreadyByWaitTime  3
    AssertSpecificTableElementPresent  ${Loc_FolderListTable}  ${deviceFolder}
    Log  Folder created successfully..!  console=true
    
Create a Sub Folder
    [Documentation]  Creating a new folder to AMP in 'Device Setup - Add' page.
    ...    
    [Arguments]  ${deviceFolder}  ${deviceparentFolder1}
    Navigate To Device Page
    Navigate To Device List Page
    Focus Element  ${Loc_AddNewFolder_Xpath}
    Click  ${Loc_AddNewFolder_Xpath}
    WaitForElementPresent  ${Loc_FolderNameField_css}
    Type Text  ${Loc_FolderNameField_css}  ${deviceFolder}
    Focus Element  ${Loc_ParentFolderField_css}
    Select Dropdown LabelValue  ${Loc_ParentFolderField_css}  ${deviceparentFolder1}
    Click  ${Loc_FolderAddButtonField_css}
    DOMreadyByWaitTime  3
    AssertSpecificTableElementPresent  ${Loc_FolderListTable}  ${deviceFolder}
    Log  Folder created successfully..!  console=true
    
Delete Folder
    [Arguments]  ${deviceFolder}
    Navigate To TOP Folder page
    Select From Dropdown List  ${Home_TOP_FolderPage_css}  ${deviceFolder}
    WaitForPageLoading
    WaitForElementPresent  ${Loc_DeleteFoldercss}
    Click  ${Loc_DeleteFoldercss}
    WaitForElementPresent  ${Loc_DeleteFolderConfirmButtoncss}
    Click  ${Loc_DeleteFolderConfirmButtoncss}
    AssertForElementNotPresent  ${Loc_DeleteFoldercss}
    Log  Folder deleted successfully..!  console=true
    
Move the existing device to the created folder
    [Arguments]  ${deviceName}  ${deviceFolder}
    Navigate To TOP Folder page
    Scroll Element Into View  css=div.aw_pager
    DOMreadyByWaitTime  3
    ${curposition}  Get Device Position From Table  ${deviceName}
    DOMreadyByWaitTime  3
    ### Clicking on the device list edit icon.
    # ${element}=    Get WebElement    ${Loc_FolderEditIcon}
    Click using Javascript  ${Loc_FolderEditIcon}
    WaitForElementPresent  ${Loc_DeviceModifySection}
    ### Clicking on the device action list dropdown.
    Click  ${Loc_DeviceActionDropdownSection}
    WaitForElementPresent  ${Loc_ChangeDeviceGroupFolderDropdownValue}
    Click  ${Loc_ChangeDeviceGroupFolderDropdownValue}
    DOMreadyByWaitTime  3
    Click  ${Loc_FolderDropdownSection}
    ${locator}  Catenate  SEPARATOR=  xpath=//div[contains(@class,'goog-menuitem-content') and contains(text(),'  ${deviceFolder}')]
    WaitForElementPresent  ${locator}
    Click  ${locator}
    DOMreadyByWaitTime  3
    Scroll Element Into View  css=div.aw_pager
    DOMreadyByWaitTime  3
    ${position}  Evaluate  ${curposition}+1
    ${checkBox}  Catenate  SEPARATOR=  xpath=//tr[  ${position}]/td/input[@type='checkbox']
    Click  ${checkBox}
    DOMreadyByWaitTime  3
    Click  ${Loc_MoveButton}
    DOMreadyByWaitTime  3
    Run Keyword And Ignore Error  WaitForElementPresent  ${Loc_FolderChangeWarningMsg}
    Run Keyword And Ignore Error  Click  ${Loc_WarningContinueButton}
    WaitForElementPresent  ${Loc_ConfirmationTablecss}
    Click  ${Loc_ApplyChangesButton}
    DOMreadyByWaitTime  3
    # Scroll Element Into View  //div[@class='list_view_container ap_list_type']
    WaitForElementPresent  css=div.aw_pager
    Scroll Element Into View  css=div.aw_pager
    AssertForDeviceNotPresentInTheTable  ${deviceName}
    
    
Move the devices from the created folder to TOP folder
    [Arguments]  ${deviceName}  ${deviceFolder}
    Navigate To TOP Folder page
    Select From Dropdown List  ${Loc_FolderDropDowncss}  ${deviceFolder}
    DOMreadyByWaitTime  3
    Scroll Element Into View  css=div.aw_pager
    DOMreadyByWaitTime  3
    ${curposition}  Get Device Position From Table  ${deviceName}
    ### Clicking on the device list edit icon.
    # ${element}=    Get WebElement    ${Loc_FolderEditIcon}
    Click using Javascript  ${Loc_FolderEditIcon}
    WaitForElementPresent  ${Loc_DeviceModifySection}
    ### Clicking on the device action list dropdown.
    Click  ${Loc_DeviceActionDropdownSection}
    WaitForElementPresent  ${Loc_ChangeDeviceGroupFolderDropdownValue}
    Click  ${Loc_ChangeDeviceGroupFolderDropdownValue}
    DOMreadyByWaitTime  3
    Click  ${Loc_FolderDropdownSection}
    DOMreadyByWaitTime  3
    Click  ${Loc_TopFolderDropdownValue}
    DOMreadyByWaitTime  3
    Scroll Element Into View  css=div.aw_pager
    DOMreadyByWaitTime  3
    ${position}  Evaluate  ${curposition}+1
    ${checkBox}  Catenate  SEPARATOR=  xpath=//tr[  ${position}]/td/input[@type='checkbox']
    Click  ${checkBox}
    DOMreadyByWaitTime  3
    Click  ${Loc_MoveButton}
    DOMreadyByWaitTime  3
    Run Keyword And Ignore Error  WaitForElementPresent  ${Loc_FolderChangeWarningMsg}
    Run Keyword And Ignore Error  Click  ${Loc_WarningContinueButton}
    WaitForElementPresent  ${Loc_ConfirmationTablecss}
    Click  ${Loc_ApplyChangesButton}
    DOMreadyByWaitTime  3
    WaitForElementPresent  css=div.aw_pager
    Scroll Element Into View  css=div.aw_pager
    AssertForDeviceNotPresentInTheTable  ${deviceName}
    
Move the devices from new page to group and folder
    [Arguments]  ${deviceName}  ${deviceGroup}  ${deviceFolder}
    Navigate To Header New Devices Page
    DOMreadyByWaitTime  3
    ${elements}  Get Webelements  //td/a[text()='${deviceName}']/../parent::tr/td/input
    :FOR  ${element}  IN  @{elements}
    \    Click  ${element}
    \    DOMreadyByWaitTime  3
    \    
    ### Group selection
    Click  ${Loc_DevicesNew_GroupDropdown}
    DOMreadyByWaitTime  3
    Click  //div[contains(@class,'goog-menuitem-content') and contains(text(),'${deviceGroup}')]
    DOMreadyByWaitTime  3
    ### Folder Selection
    Click  ${Loc_DevicesNew_FolderDropdown}
    DOMreadyByWaitTime  3
    Click  //div[contains(@class,'goog-menuitem-content') and contains(text(),'${deviceFolder}')]
    DOMreadyByWaitTime  3
    Click  ${Loc_DevicesNew_AddButton}
    Click  ${Loc_ApplyChangesButton}
    AssertForDeviceNotPresentInTheTable  ${deviceName}
    Log  New Devices are moved..!
    
Get Client Count From Group Table
    [Arguments]  ${groupName}
    DOMreadyByWaitTime  3
    ${count}  Get Element Count  //th[@class='client_count']/preceding-sibling::th
    ${clientCount_Column}  Evaluate  ${count}-2
    Focus Element  //td/a[text()='${groupName}']/ancestor::tr/td[${clientCount_Column}]
    ${clientCount}  Get Text  //td/a[text()='${groupName}']/ancestor::tr/td[${clientCount_Column}]
    # Set Test Variable  ${counts}  ${clientCount.text}
    [return]  ${clientCount}
    
Get Client Count From Devices List Page
    [Arguments]  ${folderName}=Top
    DOMreadyByWaitTime  3
    Click  ${Loc_DeviceListTimeInterval2h}
    DOMreadyByWaitTime  3
    Select From Dropdown List  ${Loc_FolderDropDowncss}  ${folderName}
    WaitForPageLoading
    Click  ${Loc_DeviceListChart1Dropdown}
    DOMreadyByWaitTime  2
    Click  //div[@class='goog-menuitem-content' and text()='Clients']
    WaitForPageLoading
    ${clientCount}  Get Text  //*[@class='monitoring_title' and text()='CLIENTS']/parent::div//div[@class='monitoring_view']/a
    [return]  ${clientCount}
    
Get Client Count From Devices List Page Graph Info
    DOMreadyByWaitTime  3
    @{charts}  Get Webelements  ${Loc_DeviceListClient_Chart}
    Double Click  @{charts}[0]
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_DeviceListChartPopup}
    ${elementText}  Get Text  //tr[@class='even lastrow']/td[2]
    @{values}  Split String  ${elementText}
    log  @{values}[0]
    [return]  @{values}[0]

Get Client Usage From Devices List Page
    [Arguments]  ${folderName}=Top
    DOMreadyByWaitTime  3
    Click  ${Loc_DeviceListTimeInterval2h}
    DOMreadyByWaitTime  3
    Select From Dropdown List  ${Loc_FolderDropDowncss}  ${folderName}
    WaitForPageLoading
    Click  ${Loc_DeviceListChart1Dropdown}
    DOMreadyByWaitTime  2
    Click  //div[@class='goog-menuitem-content' and text()='Usage']
    WaitForPageLoading
    ${clientUsage}  Get Text  //*[@class='monitoring_title' and text()='USAGE']/parent::div//div[@class='monitoring_view']
    ${clientUsage}  Set Variable If  '${clientUsage}'=='-'  0
    [return]  ${clientUsage}
    
Get Client Usage From Devices List Page Graph Info
    DOMreadyByWaitTime  3
    @{charts}  Get Webelements  ${Loc_DeviceListClient_Chart}
    Double Click  @{charts}[0]
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_DeviceListChartPopup}
    Set Test Variable  ${value}  0
    :FOR  ${i}  IN RANGE  1  5
    \    ${elementText}  Get Text  //table[@class='data responsive']//tr[${i}]/td[2]
    \    @{values}  Split String  ${elementText}
    \    log  @{values}[0]
    \    ${value}  Evaluate  ${value}+@{values}[0]
    \    
    [return]  ${value}    
    
Navigate to Group Monitor Page
    [Arguments]  ${groupName}
    DOMreadyByWaitTime  3
    Click  //td/a[text()='${groupName}']
    Log  Navigated to ${groupName} Monitor Page..!
    
Get Client Count From Group Monitor Table
    DOMreadyByWaitTime  3
    ${clientCount}  Get Text  //label[text()='CLIENTS']/parent::div//div[@class='monitoring_view']
    [return]  ${clientCount}
    
Verify the Client Usage Details
    [Arguments]  ${actualValue}  ${expectedValue}
    DOMreadyByWaitTime  3
    ${status}  Run Keyword And Return Status  Evaluate  ${actualValue}-3<${expectedValue}<${actualValue}+3
    [Return]  ${status}
    
Navigate To Controller Moniter Page
    [Arguments]  ${deviceName}
    DOMreadyByWaitTime  3
    Click  //div[@class='read_state']/a[text()='${deviceName}']
    WaitForPageLoading
    
    
Navigate To Controller-AP Page
    #Navigate To Controller-AP Page 
    ${count}  Get Element Count  //div[text()='APs']/parent::th/preceding-sibling::th
    ${apColumn}  Evaluate  ${count}+1
    @{APs}  Get Webelements  //table[contains(@class,'highlightable simply-scroll-list')]/tbody/tr/td[${apColumn}][text()='-']/parent::tr/td[2]
    Log  @{APs}[0]
    Click  @{APs}[0]
    WaitForPageLoading

Create a New filter for Client Details
    DOMreadyByWaitTime  3
    Click  //*[@id='section-controls']//li/a[text()='Clients']
    WaitForPageLoading
    Click  css=a.icosolo.icon_arrow_down
    Sleep  3s
    Click  xpath=//a[@class='menu_item enable']
    Wait Until element is visible  css=.mwx_dialog.panel.no_pad.rounded
    Type  //div[@class='filter_data']/input[@type='text']  Filter_01
    DOMreadyByWaitTime  2
    @{columns}  Create List  Connection Mode  Role  Sig. Qual.  Device Type  OS Detail  Channel Width  Goodput  Speed  Usage  Duration  Interface  SSID  VLAN  Device Name  Forward Mode  LAN IP Addresses  Cipher  Auth. Type
    :FOR  ${column}  IN  @{columns}
    \    DOMreadyByWaitTime  2
    \    ${element}  Get WebElement  xpath=//div[text()='${column}']
    # \    webdriverlib_helper_init
    # \    scroll_by_javascript  ${element}
    # \    Execute Javascript  ${js_ScrollToView}  ${element}
    \    Scroll element into view  xpath=//div[text()='${column}']
    \    DOMreadyByWaitTime  2
    \    Drag and Drop  xpath=//div[text()='${column}']  css=div#actual_col_list.column_list
    \    DOMreadyByWaitTime  2
    \    
    Click  //div[@class='mwx_dialog-buttons']/button[@name='ok']
    
Get Client Details From AP Page
    Create a New filter for Client Details
    DOMreadyByWaitTime  3
    @{columns}  Create List  Role  Sig. Qual.
    [return]  @{columns}
    
Get Client Details From Controller Monitor Page
    DOMreadyByWaitTime  3
    ${clientCount}  Get Element Text  //div[@id='fragment_div_AP__Monitoring__InfoTable']//td[contains(text(),'Clients:')]/following-sibling::td[1]
    ${clientCount}  Set Variable If  '${clientCount}'=='-'  0   ${clientCount}
    [return]  ${clientCount}
    
Get Client Details From Controllers AP List
    DOMreadyByWaitTime  3
    Set Test Variable  ${client_counts}  0
    ${columns}  Get Elements Count  //div[@key='client_count']/ancestor::th/preceding-sibling::th
    ${columns}  Evaluate  ${columns}+1
    ${apList}  Get Elements Count  //div[contains(@id,'aplist-scroll-table m_table')]//tr
    :FOR  ${ap}  IN RANGE  1  ${apList}
    \    ${count}  Get Element Text  //div[contains(@id,'aplist-scroll-table m_table')]//tr[${ap}]/td[${columns}]
    \    ${client_counts}  Evaluate  ${client_counts}+${count}
    \    
    [return]  ${client_counts}
    


###  Ram code  ###


      