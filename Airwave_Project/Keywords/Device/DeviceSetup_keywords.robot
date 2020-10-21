*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Locators/DeviceSetupPages.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Utilities/Data_Provider.robot
Resource          ../../Locators/AMPSetupPage.robot



*** Keywords ***
Add Certificate
    [Arguments]  ${name}  ${CertFile}  ${format}  ${Type}
    Click  ${Add_NewCertButton}
    Type  ${Loc_CertName}  ${name}
    Choose file  ${Choose_file}  ${CertFile}
    Select Dropdown LabelValue  ${formatDropdown}  ${format}
    Select Dropdown LabelValue  ${CertType}  ${Type}
    Click  ${Add_cert}
    WaitForElementPresent  ${Loc_certificateAddedSuccess}
    Log  ${Type} certificate added successfully!  console=True


Add New Scan Network
    [Arguments]  ${network_to_add}  ${ip_add}  ${mask_add}
    Click  ${Loc_Add_scan_network}
    DOMreadyByWaitTime  5
    WaitForElementPresent  ${Loc_name_input}
    Type  ${Loc_name_input}  ${network_to_add}
    Type  ${Loc_network_input}  ${ip_add}
    Type  ${Loc_mask_input}  ${mask_add}
    Click  ${Loc_add_network}
    WaitForElementPresent  ${Loc_networkaddedsuccessful}
    ${cnfrm}  Get Element Text  ${Loc_networkaddedsuccessful}
    Log  ${cnfrm}  console=True
    
Add New Scan Credential
    [Arguments]  ${network_to_add}  ${Type}  ${communitystring}
    Click  ${Loc_Add_scan_credential}
    DOMreadyByWaitTime  5
    WaitForElementPresent  ${Loc_name_input}
    Type  ${Loc_name_input}  ${network_to_add}
    Select Dropdown LabelValue  ${Loc_Type_dropdown}  ${Type}
    DOMreadyByWaitTime  3
    Type  ${Loc_Communitystring}  ${communitystring}
    Type  ${Loc_Communitystring_cnfrm}  ${communitystring}
    Click  ${Loc_add_credential}
    WaitForElementPresent  ${Loc_credentialaddedsuccessful}
    ${cnfrm}  Get Element Text  ${Loc_credentialaddedsuccessful}
    Log  ${cnfrm}  console=True
    
Add New Scan Set
    [Arguments]  ${added_network}
    Click  ${Loc_Add_scan_set}
    DOMreadyByWaitTime  3
    Click  ${Loc_Network_scan_set}//label[contains(.,'${added_network}')]/*
    Click  ${Loc_Credentials_scan_set}//label[contains(.,'${added_network}')]/*
    Click  ${Loc_add_set}
    WaitForElementPresent  ${Loc_scansetaddedsuccessful}
    ${cnfrm}  Get Element Text  ${Loc_scansetaddedsuccessful}
    Log  ${cnfrm}  console=True
    


ModifyTelnetAndSSHusername
    [Arguments]  ${Username}
    Click  ${Loc_ArubaEdit}
    Type  ${Loc_Username}  ${Username}
    Click  ${Loc_CommunicationSave}
    
Verify Username
    [Arguments]  ${Username}  ${Dev_Type}
    Select Dropdown LabelValue  ${Loc_AddDeviceType}  ${Dev_Type}
    Click  ${Loc_AddDevice}
    ${confirm_Username}  Get Value  ${Loc_Username}
    Should Be Equal As Strings  ${confirm_Username}  ${Username}


