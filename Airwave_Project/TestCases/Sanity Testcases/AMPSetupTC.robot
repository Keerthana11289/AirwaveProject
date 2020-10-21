*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary
Library           String
#Library           OperatingSystem
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
    Run keyword and continue on failure  Verify Firmware Upgrade/Reboot Options
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
   Verify the client Connected page
   

Check default AMP Dashboard/Overview page
    [Documentation]   Make sure that AMP Dashboard/Overview page shows data for Alert summary, Folder view, Monitoring Status etc.,
    [Tags]  case4
    Navigate To Clients Page 
    sleep  5s
    Navigate To Clients Connected Page
    sleep  5s
    Click  //*[@name="jump_off"]
    Click  //option[contains(text(),'Clients')][1]
    sleep  5s
    Navigate To Home Page
    sleep  5s
    Verify Clients Data
    Verify Folder Overview Data
    Verify Alert Summary
    Verify Quick Links
    Verify Monitoring Status
