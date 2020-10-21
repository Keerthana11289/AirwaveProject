*** Settings ***
Documentation     Page/feature library for Login
...    
#Suite Setup       Login And Verify
#Suite Teardown    LogoutAW
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Locators/DeviceSetupPages.robot
Resource          ../../Keywords/Device/DeviceSetup_keywords.robot
Library           ../../Utilities/Common/WebdriverHelper.py
#Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Locators/Postvalidation_Cleanup.robot
Resource          ../../Keywords/PostValidation_Cleanup/Postvalidation_keywords.robot
Resource          ../../Locators/HomePage.robot
Resource          ../../Locators/AMPSetupPage.robot
Resource          ../../Utilities/Data_Provider.robot
Resource          ../../Keywords/APMonitoringPage/APMonitoringPage.robot
Resource          ../../Keywords/Database/Database_keywords.robot
Resource          ../../Locators/database.robot


*** Test Cases ***



### Validate Login Page ###
PostValidation for TestLoginNegative
    [Documentation]  Here Getting the test data from 'LoginValidate' sheet - "TestLoginNegative" Test case column name. 
    [Tags]  Case1
    Login Data Setup for post Validation   Login Credential  
    Login To AMP page  ${LoginUserName1}  ${LoginPassword1} 
    Login To AMP page successful for Airwave  ${LoginUserName2}  ${LoginPassword2} 
    

    
    



    
### Discover devices in Device setup ###
PostValidation for Discover devices with eval license
    [Documentation]  Make sure device with eval license is retained
    [Tags]  Case1
    Navigate To Device Setup Page
    Get network details for postvalidation  Device discovery
    Verify device with eval license  ${evalNetworkname}
    
PostValidation for Discover devices with permanent license
    [Documentation]  Make sure device with permanent license is retained
    [Tags]  Case2
    Navigate To Device Setup Page
    Get network details for postvalidation  Device discovery
    Verify device with permanent license  ${permanentNetworkname}
    
PostValidation for Check Network Scan
    [Documentation]  Make sure added network is retained
    [Tags]  Case3
    Navigate To Device Setup Page
    Get network details for postvalidation  Device discovery
    Verify Network Scan  ${scanNetworkname}
    
### DeviceSetup Page ###
PostValidation for Add Certificates
    [Documentation]   Make sure certificates are added after upgrade
    [Tags]  case12
    Navigate To Device Setup Page
    Navigate To Device Setup Certificates Page
    Get Certificate details for postvalidation  PostValidation for Add Certificates
    ### Trusted CA Certificate
    Verify Certificate after upgrade  ${TrustedCertName}  ${TrustedType}  
    ### Intermediate Certificate
    Verify Certificate after upgrade  ${IntermediateCertName}  ${IntermediateType}
    ### Multi Intermediate Certificate
    Verify Certificate after upgrade  ${MultiIntermediateCertName}  ${MultiIntermediateType}
  
    
PostValidation for Check modifying the default device credentials in Communication page
    [Documentation]   Make sure default device credentials in Communication page are retained after upgrade
    [Tags]  case13
    
    Navigate To Device Setup Page
    Navigate To Device Setup Add Page
    Get default device credentials  default device credentials
    Verify Username after upgrade  ${Comm_TestUsername}  ${Comm_DevType}
    
PostValidation for Check topology for device status and links
    [Documentation]   Make sure topology is showing correctly after upgrade, newly added devices should be showing in topology correctly after upgrade
    ...    
    [Tags]  Case10
    Navigate To Home Page
    Navigate To Home Topology Page
    Check for topology after upgrade
   # Check View and Filter options after upgrade
   

### Groups Page ###
PostValidation for Creating Groups in Airwave
   [Documentation]  Here Getting the test data from 'Groups' sheet - "Groups" Test case column name.
   ...     
   [Tags]  Case 7
   Groups Data Setup for PostValidation  Groups 
   Verify Creation of a New Group in Airwave  ${GroupsName}
   
PostValidation for Create Folders in Airwave
   [Documentation]  Create Folders and Sub Folders in Airwave
   [Tags]  Case 6
   Groups Data Setup for PostValidation  Groups
   Verify Creation of a New Folder  ${FoldersName} 

     
   
PostValidation for Create Sub Folders in Airwave
   [Documentation]  Create Folders and Sub Folders in Airwave
   [Tags]  Case 6    
   Groups Data Setup for PostValidation  Groups
   Verify Creation of a Sub Folder  ${FoldersName}  ${FoldersName1} 
   
PostValidation for Compare Groups with similar & non-similar fields
    [Documentation]  Compare Groups with similar & non-similar fields
    [Tags]  Case 8
    Groups Data Setup for PostValidation  Groups
    Navigate To Group Page
   # Create a New Group with Status Polling after upgrade  ${GroupsName1}  ${StatusPolling}
    Compare 2 Groups after upgrade  ${GroupsName1}  ${Pollingtime}  ${Groupname2}
     
    