Check configuration
    [Arguments]  ${ip}
    Click  ${Loc_icon_search}
    Type  ${Loc_search_input_xpath}  ${ip}
    Click  ${Loc_searchPopup}
    sleep  5s
    Click  //*[@id="switches_button"]
    Sleep  5
    ${Count}  get element count  //*[@title='${ip}']/preceding-sibling::td
    Run keyword if  ${count}==0  Click  ${Loc_close_button}
    Run keyword if  ${count}==0  Fail  No controller present!
    Click  //*[@title="${ip}"]/preceding-sibling::td
    sleep  5s
   # Wait Until Element Is Visible  ${Loc_Client_detail}  30s
    Navigate to Device Config Page
    sleep  5s
    Click  //*[text()='Audit']
    Wait Until Element Is Not Visible  ${loader}  30s
    sleep  5s
    AssertForElementPresent  ${Loc_Verifying_config_status}
    Wait until keyword succeeds  5 min  2 min  Check good status
    
Check good status
    Reload page
    sleep  20s
    AssertForElementPresent  ${Loc_Good_config_status}



Navigate to Device Config Page
    Wait Until Element Is Visible  ${Device_config_xpath}
    Sleep  3s
    Click  ${Device_config_xpath}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Get device count
    ${count}  get element text  ${Loc_device_count}
    ${count}  Convert to integer  ${count}
    [return]  ${count}
    
Verify device count after scan
    [Arguments]  ${count1}
    reload page
    DOMreadyByWaitTime  60
    ${count2}  get element text  ${Loc_device_count}
    ${count2}  Convert to integer  ${count2}
    Log  ${count2}  console=True
    Should be true  ${count2} > ${count1}

Scan network
    [Arguments]  ${added_network}
    Click  ${Loc_scan_addScanset}//td[contains(.,'${added_network}')]${Loc_scan_Checkbox}
    Click  ${Loc_Scan_button}
    DOMreadyByWaitTime  3

Verify Scan Completion
    [Arguments]  ${added_network}
    Click  ${Loc_Refreshbutton}
    DOMreadyByWaitTime  3
    Wait Until Element Is Not Visible  ${loader}  30s
    ${text}  get element text  //*[.='${added_network}']/parent::tr/*[10]
    Should contain  ${text}  :
    Log  ${text}  console=True
    

Check Device Status of controller
    [Arguments]  ${IP}  ${DeviceName}  ${MAC}  ${Status}  ${configuration}
    Click  //*[@id="controllers_button"]
    sleep  5s
    ${count}  Get Element Count  //*[@title='${IP}']
    Run Keyword if  ${count} > 0  check status after polling  ${IP}  ${DeviceName}  ${MAC}  ${Status}  ${configuration}  ${count}
    ...  ELSE  Add Device and check status after polling  ${IP}  ${DeviceName}  ${MAC}  ${Status}  ${configuration}  ${count}
    
check status after polling
    [Arguments]  ${IP}  ${DeviceName}  ${MAC}  ${Status}  ${configuration}  ${count}
    
    Click  //*[@title='${IP}']
    Wait Until Element Is Not Visible  ${loader}  30s
    sleep  3s
    Run keyword if  ${count} > 0  Click Poll
   # Wait Until Element Is Visible  ${Loc_PollingMessage}  30s
    Run keyword if  ${count} > 0  DOMreadyByWaitTime  300
   # Wait Until Element Is Not Visible  ${Loc_PollingMessage}  50s
    AssertForElementPresent  ${Loc_PollStatus}*[contains(.,'${Status}')]
    Log  Status: ${Status}  console=True
    AssertForElementPresent  ${Loc_PollConfiguration}*[contains(.,'${configuration}')]
    Log  Configuration: ${configuration}  console=True
    ${PollIP}  get element text  ${Loc_PollIP}
    Should be true  '${PollIP}'=='${IP}'
    Log  IP: ${PollIP}  console=True
    ${PollMac}  Get element text  //*[@title='${MAC}']
    Should be true  '${PollMac}'=='${MAC}'
    Log  MAC Address: ${PollMac}  console=True
    

Click Poll    
    ${controllerPollcount}  get element count  ${Loc_Poll_button}
  #  ${switchPollcount}  get element count  ${Loc_switchPoll}
    Run Keyword if  ${controllerPollcount} > 0  Double click  ${Loc_Poll_button}
    ...  ELSE    Double click  ${Loc_switchPoll}
    
