*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/AOSmodule_keywords/APdeviceFeature3.0_keywords.robot
Resource          ../../Keywords/AOSmodule_keywords/APdeviceFeature2.0_keywords.robot
Resource          ../../Locators/APdeviceFeature.robot

*** Test Cases ***


    
Discovering the MM should discover MDs
    [Documentation]  should discover MDs
    [Tags]  Case 3_4
    Get Master Controller Details To Add  Master Controller
    Select AOS controller  ${AOScontroller}
    Check Device Config Status  ${Devstatus}  ${DevConfig}
    Check master-MDs in Monitor Page  ${AOSMD1}  ${AOSMD2}
    
MDs should be auto provisioned if MM is added
    [Documentation]  MDs should be auto provisioned 
    [Tags]  Case 3_5
    Get Master Controller Details To Add  Master Controller
    Select AOS controller  ${AOScontroller}
    ${version}  ${ControllerType}  Get Version and type
    check MM autoprovisioned   ${AOScontroller}  ${version}  ${ControllerType}
    
MM monitoring page should list all the MDs in a table
    [Documentation]  MM monitoring page should list all the MDs
    [Tags]  Case 3_6
    Get Master Controller Details To Add  Master Controller
    Select AOS controller  ${AOScontroller}
    Check master-MDs in Monitor Page  ${AOSMD1}  ${AOSMD2}

MM monitor page should list all the charts
    [Documentation]  Check for CPU and memory charts in Monitor page
    [Tags]  Case 3_7
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    Check For CPU and memory graph
    
MM monitor page should have quick links for MM related commands
    [Documentation]  Verify quick links for MM Device
    ...    
    [Tags]  Case3_8
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    Verify Quick Link open web UI
    Verify Quick Links  ${AOScontroller}  ${RunCommand}
    
MD monitor page should show the cluster details
    [Documentation]  MD monitor page should show the cluster
    ...    
    [Tags]  Case3_9
    Get Master Controller Details To Add  Master Controller
    Select AOS controller  ${AOScontroller}
    Verify Cluster for MD  ${AOScontroller}  ${AOSMD1}  ${AOSMD2}
    

Check the MM role info
    [Documentation]  check MM and MD role info
    [Tags]  Case3_10
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    Check MM role info in Monitor Page
    Verify MD role in MD monitor page  ${AOScontroller}


MM monitor page should list all the relevant device info
    [Documentation]  Verify Monitoring info and compare with AMP and Controller 
    ...    
    [Tags]  Case3_11
    Get AOS controller details  DeviceFeature
    ${firmware}  ${type}  Get AMP controller details
    Select AOS controller  ${AOScontroller}
    Verify Device Info with AMP  ${firmware}  ${type}
    
MM specific device events should be listed on the MM monitor page
    [Documentation]  check MM specific device events in MM monitor page
    [Tags]  Case3_12
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    Verify Device Events
    Check Events Log  ${EventAOSGroup}


Check MD Status
    [Documentation]  check MD status in MM monitor page
    [Tags]  Case3_13
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    Check MD status in Monitor Page  
    

    
Check for MM licenses on monitor page
    [Documentation]  MM licenses should be shown on monitor page
    ...    
    [Tags]  Case3_14
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    ${LicVal}  Get License detail from CLI
    Check For MM License  ${AOScontroller}  ${LicVal}
    
    

MD should show the proper SNMP status
    [Documentation]  Check status of MD 
    [Tags]  Case 3_17
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    Check MD status  ${AOScontroller}

Create Inventory Report for MM
    [Documentation]   Create a Inventory report and check the firmware version
    [Tags]  case3_18
    Navigate To Reports Page
    Navigate To Reports Definitions Page
    Get Inventory report details  Create Inventory Report for MM
    Create Inventory Report  ${Title}  ${Type}  ${group}
    DOMreadyByWaitTime  15
    Navigate To Reports Page
    Navigate To Reports Generated Page
    Verify Generated Inventory Report  ${Title}
    Cleanup For Report1  ${Title}

PCI Compliance Report
    [Documentation]   Create a PCI compliance report and check for the generated data
    [Tags]  case3_19
    Navigate To Reports Page
    Navigate To Reports Definitions Page
    Get PCI compliance Report details  Create PCI compliance Report for MM
    Create PCI compliance Report  ${Title}  ${Type}  ${group}  ${ReportStart}  ${ReportStop}
    DOMreadyByWaitTime  5
    Navigate To Reports Page
    Navigate To Reports Generated Page
    Verify Generated PCI compliance Report  ${Title}
    Cleanup For Report1  ${Title}

