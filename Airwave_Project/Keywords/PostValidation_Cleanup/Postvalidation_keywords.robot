*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Locators/DeviceSetupPages.robot
Resource          ../../Keywords/Device/DeviceSetup_keywords.robot
Resource          ../../Keywords/Database/Database_keywords.robot
Resource          ../../Locators/database.robot
#Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Locators/AMPSetupPage.robot
Resource          ../../Keywords/AMPSetup/AmpSetupKeywords.robot
Resource          ../../Locators/system.robot
Resource          ../../Locators/Postvalidation_Cleanup.robot
Resource          ../../Locators/HomePage.robot
Resource          ../../Locators/RAPIDSPage.robot
Resource          ../../Keywords/RAPIDS/RAPIDSPage.robot
Library           ../../Utilities/Common/WebdriverHelper.py
Resource          ../../Utilities/Data_Provider.robot

*** Keywords ***
### Groups Page ###
Verify Creation of a New Group in Airwave
    [Arguments]  ${GroupsName}
    Navigate To Group Page
    Sleep  5s
    Navigate To Group List Page
    AssertForElementPresent  //tbody//*[contains(text(),'${GroupsName}')]
    Log  ${GroupsName} - Group created retained..!  console=true
    
Verify Creation of a New Folder
    [Arguments]  ${deviceFolder}
    Navigate To Device Page
    Navigate To Device List Page
    AssertForElementPresent  //*[@name="jump_off"]/*[contains(text(),'${deviceFolder}')]
    Log  ${deviceFolder}- Folder created retained..!  console=true
    
Verify Creation of a Sub Folder
    [Arguments]   ${FoldersName}  ${FoldersName1}
    Navigate To Device Page
    Navigate To Device List Page
    Click  //*[@name="jump_off"]
    DOMreadyByWaitTime  3
    AssertForElementPresent  //*[@name="jump_off"]/*[contains(text(),'${FoldersName}')]/following-sibling::*[contains(text(),'${FoldersName1}')]
    Log  ${FoldersName1}- Sub Folder created retained..!  console=true

Create a New Group with Status Polling after upgrade
    [Arguments]   ${GroupsName1}  ${StatusPolling}
    WaitForElementPresent  ${Loc_AddGroupButton_css1}
    Click  ${Loc_AddGroupButton_css1}
    WaitForElementPresent  ${Loc_AddGroupNameField_css1}
    Type Text  ${Loc_AddGroupNameField_css1}   ${GroupsName1}
    Click  ${Loc_AddGroupAddButton_css1}
    Sleep  5s
    Scroll element into view  ${polling_css}
    Select Dropdown LabelValue  ${polling_css}  ${time_interval}
    Click  ${savebutton_css}
    Scroll element into view  ${Applybutton_css}
    Click  ${Applybutton_css}
    
Compare 2 Groups after upgrade
    [Arguments]  ${GroupsName1}  ${Pollingtime}  ${Groupname2}
    Navigate To Group Page
    Click  ${compareclick_link}
    Select Dropdown LabelValue  ${cmp_grp1}  ${GroupsName1}
    Sleep  3s
    Select Dropdown LabelValue  ${cmp_grp2}  ${Groupname2}
    Click  ${Comparebutton}
    Sleep  10s
    @{list}  Create List  ${time1}  ${time2}
    ${state}  Set Variable  True
    @{search_result}    Get WebElements    ${polling_period}
    :FOR  ${var1}  IN  @{search_result}
    \    log  ${var1.text}  console=True        
    \    ${status}=  Run Keyword And Return Status  List Should Contain Value  ${list}  ${var1.text}
    \    Log  ${status}  console=True
    \    ${state}  Set Variable If  '${Status}'=='False'  False  ${state}
        
    #      \
    Should be true  ${state} 
    Log  ${GroupsName1}-${Groupname2} Compared successfully!  console=True
    
Verify Added New Device
    [Arguments]  ${DeviceName}  ${deviceIPAddress}
    Navigate to Home Page
    Click  ${Loc_icon_search}
    Type  ${Loc_search_input_xpath}  ${deviceIPAddress}
    Click  ${Loc_searchPopup}
    DOMreadyByWaitTime  5
    Click  //*[@id="switches_button"]
    Sleep  5    
    ${count}  get element count  //*[text()='${deviceIPAddress}']//following-sibling::*[contains(text(),'Up')]
    Run keyword if  ${count}==0  Click  ${Loc_close_button}
    Run keyword if  ${count}==0  Fail  Added device not found in ${deviceIPAddress}!
    AssertForElementPresent  //*[text()='${deviceIPAddress}']//following-sibling::*[contains(text(),'Up')]
    DOMreadyByWaitTime  3
    Click  ${Loc_close_button}
    DOMreadyByWaitTime  5
    Log  Newly added device in ${deviceIPAddress} retained!  console=True

    
    
    