Exit Controller Execution
    Click  ${Loc_close_button}
    Fail  log="Up status controller not present"
    
    
Add Device and check status after polling
    [Arguments]  ${IP}  ${DeviceName}  ${MAC}  ${Status}  ${configuration}  ${count}
    Get Device Details for controller  Check Device Status after Polling
    Click  ${Loc_close_button}
    Add a New Device for Poll  ${DeviceName}  ${DeviceType}  ${DeviceIPAddress}  ${DeviceCommunityString}  ${TelnetSSHUsername}  ${TelnetSSHPassword}  ${GroupName}  ${FolderName}
    Navigate To Home Page
    Click  ${Loc_icon_search}
    Type  ${Loc_search_input_xpath}  ${IP}
    DOMreadyByWaitTime  5
    Click  ${Loc_searchPopup}
    DOMreadyByWaitTime  5
    Click  //*[@id="controllers_button"]
    sleep  5s
    ${afteraddedcount}  Get Element Count  //*[@title='${IP}']
    Run keyword If  ${afteraddedcount} > 0  check status after polling  ${IP}  ${DeviceName}  ${MAC}  ${Status}  ${configuration}  ${count}
    ...  ELSE  Exit Controller Execution
    
    
Add a New Device for Poll
    [Arguments]  ${DeviceName}  ${DeviceType}  ${DeviceIPAddress}  ${DeviceCommunityString}  ${TelnetSSHUsername}  ${TelnetSSHPassword}  ${GroupName}  ${FolderName}
    Navigate To Device Setup Page
    Navigate To Device Setup Add Page
    WaitForElementPresent  ${Loc_DeviceTypeDropdown_css}
    Select Dropdown LabelValue  ${Loc_DeviceTypeDropdown_css}  ${DeviceType}
    Click  ${Loc_AddButton_css}
    ${value}  Catenate  Creating  ${DeviceType}
    Page Should Contain  ${value}
    #Type Text  ${Loc_NameField_css}  ${DeviceName}
    Type Text  ${Loc_IPAddressField_xpath}  ${DeviceIPAddress}
    Type Text  ${Loc_CommunityStringField_css}  ${DeviceCommunityString}
    Type Text  ${Loc_ConfirmCommunityStringField_css}  ${DeviceCommunityString}
    Type Text  ${Loc_TelnetSSHUsernameField_css}  ${TelnetSSHUsername}
    Type Text  ${Loc_TelnetSSHPasswordField_css}  ${TelnetSSHPassword}
    Type Text  ${Loc_ConfirmTelnetSSHPasswordField_css}  ${TelnetSSHPassword}
    Select Dropdown LabelValue  ${Loc_SelectGroupField_css}  ${GroupName}
    Focus Element  ${Loc_SelectFolderField_css}
    DOMreadyByWaitTime  3
    Select From Dropdown List  ${Loc_SelectFolderField_css}  ${FolderName}
    Click  ${Loc_DeviceAddButton_css}
    WaitForPageLoading
    AssertForTableElementPresent  ${GroupName}
    AssertForTableElementPresent  ${FolderName}
    AssertForElementPresent  ${Loc_ApplyChangesButton_css}
    AssertForElementPresent  ${Loc_CancelButton_css}
    Click  ${Loc_ApplyChangesButton_css}
    WaitForPageLoading
    Sleep  5s
    ${ip_address}  Catenate  SEPARATOR=  ${Loc_IPAddressField_xpath}  [@value='${DeviceIPAddress}']
    AssertForElementPresent  ${ip_address}
    Log  ${DeviceIPAddress} device created successfully..!  console=true
    sleep  20s
    Navigate to DeviceMonitor Page
    sleep  5s
    Click Poll
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
    ...  ELSE     Fail  Up status Controller not found in ${DeviceIPAddress}
  #  AssertForElementPresent  //*[@title='${DeviceIPAddress}']
    Log  Device - ${DeviceIPAddress} verified!  console=True
    
  #  Navigate To Device New Page
   # Click  ${Loc_NewDevice_Header}
  #  DOMreadyByWaitTime  3
  #  Click  ${Loc_DeviceActionDropdowm}
  #  DOMreadyByWaitTime  2
  #  Click  ${Loc_selectDevice}
  #  DOMreadyByWaitTime  2
  #  Click  ${Loc_selectGroupDropdowm}
  #  DOMreadyByWaitTime  2
  #  Click  //*[text()='${GroupName}']
  #  DOMreadyByWaitTime  2
  #  Click  ${Loc_selectFolderDropdown}
  #  DOMreadyByWaitTime  2
  #  Click  //*[contains(text(),'${FolderName}')]
  #  DOMreadyByWaitTime  2
  #  Click  ${Loc_AddButton}
  #  DOMreadyByWaitTime  2
    
    
   # Wait Until Element Is Not Visible  ${Loc_PollingMessage}  50s
    
    
