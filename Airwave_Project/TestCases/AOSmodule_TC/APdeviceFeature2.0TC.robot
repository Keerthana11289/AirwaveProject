*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/AOSmodule_keywords/APdeviceFeature2.0_keywords.robot
Resource          ../../Locators/APdeviceFeature.robot


*** Test Cases ***

Login To AMP
    [Documentation]  Here Getting the test data from 'ReportsFT' sheet - "Login Details" Test case column name. 
    [Tags]  Case1
    Login Data Setup CleanupFT  Login Details  
    Login To AMP page successful for Airwave after cleanup  ${LoginUserName1}  ${LoginPassword1} 
    


    

    

Verify moving MM controller to different groups in Airwave
    [Documentation]  Verify moving MM controller to newly created group
    ...    
    [Tags]  Case2_3
    Get AOS controller details  DeviceFeature
    Create Group For AOS controller  ${GroupName1}
    Select AOS controller  ${AOScontroller}
    ${defaultgrp}  Select and Move Controller device  ${AOScontroller}  ${GroupName1}
    Check Audit option
    Verify device in new group  ${AOScontroller}  ${GroupName1}
    Revert Back and Delete new group  ${AOScontroller}  ${GroupName1}  ${defaultgrp}    

Verify Firmware Upgrade option for MM device
    [Documentation]  Verify Firmware Upgrade option for MM device not seen
    ...    
    [Tags]  Case2_5
    Get AOS controller details  DeviceFeature
    Check Firmware option in AMPsetup
    Select AOS controller  ${AOScontroller}
    Verify Firmware upgrade option in MM device 
    
Verify status of MM device in Monitor page
    [Documentation]  Verify config status of MM device
    ...    
    [Tags]  Case2_6
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    Check Device Config Status  ${Devstatus}  ${DevConfig}
    
    
Verify Polling the AOS8.0 controllers
    [Documentation]  Verify Polling the MM Device
    ...    
    [Tags]  Case2_7
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    Select and Poll Controller device  ${AOScontroller}
    
Verify snmp group polling the AOS8.0 controllers
    [Documentation]  Verify Group Polling the MM Device
    ...    
    [Tags]  Case2_8
    Get AOS controller details  DeviceFeature
    Select and Group Poll Controller  ${AOSGroup}
    
Verify Polling the APs on AOS8.0 controllers
    [Documentation]  Verify Polling the APs on AOS8.0 controllers
    ...    
    [Tags]  Case2_9
    Get AOS controller details  DeviceFeature
    Check for Polling the Aps on controllers  ${AOScontroller}  ${AOSGroup}

    
    
Verify Quick Links on AOS8.0 controllers
    [Documentation]  Verify Quick Links on AOS8.0 controllers MM Device
    ...    
    [Tags]  Case2_10
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    Verify Quick Link open web UI
    Verify Quick Links  ${AOScontroller}  ${RunCommand}
    
Verify Monitoring info for AOS8.0 controllers
    [Documentation]  Verify Monitoring info and compare with AMP and Controller 
    ...    
    [Tags]  Case2_11
    Get AOS controller details  DeviceFeature
    ${firmware}  ${type}  Get AMP controller details
    Select AOS controller  ${AOScontroller}
    Verify Device Info with AMP  ${firmware}  ${type}
    
    
Verify renaming the devices from AP list page
    [Documentation]  Check for Renaming the devices from AP List page
    [Tags]  Case2_12
    Get Rename Data  Verify renaming the devices from AP list page
    Check for Renaming the devices  ${DeviceGroupsName}
    
Verify firmware upgrading Aruba device
    [Documentation]  Check for upgrading firmware from AP List page
    [Tags]  Case2_13
    Get Upgrade Data  Verify firmware upgrading Aruba device
    Check for firmware upgrade  ${FirmwareUpgradeDevice}
    
Verify FactoryReset for selected device 
    [Documentation]  Select a device and check for Renaming the devices from AP List page
    [Tags]  Case2_15
    Get device data to factoryReset  Verify FactoryReset for selected device 
    FactoryReset the device  ${FactoryResetdevice}

Verify Rebooting of device from AP list
    [Documentation]  Select a device and verify Rebooting the device from AP list
    [Tags]  Case2_16
    Get device data to Reboot  Verify Rebooting of device from AP list
    Reboot the device  ${Rebootdevice}
    
Verify ReProvisioning Aruba Device
    [Documentation]  Check for ReProvisioning Aruba Device from AP List page
    [Tags]  Case2_17
    Get ReProvisioning Data  Verify ReProvisioning Aruba Device
    Check for Reprovisioning  ${ReprovisioningdeviceName} 

   
Verify Importing Aruba Profile from AP List
    [Documentation]  Check for Importing Aruba Profile AP List page
    [Tags]  Case2_18
    Get Aruba profile device Data  Verify Importing Aruba Profile from AP List
    Check Aruba profile Import  ${ReprovisioningdeviceName}