### Visual RF ###
Verify for Enable VisualRF after upgrade
    DOMreadyByWaitTime  3
    Radio button should be set to  ${Loc_VRFenableName}  ${Loc_VRFenablevalue}
    Log  VisualRF enabled!  console=True
    
Navigate to floor page
    [Arguments]  ${CampusName}
    ${SelectCampus}  Catenate  ${Loc_SelectCampus_xpath}  text()='${CampusName}']
    Double Click  ${SelectCampus}
    Sleep  5s
    Click  ${Loc_ViewButton}
    sleep  3s
    Click  ${Loc_SelectBuilding}/*[text()='${CampusName}']
    sleep  3s
    Click  ${Loc_ViewButton}
    sleep  3s
    Click  //*[text()='Floors']/following-sibling::*/*//*[@class="vrf_link vrf_input fake_link"]
    Sleep  3s
    Click  ${Loc_ViewButton}
    sleep  3s
    
    

Verify Creation of Campus
    [Arguments]  ${CampusName}
    
    ${SelectCampus}  Catenate  ${Loc_SelectCampus_xpath}  text()='${CampusName}']
    AssertForElementPresent  ${SelectCampus}
    Log  Campus - ${CampusName} Verified successful!  console=True
    
Verify Creation of Buidling
    [Arguments]  ${CampusName}
    ${SelectCampus}  Catenate  ${Loc_SelectCampus_xpath}  text()='${CampusName}']
    Double Click  ${SelectCampus}
    Sleep  5s
    Click  ${Loc_ViewButton}
    sleep  3s
    AssertForElementPresent  ${Loc_SelectBuilding}/*[text()='${CampusName}']
    Log  Building - ${CampusName} verified!  console=True
    
Check for AP Overlays Present after upgrade
     @{list}  Create List  ${col1}  ${col2}  ${col3}  ${col4}  ${col5}  ${col6}
     ${state}  Set Variable  True
     @{search_result}    Get WebElements    ${sidenav_menu}
    :FOR  ${var1}  IN  @{search_result}
    \    log  ${var1.text}  console=True
     \    ${status}=  Run Keyword And Return Status  List Should Contain Value  ${list}  ${var1.text}
    \    Log  ${status}  console=True
    \    ${state}  Set Variable If  '${Status}'=='False'  False  ${state}
    Should be true  ${state} 
    
    
Check for the elements present in AP Overlays after upgrade
     @{list}  Create List  ${Attr1}  ${Attr2}  ${Attr3}  ${Attr4}  ${Attr5}  
    ${state}  Set Variable  True
    @{search_result1}    Get WebElements    ${sidenav_menu1}
    :FOR  ${var1}  IN  @{search_result1}
    \    ${search_result2}    Split String  ${var1.text}  \n
    \    log  ${search_result2}  
    Should be true  ${state} 

    

### Client Monitoring ###
Check Device Status of controller after upgrade
    [Arguments]  ${IP}
    ${count}  get element count  //*[@title='${IP}']/following-sibling::*[text()='Up']
    Run keyword if  ${count}==0  Click  ${Loc_close_button}
    Run keyword if  ${count}==0  Fail  Added UP status controller not found in ${IP} !
    AssertForElementPresent  //*[@title='${IP}']/following-sibling::*[text()='Up']
    DOMreadyByWaitTime  3
    Click  ${Loc_close_button}
    DOMreadyByWaitTime  5
    Log  Controller device status for ${IP} retained!  console=True

### database case ###
Check on events log after upgrade
    AssertForElementPresent  ${Loc_SystemEventLog}
    Log  EventsLog verified!  console=True
    
Check last event in CLI and AMP after upgrade
    [Arguments]  ${host}  ${user}  ${pwd}
    @{loginInfo}  Get Current Login Info  ${host}  ${user}  ${pwd}
    ${CLImonth}  Set variable  @{loginInfo}[0]
    ${CLIday}  Set variable  @{loginInfo}[1]
    ${CLItime}  Set variable  @{loginInfo}[2]
    ${CLIlogin}  Catenate  ${CLImonth}  ${CLIday}
   # Log  CLI Login: ${CLIlogin}  console=True
    ${AMPlogin}  Catenate  SEPARATOR=  //td[contains(text(),'${CLItime}')]  ${Loc_Eventlogin}  [contains(normalize-space(.),'${CLIlogin}')]
   
    Navigate To Systems Page
    Navigate To Systems Event Log Page
    AssertForElementPresent  ${AMPlogin}
    Set Global Variable  ${AMPlogin}
    ${AMP}  get element text  ${AMPlogin}
    Set Global variable  ${AMP}
    Log  AMP Login: ${AMP}  console=True
    Log  Last event login info verified  console=True
   # Get Values from Pre-upgrade  Preupgrade
   # Navigate To Systems Page
   # Navigate To Systems Event Log Page
  #  ${AMPloginafterupgrade}  Catenate  SEPARATOR=  ${Loc_Eventlogin}  [contains(text(),'${CLIloginpreUpgrade}')]
  #  ${AMP1}  get element text  ${AMPloginafterupgrade}
  #  AssertForElementPresent  ${AMPloginafterupgrade}
  #  Log  AMP Login before upgrade: ${AMP1}  console=True
  #  Log  Last event login info before upgrade verified  console=True
    
Rogue count in DB after upgrade
    [Arguments]  ${cli_roguecount_pv}
    log  CLI rogue count after upgrade: ${cli_roguecount_pv}  console=True
   # log  CLI rogue count before upgrade: ${cli_roguecount}  console=True
  #  Should be true  '${cli_roguecount_pv}' == '${cli_roguecount}'
 
Aggregate session count in DB after upgrade
    [Arguments]  ${cli_sessioncount_pv}
    log  CLI session count after upgrade: ${cli_sessioncount_pv}  console=True
  #  log  CLI session count before upgrade: ${cli_sessioncount}  console=True
  #  Should be true  '${cli_sessioncount_pv}' == '${cli_sessioncount}'
    
User count in DB after upgrade
    [Arguments]  ${cli_usercount_pv} 
    log  CLI User count after upgrade: ${cli_usercount_pv}  console=True
  #  log  CLI User count before upgrade: ${cli_usercount}  console=True
  #  Should be true  '${cli_usercount_pv}' == '${cli_usercount}'
    
AP count in DB after upgrade
    [Arguments]  ${cli_APcount_pv}
    log  CLI AP count after upgrade: ${cli_APcount_pv}  console=True
   # log  CLI AP count before upgrade: ${cli_APcount}  console=True
  #  Should be true  '${cli_APcount_pv}' == '${cli_APcount}'
    
    
    

    
    


### Alerts Page ###
verify the Generated specific Alarm
    [Arguments]  ${type}  ${severity}  ${value}
    Navigate To Systems Page
    Navigate To Systems Alerts Page
    AssertForElementPresent  //*[text()='${type}']/following-sibling::*[contains(text(),'${value}')]/parent::*/*/following-sibling::*/*[text()='${severity}']
    Log  Alerts ${type} - ${severity} verified!  console=True
    

### Reports Page ###
Verify Generated Report after upgrade
    [Arguments]  ${Reporttitle}
    Type  ${Loc_ReportSearch}  ${Reporttitle}
    Press Keys  None  RETURN
    DOMreadyByWaitTime  3
    AssertForElementPresent  //*[contains(text(),'${Reporttitle}')]
    Log  ${Reporttitle} - Report Verified after upgrade!  console=True
    

### Rapids Page ###
Check for Rogue data after upgrade
    WaitForElementPresent  ${Loc_Rogue_piechart}
    ${count}  Get Elements Count  ${Loc_Rogue_piechart}
    Should be true  '${count}'!='0'
    Log  Rogue pie-chart data verified!  console=True
    
Check for Rogue List after upgrade
    Get Values from Pre-upgrade  Preupgrade
    AssertForElementPresent  ${Loc_roguelist_xpath}
    WaitForElementPresent  ${Loc_roguelist_xpath}
    ${text}  Get Element Text  ${Loc_roguelist_xpath}
    ${fst}  ${lst}  split string  ${text}  :
    ${count}  remove string  ${lst}  ]
    ${count}  strip string  ${count}
    log  AMP rogue count after upgrade: ${count}  console=True
    log  AMP rogue count before upgrade: ${AMProguecountPreUpgrade}  console=True
  #  Should be true  '${count}'=='${AMProguecountPreUpgrade}'
    
Verify Change ARP IP Match Timeout after upgrade
    [arguments]  ${val}
    ${value}  Get Value  ${Loc_ARPIPMatch}
    Should be true  '${value}'=='${val}'
    
Verify new rule after upgrade
    [arguments]  ${Rulename}
    AssertForElementPresent  ${Loc_signalstrength}
    Log  signal strength disabled retained  console=True
    AssertforElementPresent  //*[text()='${Rulename}']
    Log  Created rule - ${Rulename} retained  console=True
    DOMreadyByWaitTime  3
    Navigate To RAPIDS List Page
    DOMreadyByWaitTime  5
    AssertForElementPresent  //*[@title="${Rulename}"]
    Log  rule priority retained  console=True
    
    

    
      

    

### Performance Cases ###
Check for CPU data after upgrade
    AssertForElementPresent  ${system_CPU}
    ${title}  Get Element Text  ${system_CPU}
    log  ${title}  console=true
    
Check for Memory after upgrade
    AssertForElementPresent  ${system_memory}
    ${title}  Get Element Text  ${system_memory}
    log  ${title}  console=true

Check for Disk after upgrade
    WaitForElementPresent  ${diskspace_xpath}
    Scroll element into View  ${diskspace_xpath}
    ${count}  Get Elements Count  ${diskspace_xpath}
    Should be true  '${count}'!='0'
    Log  Disk data verified!  console=True
    
Check for I/O Usage after upgrade
    #Check System memory usage
    Check usage after upgrade  ${sys_mem_usageheading}  ${sys_mem_usagegraph}
    #Check System swap usage
    Check usage after upgrade  ${sys_swap_usageheading}  ${sys_swap_usagegraph}
    #Check System network usage
    Check usage after upgrade  ${sys_network_usageheading}  ${sys_network_usagegraph}
    #Check usage by protocol
    Check usage after upgrade  ${protocol_usageheading}  ${protocol_usagegraph}
    #Check total disk usage 
    Check usage after upgrade  ${tot_disk_usageheading}  ${tot_disk_usagegraph}
    
Check usage after upgrade
    [Arguments]  ${heading}  ${graph}
    WaitForElementPresent  ${heading}
    ${title}  Get Element Text  ${heading}
    WaitForElementPresent  ${graph}
    scroll element into view  ${graph}
    ${count}  Get Elements Count  ${graph}
    Should be true  '${count}'!='0'
    Log  ${title} data verified!  console=True
    
Check AMON RabbitMq and Redis Statistics after upgrade
    #AMON Statistics
    Check statistics graph after upgrade  ${AMON_stat_heading}  ${AMON_graph}
    #RabbitMQ Statistics
    Check statistics graph after upgrade  ${RabbitMQ_stat_heading}  ${RabbitMQ_graph}
    #Redis Statistics
    Check statistics graph after upgrade  ${Redis_stat_heading}  ${Redis_graph}
    
Check statistics graph after upgrade
    [Arguments]  ${heading}  ${graph_xpath}
    WaitForElementPresent  ${heading}
    ${Stat_title}  Get Element Text  ${heading}
    ${graphcount}  Get Elements Count  ${graph_xpath}
    :FOR  ${i}  IN RANGE  1  ${graphcount}+1
    \    ${graph_title}  Get Element Text  (${graph_xpath})[${i}]//*[@class="title_heading"]
    \    scroll element into view  (${graph_xpath})[${i}]//a/*
    \    ${count}  Get Elements Count  (${graph_xpath})[${i}]//a/*
    \    Should be true  '${count}'!='0'
    \    log  ${graph_title}  console=True
    Log  ${Stat_title} verified!  console=True
    
Check Database Statistics after upgrade
    ### Database Table verification ###
    ${Stat_title}  Get Element Text  ${Database_stat_heading}
    WaitForElementPresent  ${Database_table_head}
    ${table_title}  Get Element Text  ${Database_table_head}
    Scroll element into View  ${Database_table}
    ${table_count}  Get Elements Count  ${Database_table}
    Should be true  '${table_count}'!='0'
    Log  ${table_title}  console=True
    ### Database Graph verification ###
    ${graphcount}  Get Elements Count  ${Database_graph_head}
    :FOR  ${i}  IN RANGE  1  ${graphcount}+1
    \    ${graph_title}  Get Element Text  (${Database_graph_head})[${i}]
    \    scroll element into view  (${Database_graph})[${i}]
    \    ${count}  Get Elements Count  (${Database_graph})[${i}]
    \    Should be true  '${count}'!='0'
    \    log  ${graph_title}  console=True
    Log  ${Stat_title} verified!  console=True

### DeviceSetup Page ###
Verify Certificate after upgrade
    [Arguments]  ${name}  ${Type}
    AssertForElementPresent  //*[text()='${name}']/parent::*/following-sibling::*[text()='${Type}']
    Log  ${Type} certificate verified successfully!  console=True


    