Navigate to DeviceMonitor Page
    Wait Until Element Is Visible  ${Loc_Monitor}
    Sleep  3s
    Click  ${Loc_Monitor}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Generate the specific Alarm and check
    [Arguments]  ${type}  ${severity}  ${value}
    Navigate To Systems Page
    Navigate To Systems Triggers Page
    DOMreadyByWaitTime  5
    Click  ${Loc_AddTrigger}
    DOMreadyByWaitTime  3
    Click  ${Loc_triggerTypeDropdown}
    Click  //*[text()='${type}']
    DOMreadyByWaitTime  2
    Select Dropdown LabelValue  ${Loc_severityDropdown}  ${severity}
    DOMreadyByWaitTime  2
    Type  ${Loc_ValueText}  ${value}
    Click  ${Loc_AddVAl}
    DOMreadyByWaitTime  5
    Navigate To Systems Alerts Page
    DOMreadyByWaitTime  5
    AssertForElementPresent  //*[text()='${type}']/following-sibling::*[contains(text(),'${value}')]
    Log  Alert - ${type}-${severity} generated  console=True
    
    
    
       
    
    



*** Keywords ***
Get Device Details for controller
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${DeviceTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceType
    ${DeviceType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceTypeList}  1
    Set Suite Variable  ${DeviceType}
    ${DeviceIPAddressList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceIPAddress
    ${DeviceIPAddress} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceIPAddressList}  1
    Set Suite Variable  ${DeviceIPAddress}
    ${DeviceCommunityStringList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceCommunityString
    ${DeviceCommunityString} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceCommunityStringList}  1
    Set Suite Variable  ${DeviceCommunityString}
    ${TelnetSSHUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_TelnetSSHUsername
    ${TelnetSSHUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TelnetSSHUsernameList}  1
    Set Suite Variable  ${TelnetSSHUsername}
    ${TelnetSSHPasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_TelnetSSHPassword
    ${TelnetSSHPassword} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TelnetSSHPasswordList}  1
    Set Suite Variable  ${TelnetSSHPassword}
    Set Suite Variable  ${DeviceCommunityString}
    ${GroupNameList} =  Data_Provider.GetDataProviderColumnValue  Data_GroupName
    ${GroupName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GroupNameList}  1
    Set Suite Variable  ${GroupName}
    ${FolderNameList} =  Data_Provider.GetDataProviderColumnValue  Data_FolderName
    ${FolderName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FolderNameList}  1
    Set Suite Variable  ${FolderName}
    
*** Variables ***
    
${SheetName}  Devices
${DeviceType}
${DeviceIPAddress}
${DeviceCommunityString}
${TelnetSSHUsername}
${TelnetSSHPassword}
${GroupName}
${FolderName}




    

*** comments ***
Verify Scan Completion
    [Arguments]  ${added_network}
    Reload page
    DOMreadyByWaitTime  60
    ${text}  get element text  //*[.='${added_network}']/parent::tr/*[10]
    Should contain  ${text}  :
    Log  ${text}  console=True
    