Verify Updating AP group for selected device
    [Documentation]  Check for Updating AP group for selected device AP List page
    [Tags]  Case2_19
    Get AP group device Data  Verify Updating AP group for selected device
    Check for Updating APgroup Device  ${ReprovisioningdeviceName}
    
Verify maintenance Window option from AP List page
    [Documentation]  Check for maintenance Window option
    [Tags]  Case2_20
    Get Maintanence window details  Maintenance window
    Add and Verify Maintenance window  ${DeviceGroupsName}  ${WindowName}  ${Occurance}  ${Month}  ${Day}  ${Time}  ${Duration}  ${AOScontroller}    
  #  Delete Maintenance Window  ${WindowName}
    
Verify import settings on AP list page
    [Documentation]  Check for import settings on AP list page
    [Tags]  Case2_21
    Get Rename Data  Verify renaming the devices from AP list page
    Check for import settings  ${DeviceGroupsName}
    
Verify Audit devices from AP list page
    [Documentation]  Check for audit settings on AP list page
    [Tags]  Case2_22
    Get Rename Data  Verify renaming the devices from AP list page
    Check for Audit Device Option  ${DeviceGroupsName}
    
Verify management level options in modify devices
    [Documentation]  Check for management level options on AP list page
    [Tags]  Case2_23
    Get Rename Data  Verify renaming the devices from AP list page
    Check for Management Level Option  ${DeviceGroupsName}
    
Verify Compliance page of MM
    [Documentation]  Check the Complience page availability
    [Tags]  Case2_24
    Get AOS controller details  Verify Compliance page of MM
    Select AOS controller  ${AOScontroller}
    Verify Compliance Page

    
Verify config page for flash backup option
    [Documentation]   verify whether the flash backup option is available in config page
    [Tags]  case2_25
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    Verify Backup option
    
Create and verify flash backup for a MM
    [Documentation]   create and verify flash backup of a MM in config page
    [Tags]  case2_26
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    Create and Verify Backup  ${AOScontroller}

Verify restoring the flash backups of a device
    [Documentation]  Check for CPU and memory charts in Monitor page
    [Tags]  Case 2_27_1
    Get Flash backup details  DeviceFeature
    Select AOS controller  ${FlashBackup}
    Verify restoring the flash backups
        

Verify Overrides in manage page
    [Documentation]  Check for  Overrides in manage page present in page or not
    ...   
    [Tags]  Case2_28
    Get AOS controller details  DeviceFeature
    Select AOS controller  ${AOScontroller}
    Verify Overrides device manage page

Create PCI compliance Report for MM
    [Documentation]   Create a PCI compliance report and check for the generated data
    [Tags]  case2_29
    Navigate To Reports Page
    Navigate To Reports Definitions Page
    Get PCI compliance Report details  Create PCI compliance Report for MM
    Create PCI compliance Report  ${Title}  ${Type}  ${group}  ${ReportStart}  ${ReportStop}
    DOMreadyByWaitTime  5
    Navigate To Reports Page
    Navigate To Reports Generated Page
    Verify Generated PCI compliance Report  ${Title}
    Cleanup For Report  ${Title}




    

     

*** Comments ***
    

Verify adding AOS8.0 MM controller to Airwave
    [Documentation]  Add AOS8.0 MM controller to Airwave
    ...    
    [Tags]  Case2_1
    Get AOS Controller Details To Add  AOS Controller
    Create Group For AOS controller  ${GroupName1}
    Add AOS Controller  ${DeviceType1}  ${DeviceIPAddress1}  ${DeviceCommunityString1}  ${TelnetSSHUsername1}  ${TelnetSSHPassword1}  ${GroupName1}  ${DefaultFolderName1}
    Add MD To group  ${AOSMD1}  ${AOSMD2}  ${GroupName1}
    Add AP To group  ${AOSap1}  ${AOSap2}  ${GroupName1}
    Select AOS controller  ${AOScontroller}
    Check Device Config Status  ${Devstatus}  ${DevConfig}
    Check MDs in Monitor Page  ${AOSMD1}  ${AOSMD2}
    
    

    


Check for Backup/Restore of the device
    [Documentation]  Check for CPU and memory charts in Monitor page
    [Tags]  Case 2_27_2
    ${CLILogin}  Get Login Info from AMP
    Get Flash backup details  DeviceFeature
    Select AOS controller  ${FlashBackup}
    Verify create Backup  ${CLILogin}
    Get VLAN Details  AMP details
    Create VLAN  ${VLANname}  ${VLANid}
    Select AOS controller  ${FlashBackup}
    Verify restoring the flash backups
    Verify VLAN  
    Restore Device  ${CLILogin}

    

Verify Firmware upload and files
    [Documentation]  Verify Firmware upload in Device setup page
    ...    
    [Tags]  Case
    Get Firmware upload details  FirmwareUpload
    Upload firmware and verify  ${Type}  ${Title}  ${ServerProtocol}
    Verify firmware upgrade option  ${FirmwareIp}  ${FirmwareName}
    ${Firm}  Verify completion of firmware upgrade  ${FirmwareName}
    Verify In Alerts  ${Firm}
    







*** Variables ***
${SheetName}  AOSdevice