Verify Username after upgrade
    [Arguments]  ${Username}  ${Dev_Type}
    Select Dropdown LabelValue  ${Loc_AddDeviceType}  ${Dev_Type}
    Click  ${Loc_AddDevice}
    ${confirm_Username}  Get Value  ${Loc_Username}
    Should Be Equal As Strings  ${confirm_Username}  ${Username}
    
Check configuration for postvalidation
    [Arguments]  ${ip}
    Click  ${Loc_icon_search}
    Type  ${Loc_search_input_xpath}  ${ip}
    Click  ${Loc_searchPopup}
    sleep  5s
    Click  //*[@id="switches_button"]
    Sleep  5
    ${count}  get element count  //*[@title='${ip}']/preceding-sibling::td
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
    Wait until keyword succeeds  5 min  1 min  Check good status for postvalidation
    Log  Audit configuration for ${deviceIPAddress} verified!  console=True

Check good status for postvalidation
    Reload page
    sleep  20s
    AssertForElementPresent  ${Loc_Good_config_status}

### Home Page ###
Verify Clients Data after upgrade
    Page should contain element  ${Loc_HomepageClients}
    
Verify Folder Overview Data after upgrade
    Page should contain element   ${Loc_HomepageFolderQverView}

Verify Alert Summary after upgrade
    Page should contain element   ${Loc_HomePageAlert}