Create RF Health Report for MM
    [Documentation]   Create a RF Health report and check the generated report
    [Tags]  case3_20
    Navigate To Reports Page
    Navigate To Reports Definitions Page
    Get RF Health report details  Create RF Health Report for MM
    Create RF Health Report  ${Title}  ${Type}  ${group}  ${ReportStart}  ${ReportStop}  
    Navigate To Reports Page
    Navigate To Reports Generated Page
    Verify Generated RF Health Report  ${Title}
    Cleanup For Report1  ${Title}
    

    

Create Rogue Containment Report for MM
    [Documentation]   Create a Rogue Containment report and check the generated report
    [Tags]  case3_22
    Navigate To Reports Page
    Navigate To Reports Definitions Page
    Get Rogue Containment report details  Create Rogue Containment Report for MM
    Create Rogue Containment Report  ${Title}  ${Type}  ${group} 
    Navigate To Reports Page
    Navigate To Reports Generated Page
    Verify Generated Rogue Containment Report  ${Title}
    Cleanup For Report1  ${Title}
    
Create Audit Report for MM
    [Documentation]   Create a Audit report and check the generated report
    [Tags]  case3_23
    Navigate To Reports Page
    Navigate To Reports Definitions Page
    Get Audit report details  Create Audit Report for MM
    Create Audit Report  ${Title}  ${Type}  ${group} 
    Navigate To Reports Page
    Navigate To Reports Generated Page
    Verify Generated Audit Report  ${Title}
    Cleanup For Report1  ${Title}
    
Create Device UPtime Report for MM
    [Documentation]   Create a Device UPtime report and check the generated report
    [Tags]  case3_24
    Navigate To Reports Page
    Navigate To Reports Definitions Page
     Get Device UPtime report details  Create Device UPtime Report for MM
    Create Device UPtime Report  ${Title}  ${Type}  ${group}  ${ReportStart}  ${ReportStop}  
    Navigate To Reports Page
    Navigate To Reports Generated Page
    Verify Generated Device UPtime Report  ${Title}
    Cleanup For Report1  ${Title}
    

*** comments ***
Discover the Master over SNMP
    [Documentation]  Create new group and folder and discover device and add device to new group and folder 
    ...   
    [Tags]  Case 3_1
    Get Discover Device details  Discover Device
    Create Group For AOS controller  ${GroupName1}
    Create Folder For AOS Controler  ${FolderName1}
    Add Master over SNMP Positive  ${DeviceType1}  ${DeviceIPAddress1}  ${DeviceCommunityString1}  ${TelnetSSHUsername1}  ${TelnetSSHPassword1}  ${GroupName1}  ${FolderName1}  ${SNMPv3AuthProtocol}  ${PosPrivacyPassword}  ${SNMPv3PrivProtocol}  
    Add master-MD To group  ${AOSMD1}  ${AOSMD2}  ${GroupName1}
    Add master-AP To group  ${AOSap1}  ${AOSap2}  ${GroupName1}
    Select AOS controller  ${AOScontroller}
    Check master SNMP-MDs in Monitor Page  ${AOSMD1}  ${AOSMD2}


Add the master manually
    [Documentation]  Add the master controller manually
    [Tags]  Case 3_2
    Get Master Controller Details To Add  Master Controller
    Create Group For Master controller  ${GroupName1}
    Add Master Controller  ${DeviceType1}  ${DeviceIPAddress1}  ${DeviceCommunityString1}  ${TelnetSSHUsername1}  ${TelnetSSHPassword1}  ${GroupName1}  ${DefaultFolderName1}
    Add master-MD To group  ${AOSMD1}  ${AOSMD2}  ${GroupName1}
    Add master-AP To group  ${AOSap1}  ${AOSap2}  ${GroupName1}
    Select AOS controller  ${AOScontroller}
    Check Device Config Status  ${Devstatus}  ${DevConfig}
    Check master-MDs in Monitor Page  ${AOSMD1}  ${AOSMD2}
    

Remove one or more MDs of the MM
    [Documentation]  Remove MD and check table
    [Tags]  Case 3_16
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    ${Count}  Remove MD and verify  ${AOScontroller}
    Click Poll and Verify MD  ${AOScontroller}  ${Count}
    


*** Variables ***
${SheetName}  AOSdevice