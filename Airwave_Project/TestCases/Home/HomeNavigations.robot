*** Settings ***
Documentation     Page/feature library for Login
...    
Suite Setup       Login And Verify
Suite Teardown    LogoutAW
Library           SeleniumLibrary
Library           String
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Login/LoginFeature.robot


*** Test Cases ***
Home Menu Navigations
    Navigate To Home Overview Page
    Navigate To Home Traffic Analysis Page
    Navigate To Home UCC Page
    Navigate To Home RF Performance Page
    Navigate To Home RF Capacity Page
    Navigate To Home Airmatch Page
    Navigate To Home Clarity Page
    Navigate To Home Topology Page
    Navigate To Home Network Deviations Page
    Navigate To Home Documentation Page
    Navigate To Home License Page
    Navigate To Home User Info Page

Group Menu Navigations
    Navigate To Group Page
    Navigate To Group List Page
    Navigate To Group ConfigAuditJobs Page
    
Device Menu Navigations    
    Navigate To Device Page
    Navigate To Device List Page
    Navigate To Device New Page
    Navigate To Device Up Page
    Navigate To Device Down Page
    Navigate To Device Mismatched Page
    Navigate To Device Ignored Page
    Navigate To Device ControllerClusters Page
    
Clients Menu Navigations
    Navigate To Clients Page
    Navigate To Clients Overview Page
    Navigate To Clients Connected Page
    Navigate To Clients All Page
    Navigate To Clients Rogue Clients Page
    Navigate To Clients Guest Users Page
    Navigate To Clients VPN Sessions Page
    Navigate To Clients VPN Users Page
    Navigate To Clients Tags Page
    
Reports Menu Navigations
    Navigate To Reports Page
    Navigate To Reports Generated Page
    Navigate To Reports Definitions Page
    
Systems Menu Navigations
    Navigate To Systems Page
    Navigate To Systems Status Page
    Navigate To Systems Syslog Traps Page
    Navigate To Systems Event Log Page
    Navigate To Systems Triggers Page
    Navigate To Systems Alerts Page
    Navigate To Systems Backups Page
    Navigate To Systems Configuration Change Jobs Page
    Navigate To Systems Firmware Upgrade Jobs Page
    Navigate To Systems DRT Upgrade Jobs Page
    Navigate To Systems Performance Page
    Navigate To Systems Download Log Files Page
    
Device Setup Menu Navigations
    Navigate To Device Setup Page
    Navigate To Device Setup Discover Page
    Navigate To Device Setup Add Page
    Navigate To Device Setup Communication Page
    Navigate To Device Setup ZTP Orchestrator Page
    Navigate To Device Setup Upload Firmware Files Page
    Navigate To Device Setup Certificates Page
    
AMP Setup Menu Navigations
    Navigate To AMP Setup Page
    Navigate To AMP Setup General Page
    Navigate To AMP Setup Network Page
    Navigate To AMP Setup Users Page
    Navigate To AMP Setup Roles Page
    Navigate To AMP Setup Authentication Page
    Navigate To AMP Setup MDM Server Page
    Navigate To AMP Setup Device Type Setup Page
    Navigate To AMP Setup WLSE Page
    Navigate To AMP Setup ACS Page
    Navigate To AMP Setup NMS Page
    Navigate To AMP Setup Radius Accounting Page
    Navigate To AMP Setup PCI Compliance Page
    Navigate To AMP Setup External Server Page
    
RAPIDS Menu Navigations
    Navigate To RAPIDS Page
    Navigate To RAPIDS Overview Page
    Navigate To RAPIDS List Page
    Navigate To RAPIDS IDS Events Page
    Navigate To RAPIDS Setup Page
    Navigate To RAPIDS Rules Page
    Navigate To RAPIDS Score Override Page
    Navigate To RAPIDS Audit Log Page
    
Visual RF Menu Navigations
    Navigate To Visual RF Page
    Navigate To Visual RF Floor Plan Page
    Navigate To Visual RF Setup Page
    Navigate To Visual RF Import Page
    Navigate To Visual RF Audit Log Page
    
Header Links Navigations
    Navigate To Header New Devices Page
    Navigate To Header Up Devices Page
    Navigate To Header Up Wired Devices Page
    Navigate To Header Down Wired Devices Page
    Navigate To Header Rogue Page
    Navigate To Header Clients Page
    Navigate To Header Alerts Page
    Click on the SubHeader Link    
    
    
        
    
                
                
    
    
        
    