Verify Quick Links after upgrade
    Page should contain element   ${Loc_HomePage_QuickLink}

Verify Monitoring Status after upgrade
    Page should contain element   ${Loc_HomepageMonitoring}

Check for topology after upgrade
    DOMreadyByWaitTime  3
    Wait Until Element Is Not Visible  ${loader}  30s
    AssertForElementPresent  ${Loc_Topology_graph}
    Log  Topology Present!  console=True
    
Check View and Filter options after upgrade
    Get Selected view layout option after upgrade
    Get Selected Filter options after upgrade
    
Get Selected view layout option after upgrade
    Click  ${Loc_View_xpath}
    DOMreadyByWaitTime  3
    ${Selectedlayout}  get text  ${Loc_LayoutSelected}
    Log  ${Selectedlayout} Layout selected  console=true
    
Get Selected Filter options after upgrade
    Click  ${Loc_Filter_xpath}
    DOMreadyByWaitTime  3
    @{filterdevices}  create list
    @{devicesList}  Get WebElements  //*[@class="task action ng-scope selected"]/*/*
    :FOR  ${dev}  IN  @{devicesList}
    \    ${device}  Get Element Text  ${dev}
    \    Append to List  ${filterdevices}  ${device}
    \    Log  ${device}  console=True
    Log  Filter options selected!  console=True