#PostValidation for Check for Discover of devices in newly groups and Folders
 #   [Documentation]  Check for discovery of devices in newly groups after upgrade
  #  [Tags]  Case 9
   # Groups Data Setup for PostValidation  Groups
   # Navigate To Home Page
   # Verify Added New Device  ${DeviceName}  ${deviceIPAddress}
    
#PostValidation for Check the Audit Configuration status
#    [Documentation]  Check the Audit Configuration Status
#    [Tags]  Case 12
#    Navigate To Group Page
#    Get IP for configuration status for postvalidation  default device credentials
#    Check configuration for postvalidation  ${Audit_GrpIP}
    


  
### Reports Page ###
PostValidation for Generated Report
    [Documentation]   Find created report in the generat tab
    [Tags]  case20
    Navigate To Reports Page
    Navigate To Reports Generated Page
    Get Generated report details for postvalidation  Create Report PV
    Verify Generated Report after upgrade  ${Reporttitle}

PostValidation for Export Reports to pdf, csv data
    [Documentation]   Make sure that reports are exported to csv and pdf after upgrade
    ...    
    [Tags]  Case11
    Navigate To Reports Page
    Navigate To Reports Generated Page
    Set focus to element  ${Loc_ExportToCSV}
    Click  ${Loc_ExportToCSV}
    
### Performance Cases ###
PostValidation for Check the System Performance page
    [Documentation]  Check System Performance page for CPU, Memory, Disk, I/O Usage, etc after upgrade
    [tags]  case37
    Navigate To Systems Page
    Navigate To Systems Performance Page
    Check for CPU data after upgrade
    Check for Memory after upgrade
    Check for Disk after upgrade
    Check for I/O Usage after upgrade
    
PostValidation for Check the System Statistics graph
    [Documentation]  Check the AMON, RabbitMQ, Redis, DataBase statistics after upgrade
    [tags]  case38
    Navigate To Systems Page
    Navigate To Systems Performance Page
    Check AMON RabbitMq and Redis Statistics after upgrade
    Check Database Statistics after upgrade
    
    
### AMPsetup page ###

PostValidation for Check Clients Diagnostics page for AppRF, UCC, Clarity and Charts
    [Documentation]   All the base version data is retained for UCC, Clarity and AppRF after upgrade
    ...    
    [Tags]  Case7
    Navigate To Clients Page
    Navigate To Client Diagnostics Page after upgrade
    
PostValidation for Check Client Details page for Clarity Data, UCC calls
    [Documentation]   Make sure that Client Details page shows data for UCC, Clarity after upgrade
    ...    
    [Tags]  Case6
    Navigate To Clients Page
    Navigate To Client Detail Page after upgrade
    Check UCC Data after upgrade
    Check Clarity Data after upgrade
    
PostValidation for Customize AMP Setup page
    [Documentation]   Make sure customizations of Top header,Firmware Upgrade/Reboot Options,Automatic Authorization,Additional AMP Services,Performance are regained
    ...    
    [Tags]  Case4
    Navigate To AMP Setup Page
    Verify Customization of Top Header 
    Verify customization of Firmware Upgrade/Reboot Options
    verify Customization for Automatic Authorization
    verify Customization for Additional AMP services
    Verify Customization Performance
    
PostValidation for Check Device Manage page
    [Documentation]   Make sure Device manage page is working fine after upgrade
    [Tags]  case5
    Navigate To AMP Setup Page
    Verify Device Manage Page after upgrade

PostValidation for Check Clients Connected page
   [Tags]  case8
   Navigate To Home Page   
   Navigate To Clients Page
   Navigate To Clients Connected Page
   sleep  5s
   Verify the client Connected page after upgrade
   
PostValidation for Check default AMP Dashboard/Overview page
    [Documentation]   Make sure that AMP Dashboard/Overview page shows data for Alert summary, Folder view, Monitoring Status after upgrade
    [Tags]  case9
    Navigate To Clients Page 
    Navigate To Clients Connected Page
    DOMReadyByWaitTime  10
    Click  //*[@name="jump_off"]
    Click  //option[contains(text(),'Clients')][1]
    Navigate To Home Page
    sleep  5s
    Verify Clients Data after upgrade
    Verify Folder Overview Data after upgrade
    Verify Alert Summary after upgrade
    Verify Quick Links after upgrade
    Verify Monitoring Status after upgrade
   
### Rapids Page ###
PostValidation for Check the RAPIDS overview for Rogue Data
    [Documentation]  Make sure rogue data is retained after upgrade  
    [Tags]  case24
    Navigate To RAPIDS Page
    Navigate To RAPIDS Overview Page
    Check for Rogue data after upgrade
    
PostValidation for Check the ROGUE list page
    [Documentation]  Make sure that Rogues are listed out 
    [Tags]  case25
    Navigate To RAPIDS Page
    Navigate To RAPIDS List Page
    Check for Rogue List after upgrade
    
PostValidation for Check and modify the ROGUE setup page
    [Documentation]  Make sure that configuration in Rogue setup page is retained  
    [Tags]  case26
    Navigate To RAPIDS Page
    Navigate To RAPIDS Setup Page
    Rapids Classification Setup for postvalidation  ROGUE classification PV
    Verify Change ARP IP Match Timeout after upgrade  ${ValuePv}  
    
