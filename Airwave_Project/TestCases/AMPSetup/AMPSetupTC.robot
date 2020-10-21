*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary
Library           String
Library           OperatingSystem
#Suite Setup       Login And Verify
#Suite Teardown    LogoutAW
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Locators/AMPSetupPage.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Keywords/AMPSetup/AmpSetupKeywords.robot
Resource          ../../Utilities/Data_Provider.robot
Resource          ../../Keywords/APMonitoringPage/APMonitoringPage.robot

*** Test Cases ***
Check Clients Diagnostics page for AppRF, UCC, Clarity and Charts
    [Documentation]   All the base version data is retained for UCC, Clarity and AppRF  
    [Tags]  case14
    Navigate To Clients Page
    Navigate To Client Diagnostics Page
    
Check Client Details page for Clarity Data, UCC calls, etc
    [Documentation]   Make sure that Client Details page shows data for UCC, Clarity, etc 
    [Tags]  case15
    Navigate To Clients Page
    Navigate To Client Detail Page
    Check UCC Data
    Check Clarity Data
    

Customize AMP Setup page
    [Documentation]   Make sure customizations of Top header,Firmware Upgrade/Reboot Options,Automatic Authorization,Additional AMP Services,Performance are regained
    [Tags]  case5
    Navigate To AMP Setup Page
    Customize Top Header and Verify 
    Verify Firmware Upgrade/Reboot Options
    Customize Automatic Authorization and verify
    Customize Additional AMP services and verify
    Verify Performance
    
        
Check Device Manage page
    [Documentation]   Make sure Device manage page is working fine.
    [Tags]  case13
    Navigate To AMP Setup Page
    Verify Device Manage Page
    
Check Clients Connected page
   [Tags]  case16
   Navigate To Home Page    
   Navigate To Clients Page 
   Navigate To Clients Connected Page
   ${status}  Verify the client counts on client Connected page
   Should be True  ${status}  
   
   
 