### AMPsetup page ###
Verify Customization of Top Header
    AssertForElementPresent  ${Loc_VPNusers_header}
    Navigate To AMP Setup Page
    Log  Top Header verified!  console=True
    
Verify customization of Firmware Upgrade/Reboot Options
    Click  ${Loc_FirmwareReboot}
    DOMreadyByWaitTime  3
    Radio button should be set to  ${Loc_pv_rebootRadiobutton}  ${Loc_pv_Rebootbutton_value}
    Navigate To AMP Setup Page
    Log  Firmware Upgrade/Reboot Options verified!  console=True
    
verify Customization for Automatic Authorization
    Click  ${Loc_AutomaticAuthorization}
    DOMreadyByWaitTime  3
    Radio button should be set to  ${Loc_pv_InstantAPWhitelist_radiobutton}  ${Loc_pv_InstantAP_value}
    Radio button should be set to  ${Loc_pv_arubaswitchRadiobutton}  ${Loc_pv_arubaswitch_value}
    Navigate To AMP Setup Page
    Log  Automatic Authorization verified!  console=True
    
verify Customization for Additional AMP services
    Click  ${Loc_AdditionalSettings}
    DOMreadyByWaitTime  3
    Radio button should be set to  ${Loc_AMONvsSNMPpoll_grpname}  ${Loc_AMONvsSNMP_value}
    Navigate To AMP Setup Page
    Log  Additional AMP services verified!  console=True
    
Verify Customization Performance
    Click  ${Loc_Performance}
    DOMreadyByWaitTime  3
    ${value}  Get Value  ${Loc_ClientRelevanceFactor}
    ${value}  convert to integer  ${value}
    Log  ${value}  console=True
    Should be true  '${value}'>'0' and '${value}'<='60'
    Navigate To AMP Setup Page
    Log  Performance verified!  console=True
    
Verify Device Manage Page after upgrade
    Click  ${Loc_FirmwareReboot}
    DOMreadyByWaitTime  3
    Click  ${Loc_FirmwareRadioButton}
    Click  ${Loc_Save}
    DOMreadyByWaitTime  3
    Navigate To Device Page
    Navigate to Device Manage page after upgrade
    AssertForElementPresent  ${Device_info}
    Navigate To AMP Setup Page
    Log  Device Manage page verified!  console=True
    
Navigate to Device Manage page after upgrade
    Click  ${Loc_icon_search}
    Type  ${Loc_search_input_xpath}  ${Loc_searchinput_value}
    Click  ${Loc_searchPopup}
    sleep  5s
    ${count}  Get element count  ${UpStatus_Devices}
    Run keyword if  ${count}==0  Click  ${Loc_close_button}
    Run keyword if  ${count}==0  Fail  No devices found!
    Click  ${UpStatus_Devices}
    Wait Until Element Is Visible  ${Device_manage_xpath}  30s
    Sleep  3s
    Click  ${Device_manage_xpath}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Client Detail Page after upgrade
    Click  ${Loc_icon_search}
    Type  ${Loc_search_input_xpath}  ${Loc_searchinput_value}
    Click  ${Loc_searchPopup}
    sleep  5s
    Click  ${Loc_Clients}
    sleep  5s
    ${count}  Get element count  ${Loc_SelectClient}
    Run keyword if  ${count}==0  Click  ${Loc_close_button}
    Run keyword if  ${count}==0  Fail  No devices found!
    Set focus to element  ${Loc_SelectClient}
    sleep  5s
    Click  ${Loc_SelectClient}
    sleep  3s
    Wait Until Element Is Not Visible  ${loader}  30s
    Wait Until Element Is Visible  ${Loc_Client_detail}  30s
    Sleep  3s
    Click  ${Loc_Client_detail}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Check UCC Data after upgrade
    AssertForElementPresent  ${Loc_UCC_Calls}
    Log  Ucc Calls Data verified!  console=True
    
    
