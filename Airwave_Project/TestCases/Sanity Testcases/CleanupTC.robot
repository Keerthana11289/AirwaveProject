*** Settings ***
Documentation     Page/feature library for Login
...    
#Suite Setup       Login And Verify
#Suite Teardown    LogoutAW
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Locators/DeviceSetupPages.robot
Resource          ../../Keywords/Device/DeviceSetup_keywords.robot
Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
#Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Locators/Postvalidation_Cleanup.robot
Resource          ../../Keywords/PostValidation_Cleanup/Cleanup_keywords.robot
Resource          ../../Keywords/PostValidation_Cleanup/Postvalidation_keywords.robot
Resource          ../../Locators/HomePage.robot
Resource          ../../Utilities/Data_Provider.robot

*** Test Cases ***
Cleanup - TestLogin
    [Documentation]  Here Getting the test data from 'LoginValidate' sheet - "TestLoginNegative" Test case column name. 
    [Tags]  Case1
    Login Data Setup for post Validation   Login Credential  
    Login To AMP page successful for Airwave after cleanup  ${LoginUserName2}  ${LoginPassword2} 
    



### Discover devices in Device setup ###
Cleanup for Discover devices with eval license
    [Documentation]  Delete all device with eval license
    Navigate To Device Setup Page
    Get network details for postvalidation  Device discovery
    Delete device with eval license  ${evalNetworkname}
    
Cleanup for Discover devices with permanent license
    [Documentation]  Delete all device with permanent license
    [Tags]  Case2
    Navigate To Device Setup Page
    Get network details for postvalidation  Device discovery
    Delete device with permanent license  ${permanentNetworkname}
     
    
Cleanup for Check Network Scan
    [Documentation]  Delete all added network
    [Tags]  Case3
    Navigate To Device Setup Page
    Get network details for postvalidation  Device discovery
    Delete Network Scan  ${scanNetworkname} 
   # Delete added Devices after upgrade
    
### Device Setup Page ###

Cleanup for Add Certificates
    [Documentation]   Make sure certificates are added after upgrade
    [Tags]  case12
    Navigate To Device Setup Page
    Navigate To Device Setup Certificates Page
    Get Certificate details for postvalidation  PostValidation for Add Certificates
    ### Trusted CA Certificate
    Delete Certificate  ${TrustedCertName}  ${TrustedType}  
    ### Intermediate Certificate
    Delete Certificate  ${IntermediateCertName}  ${IntermediateType}
    ### Multi Intermediate Certificate
    Delete Certificate  ${MultiIntermediateCertName}  ${MultiIntermediateType}
    
Cleanup for Check modifying the default device credentials in Communication page
    [Documentation]   Modify default device credentials in Communication page are retained after upgrade
    [Tags]  case5
    Navigate To Device Setup Page
    Navigate To Device Setup Communication Page
    Get default device credentials  default device credentials
    ModifyTelnetAndSSHusername to default  ${Comm_Username}
    Navigate To Device Setup Page
    Navigate To Device Setup Add Page
    Verify Username after upgrade  ${Comm_Username}  ${Comm_DevType}
    
### Client Monitoring Page ###
Cleanup for Check Device Status after Polling
    Navigate to Home Page
    Get controller details for Post validation  Client Monitoring
    Click  ${Loc_icon_search}
    Type  ${Loc_search_input_xpath}  ${Controller_IP}
    Click  ${Loc_searchPopup}
    DOMreadyByWaitTime  5
    Delete Controller device  ${Controller_IP}


### Groups Page ###
#Cleanup for Check for Discover of devices in newly groups and Folders
#    [Documentation]  Check for discovery of devices in newly groups after upgrade
#    [Tags]  Case 9
#    Groups Data Setup for PostValidation  Groups
#    Navigate To Home Page
#    Delete Added New Device  ${DeviceName}  ${deviceIPAddress}
    
Cleanup for Create Sub Folders in Airwave
   [Documentation]  Create Folders and Sub Folders in Airwave
   [Tags]  Case 6    
   Groups Data Setup for PostValidation  Groups
   Delete created Sub Folder  ${FoldersName}  ${FoldersName1} 

Cleanup for Create Folders in Airwave
   [Documentation]  Delete Folders and Sub Folders in Airwave
   [Tags]  Case 6
   Groups Data Setup for PostValidation  Groups
   Delete created New Folder  ${FoldersName} 
    

Cleanup for Creating Groups in Airwave
   [Documentation]  Here Getting the test data from 'Groups' sheet - "Groups" Test case column name.
   ...     
   [Tags]  Case 7
   Groups Data Setup for PostValidation  Groups 
   Delete created New Group in Airwave  ${GroupsName}
   

   
Cleanup for Compare Groups with similar & non-similar fields
    [Documentation]  Compare Groups with similar & non-similar fields
    [Tags]  Case 8
    Groups Data Setup for PostValidation  Groups
    Navigate To Group Page
    Delete a New Group with Status Polling after upgrade  ${GroupsName1}
    
   

### Reports Page ###
Cleanup for Create Report
    [Documentation]   prerequisite Add license in the Home license page given
    [Tags]  case19
    Navigate To Reports Page
    Navigate To Reports Generated Page
    Get Generated report details for postvalidation  Create Report PV
    Delete created Report  ${Reporttitle}  ${ReportType}   


### AMPsetup Page ###
Cleanup for Customize AMP Setup page
    [Documentation]   Delete all customizations of Top header,Firmware Upgrade/Reboot Options,Automatic Authorization,Additional AMP Services,Performance
    ...    
    [Tags]  Case4
    Navigate To AMP Setup Page
    Run keyword and continue on failure  Delete Customization of Top Header 
    Delete customization of Firmware Upgrade/Reboot Options
    Delete Customization for Automatic Authorization
    
### Rapids Page ###
Cleanup for Check and modify the ROGUE setup page
    [Documentation]  Make sure that configuration in Rogue setup page is retained 
    [Tags]  case26
    Navigate To RAPIDS Page
    Navigate To RAPIDS Setup Page
    Rapids Classification Setup for postvalidation  ROGUE classification PV 
    Change ARP IP Match Timeout to default  ${ValueClean}  
    
Cleanup for Check and modify the ROGUE classification rules
    [Documentation]  Make sure that modified rogue rules are retained  
    [Tags]  case27
    Navigate To RAPIDS Page
    Navigate To RAPIDS Rules Page
    Rapids Classification Setup for postvalidation  ROGUE classification PV
    Modify rogue rules after upgrade
    Delete new rule and verify  ${Rulename}
    
### Visual RF ###
Cleanup for Check for Creation of Camps and Building and Floor
    [Documentation]  Delete created campus
    [Tags]  Case 29,30
   # Login Data Setup  TestLoginNegative
    Navigate To Home Page
    Navigate To Visual RF Page
    VRF Data Setup For postvalidation  VisualRf   
    sleep  20s
    Delete created Campus  ${CampusName}  
    

Cleanup for Check for Enable VisualRF
    [Documentation]  Check for Enable of VisualRF
    [Tags]  Case 28
    Navigate To Home Page
    Navigate To Visual RF Page
    Navigate To Visual RF Setup Page
    Cleanup for Enable VisualRF after upgrade
    
### Alerts Page ###
Cleanup for TestAlertsinAirwave
    [Documentation]  Delete created alert 
    [Tags]  smokeTest1
    Alerts Data Setup for postvalidation  TestAlertsinAirwave PV
    Delete the Generated specific Alarm  ${TriggerList}  ${SeverityValue}  ${InputValue}

    

    


*** Variables ***
${SheetName}  PostValidation_Cleanup


