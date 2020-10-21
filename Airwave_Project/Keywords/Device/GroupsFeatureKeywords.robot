*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Locators/DeviceSetupPages.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Utilities/Data_Provider.robot
Resource          ../../Locators/AMPSetupPage.robot
Resource          ../../Keywords/Device/DeviceSetup_keywords.robot

*** Variables ***


${deviceParentFolder}  Top  
${js_ScrollToView}  return arguments[0].scrollIntoView(true);

*** Keywords ***

Create a New Group in Airwave
    [Documentation]  Creating a new group to AMP in 'Groups - Add' page.
    ...    
    [Arguments]  ${GroupsName}
    Navigate To Group Page
    Sleep  5s
    Navigate To Group List Page
    WaitForElementPresent  ${Loc_AddGroupButton_css}
    Sleep  5s
    Click  ${Loc_AddGroupButton_css}
    WaitForElementPresent  ${Loc_AddGroupNameField_css}
    Type Text  ${Loc_AddGroupNameField_css}  ${GroupsName}
    Sleep  3s
    Click  ${Loc_AddGroupAddButton_css}
    AssertForTableElementPresentInTheTextbox  ${GroupsName}
    Navigate To Group List Page
    #Verify in Group list page.
    AssertForElementPresent  //tbody//*[contains(text(),'${GroupsName}')]
   # AssertForTableElementPresent  ${GroupsName}
    Log  Group - ${GroupsName} created successfully..!  console=true
    
Delete Group
    [Arguments]  ${deviceGroup}
    Navigate To Group Page
    Navigate To Group List Page
    ${locator}  Catenate  SEPARATOR=  //a[text()='  ${deviceGroup}']/ancestor::tr/td/input
    Wait Until Element Is Visible  ${locator}  30s
    Click  ${locator}
    Click  ${Loc_DeleteGroupButton_css}
    AssertForTableElementNotPresent  ${deviceGroup}
    Log  Group - ${deviceGroup} deleted successfully..!  console=true
    
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
    AssertForElementPresent  //p[@class="icofirst icon_confirmed ok"]
    AssertForElementPresent  //*[@name="jump_off"]/*[contains(text(),'${deviceFolder}')]
   # AssertSpecificTableElementPresent  ${Loc_FolderListTable}  ${deviceFolder}
    Log  Folder - ${deviceFolder} created successfully..!  console=true
    
Create a Sub Folder
    [Documentation]  Creating a new folder to AMP in 'Device Setup - Add' page.
    ...    
  #  [Arguments]  ${deviceFolder}  ${deviceparentFolder1}
     [Arguments]   ${FoldersName}  ${FoldersName1}
    Navigate To Device Page
    Navigate To Device List Page
    Focus Element  ${Loc_AddNewFolder_Xpath}
    Click  ${Loc_AddNewFolder_Xpath}
    WaitForElementPresent  ${Loc_FolderNameField_css}
    #Type Text  ${Loc_FolderNameField_css}  ${deviceFolder}
    Type Text  ${Loc_FolderNameField_css}  ${FoldersName1}
    Focus Element  ${Loc_ParentFolderField_css}
   # Sleep  5s
   # Select Dropdown LabelValue  ${Loc_ParentFolderField_css}  ${deviceparentFolder1}
    Select From Dropdown List  ${Loc_ParentFolderField_css}  ${FoldersName}
    Click  ${Loc_FolderAddButtonField_css}
    DOMreadyByWaitTime  3
    AssertForElementPresent  //p[@class="icofirst icon_confirmed ok"]
   # AssertSpecificTableElementPresent  ${Loc_FolderListTable}  ${FoldersName1}
   Click  //*[@name="jump_off"]
   ## Select From Dropdown List  //*[@name="jump_off"]  AutomateFol0021
    DOMreadyByWaitTime  3
   # ${output}  Get value  //*[@name="jump_off"]
    AssertForElementPresent  //*[@name="jump_off"]/*[contains(text(),'${FoldersName}')]/following-sibling::*[contains(text(),'${FoldersName1}')]
   # log  ${output}    
    Log  Sub Folder - ${FoldersName1} created successfully..!  console=true
    
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
    Log  Folder - ${deviceFolder} deleted successfully..!  console=true
    
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
    
    
Add a New Device
    [Arguments]  ${deviceName}  ${deviceGroup}  ${deviceFolder}  ${device_Status}
    Navigate To Device Setup Page
    Navigate To Device Setup Add Page
    Get Device Details  Groups
    WaitForElementPresent  ${Loc_DeviceTypeDropdown_css}
    Select Dropdown LabelValue  ${Loc_DeviceTypeDropdown_css}  ${deviceType}
    Click  ${Loc_AddButton_css}
    ${value}  Catenate  Creating  ${deviceType}
    Page Should Contain  ${value}
   # Type Text  ${Loc_NameField_css}  ${deviceName}
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
    Click  css=[name='save'][value='Save and Apply'][type='submit']
    sleep  5s
    Navigate to DeviceMonitor Page
    DOMreadyByWaitTime  5
    ${controllerPollcount}  get element count  ${Loc_Poll_button}
  #  ${switchPollcount}  get element count  ${Loc_switchPoll}
    Run Keyword if  ${controllerPollcount} > 0  Double click  ${Loc_Poll_button}
    ...  ELSE    Double click  ${Loc_switchPoll}
   # Double click  ${Loc_switchPoll}
    
  #  Wait Until Element Is Visible  ${Loc_PollingMessage}  30s
    DOMreadyByWaitTime  300
   # Wait Until Element Is Not Visible  ${Loc_PollingMessage}  50s
    Click  ${Loc_icon_search}
    Type  ${Loc_search_input_xpath}   ${deviceIPAddress}
    DOMreadyByWaitTime  5
    Click  ${Loc_searchPopup}
    DOMreadyByWaitTime  10
    Check Device Status of Switch   ${DeviceName}  ${deviceIPAddress}  ${device_Status}
    