Check Clarity Data after upgrade
    AssertForElementPresent  ${Loc_Clarity_data}
    Log  Clarity Data verified!  console=True
    
Navigate To Client Diagnostics Page after upgrade
    Navigate To Clients Connected Page
    ${n}  set variable  5
    Wait Until Element Is Not Visible  ${loader}  30s
    DOMreadyByWaitTime  20
    ${MAC_count}  Get Element Count  ${Loc_MAC_Address}
    Run Keyword If  '${MAC_count}'=='0'  Fail  No Clients!
    ${range}  Run Keyword If  ${MAC_count}<5  Set variable  ${MAC_count}
    ...  ELSE  Set variable  ${n}
    :FOR  ${i}  IN RANGE  1  ${range}+1
    \    ${Value}  Set Variable  0
    \    Navigate To Clients Connected Page
    \    DOMreadyByWaitTime  10
    \    Set focus to element  (${Loc_MAC_Address})[${i}]
    \    sleep  5s
    \    Click  (${Loc_MAC_Address})[${i}]
    \    DOMreadyByWaitTime  3
    \    ${Data}  Get element count  ${Loc_Error_noData}
    \    Continue For Loop If  '${Data}'>'0'
    \    ${chart}  Check Charts in diagnostic page
    \    ${ucc}  Check UCC in diagnostic page
    \    ${clarity}  Check Clarity in diagnostic page
    \    ${TA}  Check Traffic Analysis in diagnostic page
    \    ${Verify}  Evaluate  ${chart}+${ucc}+${clarity}+${TA}
    \    Exit For Loop If  '${Verify}' == '4'
    Log  Charts,UCC,Clarity and Traffic Analysis verified in diagnostic page!  console=True
    
    
Verify the client Connected page after upgrade
    Click  //*[@name="jump_off"]
    Click  //option[contains(text(),'Clients')][1]
    Wait Until Element Is Visible  ${Loc_ClientConected}  30s

    

### Discover devices in Device setup ###
Verify device with eval license
    [Arguments]  ${added_network}
    AssertForElementPresent  ${Loc_pv_addNetwork}//td[contains(.,'${added_network}')]
    AssertForElementPresent  ${Loc_pv_addCredential}//td[contains(.,'${added_network}')]
    AssertForElementPresent  ${Loc_pv_addScanset}//td[contains(.,'${added_network}')]
    Log  Device with eval license - ${added_network} verified!  console=True

Verify device with permanent license
    [Arguments]  ${added_network}
    AssertForElementPresent  ${Loc_pv_addNetwork}//td[contains(.,'${added_network}')]
    AssertForElementPresent  ${Loc_pv_addCredential}//td[contains(.,'${added_network}')]
    AssertForElementPresent  ${Loc_pv_addScanset}//td[contains(.,'${added_network}')]
    Log  Device with permanent license - ${added_network} verified!  console=True

Verify Network Scan
    [Arguments]  ${added_network}
    AssertForElementPresent  ${Loc_pv_addNetwork}//td[contains(.,'${added_network}')]
    AssertForElementPresent  ${Loc_pv_addCredential}//td[contains(.,'${added_network}')]
    AssertForElementPresent  ${Loc_pv_addScanset}//td[contains(.,'${added_network}')]
    Log  Network scan device - ${added_network} verified!  console=True
    
*** Keywords ***
Get network details for postvalidation
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${evalNetworknameList} =  Data_Provider.GetDataProviderColumnValue  Data_evalNetworkname
    ${evalNetworkname} =  Data_Provider.DataProviderSplitterForMultipleValues  ${evalNetworknameList}  1
    Set Suite Variable  ${evalNetworkname}
    ${permanentNetworknameList} =  Data_Provider.GetDataProviderColumnValue  Data_permanentNetworkname
    ${permanentNetworkname} =  Data_Provider.DataProviderSplitterForMultipleValues  ${permanentNetworknameList}  1
    Set Suite Variable  ${permanentNetworkname}
    ${scanNetworknameList} =  Data_Provider.GetDataProviderColumnValue  Data_scanNetworkname
    ${scanNetworkname} =  Data_Provider.DataProviderSplitterForMultipleValues  ${scanNetworknameList}  1
    Set Suite Variable  ${scanNetworkname}
    
    