PostValidation for Check and modify the ROGUE classification rules
    [Documentation]  Make sure that modified rogue rules are retained  
    [Tags]  case27
    Navigate To RAPIDS Page
    Navigate To RAPIDS Rules Page
    Rapids Classification Setup for postvalidation  ROGUE classification PV
    Verify new rule after upgrade  ${Rulename}
    

### Visual RF ###
PostValidation for Check for Enable VisualRF
    [Documentation]  Check for Enable of VisualRF
    [Tags]  Case 28
    Navigate To Home Page
    Navigate To Visual RF Page
    Navigate To Visual RF Setup Page
    Verify for Enable VisualRF after upgrade
    
PostValidation for for Creation of Camps and Building
    [Documentation]  Check for Creation of Campus,Building and Floor
    [Tags]  Case 29,30
   # Login Data Setup  TestLoginNegative
    Navigate To Home Page
    Navigate To Visual RF Page
    VRF Data Setup for PostValidation  VisualRf   
    sleep  20s
    Verify Creation of Campus  ${CampusName}  
    Verify Creation of Buidling  ${CampusName}
    
PostValidation for Check for Presence of AP Overlays
    [Documentation]  Check for Presence of AP overlays after upgrade
    [Tags]  Case 32
    Sleep  15s
    Navigate To Visual RF Page
    sleep  20s
    VRF Data Setup for PostValidation  VisualRf
    Navigate to floor page  ${CampusName}
    Check for AP Overlays Present after upgrade
    Check for the elements present in AP Overlays after upgrade
    
### Database cases ###
PostValidation for Check the Events Log page
    [Documentation]   Make sure that all the Events are available in system page after upgrade
    ...    
    [Tags]  Test
   # Login And Verify
    Navigate To Systems Page
    Navigate To Systems Event Log Page
    Check on events log after upgrade
    Get CLI data for postvalidation  Database
    Check last event in CLI and AMP after upgrade  ${CLIHostname}  ${CLIUsername}  ${CLIPassword}
    
PostValidation for Verify Login to AMP DB
    [tags]  case39
    Get CLI data for postvalidation  Database
    ${cli_roguecount_pv}  getcountfromCLI  ${CLIHostname}  ${CLIUsername}  ${CLIPassword}  ${DBcmd}  ${RogueCLIcmd}
    log  Login to AMP DB: Sucess  console=True
    
PostValidation for Verify Rogue count in DB
    [tags]  case42
    #${cli_roguecount}  getrogue  ${db_hostname}  ${db_username}  ${db_pwd}  8  1  2  ${db}  ${rogue_cmd}
    Get CLI data for postvalidation  Database
    ${cli_roguecount_pv}  getcountfromCLI  ${CLIHostname}  ${CLIUsername}  ${CLIPassword}  ${DBcmd}  ${RogueCLIcmd}
    Rogue count in DB after upgrade  ${cli_roguecount_pv}
    
PostValidation for Verify Aggregate session count in DB
    [tags]  case41
    Get CLI data for postvalidation  Database
    ${cli_sessioncount_pv}  getcountfromCLI  ${CLIHostname}  ${CLIUsername}  ${CLIPassword}  ${DBcmd}  ${sessionCLIcmd}
    Aggregate session count in DB after upgrade  ${cli_sessioncount_pv}
    
PostValidation for Verify User and AP count in DB
    [tags]  case40
    Get CLI data for postvalidation  Database
    ${cli_usercount_pv}  getcountfromCLI  ${CLIHostname}  ${CLIUsername}  ${CLIPassword}  ${DBcmd}  ${userCLIcmd}
    User count in DB after upgrade  ${cli_usercount_pv}
    ${cli_APcount_pv}  getcountfromCLI  ${CLIHostname}  ${CLIUsername}  ${CLIPassword}  ${DBcmd}  ${APCLIcmd}
    AP count in DB after upgrade  ${cli_APcount_pv}



### Alerts Page ###
PostValidation for TestAlertsinAirwave
    [Documentation]  Here Getting the test data from 'LoginValidate' sheet - "TestLoginNegative" Test case column name. 
    [Tags]  smokeTest1
    Alerts Data Setup for postvalidation  TestAlertsinAirwave PV
    verify the Generated specific Alarm  ${TriggerList}  ${SeverityValue}  ${InputValue}
     
    
### Client Monitoring Page ###
PostValidation for Check Device Status after Polling
    Navigate to Home Page
    Get controller details for Post validation  Client Monitoring
    Click  ${Loc_icon_search}
    Type  ${Loc_search_input_xpath}  ${Controller_IP}
    sleep  5s
    Click  ${Loc_searchPopup}
    DOMreadyByWaitTime  10
    Click  //*[@id="controllers_button"]
    sleep  5s
    Check Device Status of controller after upgrade  ${Controller_IP}




    

   



*** Variables ***
${SheetName}  PostValidation_Cleanup

