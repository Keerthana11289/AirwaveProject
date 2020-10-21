*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../Locators/APdeviceFeature.robot
Library           ../../Utilities/Common/WebdriverHelper.py
Resource          ../../Keywords/AOSmodule_keywords/APdeviceFeature2.0_keywords.robot
Resource          ../../Utilities/Data_Provider.robot

*** Keywords ***
Get Version and type
    ${Firm}  Get element text  ${Loc_FirmwareText}
    ${version}  ${bnum}  split string  ${Firm}  _
    Log  Controller version: ${version}  console=True
    ${ControllerType}  Get Element Text  ${Loc_TypeText}
    Log  Controller Type: ${ControllerType}  console=True
    [Return]  ${version}  ${ControllerType}
    
check MM autoprovisioned
    [Arguments]   ${AOScontroller}  ${version}  ${ControllerType}
    Click  ${Loc_icon_searchAP}
    Type  ${Loc_search_input_xpathAP}  ${AOScontroller}
    Sleep  5s
    Click  ${Loc_searchPopupAP}
    sleep  5s
    Click  ${Loc_ControllerButton}
    Sleep  5
    ${Count}  get element count  ${Loc_ControllerLink}
    Run keyword if  ${Count}==0  Click  ${Loc_close_buttonAP}
    Run keyword if  ${Count}==0  Fail  Controller not present!
    AssertForElementPresent  ${Loc_ContStatus}
    Log  Status: Up  console=True
    AssertForElementPresent  (//*[@class="panel table rounded white no_pad" and not(contains(@style,'display: none;'))]//*[@class="m_body"]//td)[1]/following::*[text()='${version}']
    Log  Version verified  console=True
    AssertForElementPresent  (//*[@class="panel table rounded white no_pad" and not(contains(@style,'display: none;'))]//*[@class="m_body"]//td)[1]/following::*[text()='${ControllerType}']
    Log  Type verified  console=True



    
Check master-MDs in Monitor Page
    [Arguments]  ${AOSMD1}  ${AOSMD2}
    DOMreadyByWaitTime  10
    Element should be visible  //*[@title="${AOSMD1}"]
    Element should be visible  //*[@title="${AOSMD2}"]
    Log  MD device verified!  console=True
    
Check master SNMP-MDs in Monitor Page
    [Arguments]  ${AOSMD1}  ${AOSMD2}
    DOMreadyByWaitTime  10
    Element should be visible  //*[@title="${AOSMD1}"]/ancestor::*/following-sibling::*/*[text()='Good']
    Element should be visible  //*[@title="${AOSMD2}"]/ancestor::*/following-sibling::*/*[text()='Good']
    Log  MD device configuration verified!  console=True
    
    
Check For CPU and memory graph
    DOMreadyByWaitTime  10
    ### CPU graph
    ${CPUCount}  Get element count  ${Loc_CPUgraph}
    Run keyword and continue on failure  Run keyword If  ${CPUCount}==0  Fail  No Data!
    Run keyword If  ${CPUCount}!=0  AssertForElementPresent  ${Loc_CPUgraph}
    Run keyword If  ${CPUCount}!=0  Scroll element into view  ${Loc_CPUgraph}
    Run keyword If  ${CPUCount}!=0  Log  CPU Graph For MM verified in monitor page  console=True
    
    ### Memory graph
    ${MemCount}  Get element count  ${Loc_MemoryGraph}
    Run keyword If  ${MemCount}==0  Fail  No Data!
    Run keyword If  ${MemCount}!=0  AssertForElementPresent  ${Loc_MemoryGraph}
    Run keyword If  ${MemCount}!=0  Scroll element into view  ${Loc_MemoryGraph}
    Run keyword If  ${MemCount}!=0  Log  Memory Graph For MM verified in monitor page  console=True
  

Create Inventory Report
    [Arguments]  ${title}  ${Type}  ${group}
    Click  ${Loc_New_Report}
    DOMreadyByWaitTime  5
    WaitForElementPresent  ${Loc_Report_Title}
    Type  ${Loc_Report_Title}  ${title}
    Select Dropdown LabelValue  ${Loc_Report_Type}  ${Type}
    Select Dropdown LabelValue  ${Loc_MM_apGroup}  ${group}
    Click  ${Loc_SelectAPGroup}
    Click  ${Loc_Report_AddandRun}
    

Verify Generated Inventory Report
    [Arguments]  ${Reporttitle}
    Type  ${Loc_ReportSearch}  ${Reporttitle}
    Press Keys  None  RETURN
    AssertForElementPresent  //*[contains(text(),'${Reporttitle}')]
    Log  Report - ${Reporttitle} created!  console=True
    Wait until keyword succeeds  5 min  30 sec  Generated report1  ${Reporttitle}
    DOMreadyByWaitTime  5
    Click  //a[contains(text(),'${Reporttitle}')]
    DOMreadyByWaitTime  10
    ${Reportoutput}=  Get text  ${Loc_ReportFirmware}
    log  ${Reportoutput} 
    ${fst}  ${lst}  split string  ${Reportoutput}   _
    Should Be Equal As Strings  ${lst}  8.7.0.0
    
Generated report1
    [Arguments]  ${title}
    Navigate to Reports Generated Page
    DOMreadyByWaitTime  5
    Type  ${Loc_ReportSearch}  ${title}
    Press Keys  None  RETURN
    DOMreadyByWaitTime  3
    Element should be visible  //a[text()='${title}'] 
    
Cleanup For Report1
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
  
    

    
Create RF Health Report
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
    
Verify Generated RF Health Report
    [Arguments]  ${Reporttitle}
    Type  ${Loc_ReportSearch}  ${Reporttitle}
    DOMreadyByWaitTime  3
    Press Keys  None  RETURN
    AssertForElementPresent  //*[contains(text(),'${Reporttitle}')]
    Log  Report - ${Reporttitle} created!  console=True
    
Create Rogue Containment Report
    [Arguments]  ${title}  ${Type}  ${group}
    Click  ${Loc_New_Report}
    DOMreadyByWaitTime  5
    WaitForElementPresent  ${Loc_Report_Title}
    Type  ${Loc_Report_Title}  ${title}
    Select Dropdown LabelValue  ${Loc_Report_Type}  ${Type}
    Select Dropdown LabelValue  ${Loc_MM_apGroup}  ${group}
    Click  ${Loc_SelectAPGroup}
    Click  ${Loc_Report_AddandRun}
    
Verify Generated Rogue Containment Report
    [Arguments]  ${Reporttitle}
    Type  ${Loc_ReportSearch}  ${Reporttitle}
    DOMreadyByWaitTime  3
    Press Keys  None  RETURN
    AssertForElementPresent  //*[contains(text(),'${Reporttitle}')]
    Log  Report - ${Reporttitle} created!  console=True
    
Create Audit Report
    [Arguments]  ${title}  ${Type}  ${group}
    Click  ${Loc_New_Report}
    DOMreadyByWaitTime  5
    WaitForElementPresent  ${Loc_Report_Title}
    Type  ${Loc_Report_Title}  ${title}
    Select Dropdown LabelValue  ${Loc_Report_Type}  ${Type}
    Select Dropdown LabelValue  ${Loc_MM_apGroup}  ${group}
    Click  ${Loc_SelectAPGroup}
    Click  ${Loc_Report_AddandRun}
    
Verify Generated Audit Report
    [Arguments]  ${Reporttitle}
    Type  ${Loc_ReportSearch}  ${Reporttitle}
    DOMreadyByWaitTime  3
    Press Keys  None  RETURN
    AssertForElementPresent  //*[contains(text(),'${Reporttitle}')]
    Log  Report - ${Reporttitle} created!  console=True
    
Create Device UPtime Report
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
    
Verify Generated Device UPtime Report
    [Arguments]  ${Reporttitle}
    Type  ${Loc_ReportSearch}  ${Reporttitle}
    DOMreadyByWaitTime  3
    Press Keys  None  RETURN
    AssertForElementPresent  //*[contains(text(),'${Reporttitle}')]
    Log  Report - ${Reporttitle} created!  console=True

Get License detail from CLI
    Get AOS amp details  AMP details
    ${LicVal}  Get License Info  ${CLIhost}  ${CLIUsername}  ${CLIpassword} 
    Log   License: ${LicVal}  console=true
    [return]  ${LicVal}
        

Check For MM License
    [Arguments]  ${Controller}  ${LicVal}
    DOMreadyByWaitTime  5
    Click  ${Loc_License}
    DOMreadyByWaitTime  5
    Switch Window  locator=NEW
    DOMreadyByWaitTime  5
    ${output}=  Get Text  ${Loc_LicenseText}
    log  ${output}  console=True 
    Should Contain  ${output}  License Table for ${Controller}:
    ${output}=  Get Text  ${Loc_LicRowcount}
    log  ${output}  console=True
    Close Window 
    DOMreadyByWaitTime  5
    Switch Window  MAIN
    DOMreadyByWaitTime  5
    Should Contain any  ${output}  ${LicVal}
    Log  MM license verified  console=True
    

Create Group For Master controller
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
    
Add Master over SNMP Positive
    [Arguments]  ${DeviceType}  ${DeviceIPAddress}  ${DeviceCommunityString}  ${TelnetSSHUsername}  ${TelnetSSHPassword}  ${GroupName}  ${FolderName}  ${SNMPv3AuthProtocol}  ${PrivacyPassword}  ${SNMPv3PrivProtocol}
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
    Select Dropdown LabelValue  ${Loc_AuthProtocol}  ${SNMPv3AuthProtocol}
    Type Text  ${Loc_PrivacyPassword}  ${PrivacyPassword}
    Type Text  ${Loc_ConfirmPrivacyPassword}  ${PrivacyPassword}
    Select Dropdown LabelValue  ${Loc_PrivProtocol}  ${SNMPv3PrivProtocol}
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
    
    
    
Add Master Controller
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
    
    
Add master-MD To group
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
    

Add master-AP To group
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

Check MD status
    [Arguments]  ${AOScontroller}
    DOMreadyByWaitTime  10
    ${count}  Get Element Count  //*[@title="${AOScontroller}"]/ancestor::*/preceding-sibling::*[@class="m_checkbox"]
    Run keyword if  ${count}==0  Fail  No MD devices!
    :FOR  ${i}  IN RANGE  1  ${count}+1
    \    ${dev}  Get Element Text  (//*[@title="${AOScontroller}"]/ancestor::*/preceding-sibling::*/*[@class="read_state"]/*)[${i}] 
    \    ${Configuration}  Get element Text  (//*[@title="Aruba43_65_120"]/ancestor::tr/*[contains(@class,"management_state monitor_only")]/*)[${i}] 
    \    ${Status}  Get Element Text  (//*[@title="${AOScontroller}"]/ancestor::tr/td[3])[${i}]
    \    Log  ${dev} : Status- ${Status} and Configuration- ${Configuration}  console=True
    \    Should be true  '${Status}'=='Up' and '${Configuration}'=='Good'
    Log  MD SNMP status verified!  console=True
    
Remove MD and verify
    [Arguments]  ${AOScontroller}
    DOMreadyByWaitTime  10
    Webdriverlib Helper Init
    Execute JavaScript    document.querySelector('a.fontface.icon_edit',':before').click();
    Click  ${Loc_DeviceActionDropdowm}
    DOMreadyByWaitTime  2
    Click  ${Loc_SelectPollDevice}
    DOMreadyByWaitTime  2
    ${Count}  get element count  //*[@title="${AOScontroller}"]/parent::*/preceding-sibling::*[@class="m_checkbox"]/* 
    Run keyword if  ${Count}==0  Fail  No Device present!
    Click  (//*[@title="${AOScontroller}"]/parent::*/preceding-sibling::*[@class="m_checkbox"]/*)[1]
    Click  ${Loc_ChangeDeviceGroup}
    DOMreadyByWaitTime  2
    Click  ${Loc_DeleteDevices}
    DOMreadyByWaitTime  2
    Click  css=.goog-button.m_inline_block
    DOMreadyByWaitTime  5
    Click  ${Loc_ApplyChangesButtonAP}
    DOMreadyByWaitTime  5
    AssertForElementPresent  ${Loc_SuccessfulMsg}
    Log  MD device deleted!  console=True
    [return]  ${Count}
    
Click Poll and Verify MD
    [Arguments]  ${AOScontroller}  ${devcount}
    DOMreadyByWaitTime  10
    Click PollAOS
    DOMreadyByWaitTime  320
    Select AOS controller  ${AOScontroller}
    DOMreadyByWaitTime  10
    ${Count}  get element count  //*[@title="${AOScontroller}"]/parent::*/preceding-sibling::*[@class="m_checkbox"]/*
    Should be true  ${Count}==${devcount}
    Log  Deleted MD reverted by Polling!  console=True
    
    
    
Check MD status in Monitor Page
    DOMreadyByWaitTime  10
    Element should be visible  ${MDstatus}
   

Check MM role info in Monitor Page
    DOMreadyByWaitTime  10
    Element should be visible  ${Loc_MMrole}
    ${MMrole}  Get element text  ${Loc_MMrole}   
    Should Be Equal As Strings  ${MMrole}  Master

   

Verify MD role in MD monitor page
    [Arguments]   ${AOScontroller}
    DOMreadyByWaitTime  5
    ${Count}  get element count  //*[@title="${AOScontroller}"]/parent::*/preceding-sibling::*/*[@class="read_state"]/*  
    Run keyword if  ${Count}==0  Fail  No Device present!
    Click  (//*[@title="${AOScontroller}"]/parent::*/preceding-sibling::*/*[@class="read_state"]/*)[1]
    Sleep  10s
    Element should be visible  ${Loc_MDrole}
    ${MDrole}  Get element text  ${Loc_MDrole}   
    Should Be Equal As Strings  ${MDrole}  Managed Device
    
Verify Cluster for MD
    [Arguments]  ${AOScontroller}  ${AOSMD1}  ${AOSMD2}
    DOMreadyByWaitTime  5
    ${Count}  get element count  //*[@title="${AOScontroller}"]/parent::*/preceding-sibling::*/*[@class="read_state"]/*  
    Run keyword if  ${Count}==0  Fail  No Device present!
    Click  (//*[@title="${AOScontroller}"]/parent::*/preceding-sibling::*/*[@class="read_state"]/*)[1]
    Sleep  10s
    ${Val}  Set Variable  0
    Navigate To Device ControllerClusters Page
    DOMreadyByWaitTime  5
    Click  ${Loc_Cluster}
    DOMreadyByWaitTime  5
    ${Status1}  Run keyword and return status  element should be visible  //a[contains(text(),'${AOSMD1}')]
    ${Status2}  Run keyword and return status  element should be visible  //a[contains(text(),'${AOSMD2}')]
    Run keyword if  '${Status1}'=='True' or '${Status2}'=='True'  Pass Execution  Cluster For MD verified!
    ...  ELSE  Fail  Cluster for MD not present!
    

Verify Device Events
    DOMreadyByWaitTime  10
    Click  ${Loc_AlertsandEvents}
    DOMreadyByWaitTime  5
    ${count}  get element count  ${Loc_DevicEventData}
    Run Keyword If  ${count}==0  Fail  No Device Events!
    Log  Device Specific Events verified!  console=True
    
Check Events Log
    [Arguments]  ${AOSGroup}
  #  Click  ${Loc_AuditLog}
  Click  ${Loc_EventLog}
    DOMreadyByWaitTime  5
  #  AssertForElementPresent  //*[contains(text(),'${AOSGroup}')]
    Log  MM group verified in event log  console=True
    

*** Keywords ***

Get Master Controller Details To Add
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${AOScontrollerList} =  Data_Provider.GetDataProviderColumnValue  Data_AOScontroller
    ${AOScontroller} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AOScontrollerList}  1
    Set Suite Variable  ${AOScontroller}
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


Get Inventory report details
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
    
Get RF Health report details
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

Get Rogue Containment report details
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


Get Audit report details
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

 Get Device UPtime report details
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
    

Get Discover Device details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${GroupNameList} =  Data_Provider.GetDataProviderColumnValue  Data_Groupname1
    ${GroupName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GroupNameList}  1
    Set Suite Variable  ${GroupName1}
    ${FolderNameList} =  Data_Provider.GetDataProviderColumnValue  Data_FolderName1
  ${FolderName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FolderNameList}  1
  Set Suite Variable  ${FolderName1}
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
    ${SNMPv3AuthProtocolList} =  Data_Provider.GetDataProviderColumnValue  Data_SNMPv3AuthProtocol
    ${SNMPv3AuthProtocol} =  Data_Provider.DataProviderSplitterForMultipleValues  ${SNMPv3AuthProtocolList}  1
    Set Suite Variable  ${SNMPv3AuthProtocol}
    ${NegPrivacyPasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_NegPrivacyPassword
    ${NegPrivacyPassword} =  Data_Provider.DataProviderSplitterForMultipleValues  ${NegPrivacyPasswordList}  1
    Set Suite Variable  ${NegPrivacyPassword}
    ${PosPrivacyPasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_PosPrivacyPassword
    ${PosPrivacyPassword} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PosPrivacyPasswordList}  1
    Set Suite Variable  ${PosPrivacyPassword}
    ${SNMPv3PrivProtocolList} =  Data_Provider.GetDataProviderColumnValue  Data_SNMPv3PrivProtocol
    ${SNMPv3PrivProtocol} =  Data_Provider.DataProviderSplitterForMultipleValues  ${SNMPv3PrivProtocolList}  1
    Set Suite Variable  ${SNMPv3PrivProtocol}    
    ${AOScontrollerList} =  Data_Provider.GetDataProviderColumnValue  Data_AOScontroller
    ${AOScontroller} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AOScontrollerList}  1
    Set Suite Variable  ${AOScontroller}

    

    

*** Variables ***

${FolderName1}
${Networkname}
${IP}
${Mask}
${Type}
${Communitystring}
${Type}
${Title}
${group}
${ReportStart}
${ReportStop}
${Reporttitle}
${DefaultFolderName1}  Top
${GroupName1}
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
${SNMPv3AuthProtocol}
${NegPrivacyPassword}
${SNMPv3PrivProtocol}
${PosPrivacyPassword}