Get default device credentials
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${Comm_UsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_CommUsername
    ${Comm_Username} =  Data_Provider.DataProviderSplitterForMultipleValues  ${Comm_UsernameList}  1
    Set Suite Variable  ${Comm_Username}
    ${Comm_DevTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_CommDevType
    ${Comm_DevType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${Comm_DevTypeList}  1
    Set Suite Variable  ${Comm_DevType}
    ${Comm_TestUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_CommTestUsername
    ${Comm_TestUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${Comm_TestUsernameList}  1
    Set Suite Variable  ${Comm_TestUsername}
    
Get Certificate details for postvalidation
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${TrustedCertNameList} =  Data_Provider.GetDataProviderColumnValue  Data_TrustedCertName
    ${TrustedCertName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TrustedCertNameList}  1
    Set Suite Variable  ${TrustedCertName}
    ${IntermediateCertNameList} =  Data_Provider.GetDataProviderColumnValue  Data_IntermediateCertName
    ${IntermediateCertName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${IntermediateCertNameList}  1
    Set Suite Variable  ${IntermediateCertName}
    ${MultiIntermediateCertNameList} =  Data_Provider.GetDataProviderColumnValue  Data_MultiIntermediateCertName
    ${MultiIntermediateCertName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${MultiIntermediateCertNameList}  1
    Set Suite Variable  ${MultiIntermediateCertName}
    
    ${TrustedTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_TrustedType
    ${TrustedType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TrustedTypeList}  1
    Set Suite Variable  ${TrustedType}
    ${IntermediateTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_IntermediateType
    ${IntermediateType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${IntermediateTypeList}  1
    Set Suite Variable  ${IntermediateType}
    ${MultiIntermediateTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_MultiIntermediateType
    ${MultiIntermediateType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${MultiIntermediateTypeList}  1
    Set Suite Variable  ${MultiIntermediateType}
    
Login Data Setup for post Validation
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${UserNameList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginUsername
  ${LoginUserName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UserNameList}  1
  Set Suite Variable  ${LoginUserName1}
  ${LoginUserName2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UserNameList}  2
  Set Suite Variable  ${LoginUserName2}
  ${PasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginPassword
  ${LoginPassword1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  1
  Set Suite Variable  ${LoginPassword1}    
  ${LoginPassword2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  2
  Set Suite Variable  ${LoginPassword2}
  
Get IP for configuration status for postvalidation
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${GrpIpList} =  Data_Provider.GetDataProviderColumnValue  Data_AuditGroupIP
    ${Audit_GrpIP} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GrpIpList}  1
    Set Suite Variable  ${Audit_GrpIP}
    
Rapids Classification Setup for postvalidation
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${ValueList} =  Data_Provider.GetDataProviderColumnValue  Data_ValuePv
  ${ValuePv} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ValueList}  1
  Set Suite Variable  ${ValuePv}
  ${RulenameList} =  Data_Provider.GetDataProviderColumnValue  Data_Rulename
  ${Rulename} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RulenameList}  1
  Set Suite Variable  ${Rulename}
  ${ValueCleanList} =  Data_Provider.GetDataProviderColumnValue  Data_ValueClean
  ${ValueClean} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ValueCleanList}  1
  Set Suite Variable  ${ValueClean}
  
Get Generated report details for postvalidation
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${ReporttitleList} =  Data_Provider.GetDataProviderColumnValue  Data_ReportTitle
    ${Reporttitle} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReporttitleList}  1
    Set Suite Variable  ${Reporttitle}
    ${TypeList} =  Data_Provider.GetDataProviderColumnValue  Data_Type
    ${ReportType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TypeList}  1
    Set Suite Variable  ${ReportType}
    
Alerts Data Setup for postvalidation
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${TriggerTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_TriggerType
  ${TriggerList} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TriggerTypeList}  1
  Set Suite Variable  ${TriggerList}
  ${SeverityValueList} =  Data_Provider.GetDataProviderColumnValue  Data_SeverityValue
  ${SeverityValue} =  Data_Provider.DataProviderSplitterForMultipleValues  ${SeverityValueList}  1
  Set Suite Variable  ${SeverityValue}
  ${ValueList} =  Data_Provider.GetDataProviderColumnValue  Data_InputValue
  ${InputValue} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ValueList}  1
  Set Suite Variable  ${InputValue}

Get CLI data for postvalidation
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${CLIHostnameList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIHostname
  ${CLIHostname} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIHostnameList}  1
  Set Suite Variable  ${CLIHostname}
  ${CLIUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIUsername
  ${CLIUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIUsernameList}  1
  Set Suite Variable  ${CLIUsername}
  ${CLIPasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIPassword
  ${CLIPassword} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIPasswordList}  1
  Set Suite Variable  ${CLIPassword}
  ${DBcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_DBcmd
  ${DBcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DBcmdList}  1
  Set Suite Variable  ${DBcmd}
  ${RogueCLIcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_RogueCLIcmd
  ${RogueCLIcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RogueCLIcmdList}  1
  Set Suite Variable  ${RogueCLIcmd}
  ${sessionCLIcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_sessionCLIcmd
  ${sessionCLIcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${sessionCLIcmdList}  1
  Set Suite Variable  ${sessionCLIcmd}
  ${APuserCLIcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_APuserCLIcmd
  ${userCLIcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${APuserCLIcmdList}  1
  Set Suite Variable  ${userCLIcmd}
  ${APuserCLIcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_APuserCLIcmd
  ${APCLIcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${APuserCLIcmdList}  2
  Set Suite Variable  ${APCLIcmd}
  
Get controller details for Post validation
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${ControllerIPList} =  Data_Provider.GetDataProviderColumnValue  Data_ControllerIP
    ${Controller_IP} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ControllerIPList}  1
    Set Suite Variable  ${Controller_IP}
    
    
VRF Data Setup for PostValidation
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${CampusNameList} =  Data_Provider.GetDataProviderColumnValue  Data_CampusName
  ${CampusName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CampusNameList}  1
  Set Suite Variable  ${CampusName}
  ${CleanCampusNameList} =  Data_Provider.GetDataProviderColumnValue  Data_CleanCampusName
  ${CleanCampusName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CleanCampusNameList}  1
  Set Suite Variable  ${CleanCampusName}
  
VRF Data Setup for Cleanup
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${CleanupCampusNameList} =  Data_Provider.GetDataProviderColumnValue  Data_CleanupCampusName
  ${CleanupCampusName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CleanupCampusNameList}  1
  Set Suite Variable  ${CleanupCampusName}
  
Groups Data Setup for PostValidation
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${GroupNameList} =  Data_Provider.GetDataProviderColumnValue  Data_Groupname
  ${GroupsName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GroupNameList}  1
  Set Suite Variable  ${GroupsName}
  ${FolderNameList} =  Data_Provider.GetDataProviderColumnValue  Data_FoldersName
  ${FoldersName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FolderNameList}  1
  Set Suite Variable  ${FoldersName}
  ${FolderNameList1} =  Data_Provider.GetDataProviderColumnValue  Data_FoldersName1
  ${FoldersName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FolderNameList1}  1
  Set Suite Variable  ${FoldersName1} 
  ${GroupNameList1} =  Data_Provider.GetDataProviderColumnValue  Data_GroupsName1
  ${GroupsName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GroupNameList1}  1
  Set Suite Variable  ${GroupsName1}
  ${PollingList} =  Data_Provider.GetDataProviderColumnValue  Data_StatusPolling
  ${Pollingtime} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PollingList}  1
  Set Suite Variable  ${Pollingtime}
  ${GroupNameList1} =  Data_Provider.GetDataProviderColumnValue  Data_Groupname2
  ${Groupname2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GroupNameList1}  1
  Set Suite Variable  ${Groupname2}
  ${DeviceNameList} =  Data_Provider.GetDataProviderColumnValue  Data_Devicename
  ${DeviceName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceNameList}  1
  Set Suite Variable  ${DeviceName}  
  ${DeviceGroupList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceGroup
  ${DeviceGroup} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceGroupList}  1
  Set Suite Variable  ${DeviceGroup}    
  ${DeviceFolderList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceFolder
  ${DeviceFolder} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceFolderList}  1
  Set Suite Variable  ${DeviceFolder}
  ${DeviceIPAddressList} =  Data_Provider.GetDataProviderColumnValue  Data_deviceIPAddress
  ${deviceIPAddress} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceIPAddressList}  1
  Set Suite Variable  ${deviceIPAddress}
  

Get Values from Pre-upgrade
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${AMProguecountPreUpgradeList} =  Data_Provider.GetDataProviderColumnValue  Data_AMProguecountPreUpgrade
  ${AMProguecountPreUpgrade} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AMProguecountPreUpgradeList}  1
  Set Suite Variable  ${AMProguecountPreUpgrade}
    ${CLIloginpreUpgradeList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIloginpreUpgrade
  ${CLIloginpreUpgrade} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIloginpreUpgradeList}  1
  Set Suite Variable  ${CLIloginpreUpgrade}
   
*** Variables ***
### device setup ###
${evalNetworkname}
${permanentNetworkname}
${scanNetworkname}
${Comm_DevType}
${Comm_TestUsername}
${Comm_Username}
${TrustedCertName}
${IntermediateCertName}
${MultiIntermediateCertName}
${TrustedType}
${IntermediateType}
${MultiIntermediateType}
### Login page ###
${LoginUserName1}
${LoginUserName2}
${LoginPassword1}
${LoginPassword2}
### audit configuration ###
${Audit_GrpIP}
### Rapids ###
${ValuePv}
${Rulename}
${ValueClean}

### Reports ###
${Reporttitle}
${ReportType}
### Alerts ###
${TriggerList}
${SeverityValue}
${InputValue}  10
### database ###
${CLIHostname}
${CLIUsername}
${CLIPassword}
${DBcmd}
${RogueCLIcmd}
${sessionCLIcmd}
${userCLIcmd}
${APCLIcmd}
### Client Monitoring ###
${Controller_IP}


### VRF ###
${CampusName}
${CleanCampusName}
${CleanupCampusName}

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

### Preupgrade ###
${AMProguecountPreUpgrade}
${CLIloginpreUpgrade}