Check Device Status of Switch
    [Arguments]  ${DeviceName}  ${deviceIPAddress}  ${device_Status}
    ${count}  Get Element Count  //*[text()='${deviceIPAddress}']
    Run Keyword if  ${count} > 0  check status after polling of Switch  ${DeviceName}  ${deviceIPAddress}  ${device_Status}
    ...  ELSE     Exit Execution 
  

check status after polling of Switch
    [Arguments]  ${DeviceName}  ${deviceIPAddress}  ${device_Status}
   # Click  //*[@title='${DeviceName}']
   # Wait Until Element Is Not Visible  ${loader}  30s
  #  click  ${Loc_Poll_button}
   Click  //*[@id="switches_button"]
   Sleep  5
   ${Upcount}  Get Element Count  //*[text()='${deviceIPAddress}']//following-sibling::*[text()='${device_Status}']
   
   Run Keyword if  ${Upcount} > 0  AssertForElementPresent  //*[text()='${deviceIPAddress}']//following-sibling::*[text()='${device_Status}']
   ...  ELSE     Exit Execution
   # AssertForElementPresent  ${Loc_PollStatus}*[contains(.,'${device_Status}')]
    Log  Status: ${device_Status}  console=True
    DOMreadyByWaitTime  3
    Click  ${Loc_close_button}
    DOMreadyByWaitTime  5

Exit Execution
    Click  ${Loc_close_button}
    DOMreadyByWaitTime  5
    Fail  log="switch with Up status not present"


###  Ram code  ###
*** Keywords ***
Get Device Details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${DeviceTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_deviceType
    ${deviceType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceTypeList}  1
    Set Suite Variable  ${deviceType}
    ${DeviceIPAddressList} =  Data_Provider.GetDataProviderColumnValue  Data_deviceIPAddress
    ${deviceIPAddress} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceIPAddressList}  1
    Set Suite Variable  ${deviceIPAddress}
    ${DeviceCommunityStringList} =  Data_Provider.GetDataProviderColumnValue  Data_deviceCommunityString
    ${deviceCommunityString} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceCommunityStringList}  1
    Set Suite Variable  ${deviceCommunityString}
    ${TelnetSSHUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_deviceTelnetSSHUsername
    ${deviceTelnetSSHUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TelnetSSHUsernameList}  1
    Set Suite Variable  ${deviceTelnetSSHUsername}
    ${TelnetSSHPasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_deviceTelnetSSHPassword
    ${deviceTelnetSSHPassword} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TelnetSSHPasswordList}  1
    Set Suite Variable  ${deviceTelnetSSHPassword}
    
    
*** Variables ***
${SheetName}  Groups
${deviceType}   
${deviceIPAddress}  
${deviceCommunityString}  
${deviceTelnetSSHUsername}  
${deviceTelnetSSHPassword}  
    


      