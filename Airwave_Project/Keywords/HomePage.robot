*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary
Library           String
Resource          ../Utilities/CommonFunctions.robot
Resource          ../Locators/Homepage.robot

*** Variables ***
${textvalue}  New Campus5
${buidlingadd_value}  123
${latitude_value}  10
${longitude value}  10
${col1}  Devices
${col2}  Client Overlays
${col3}  AP Overlays
${col4}  Relation Lines
${col5}  Floorplan Features
${col6}  Heatmap History

${Attr1}  Ch. Utilization
${Attr2}  Channel
${Attr3}  Heatmap
${Attr4}  Speed
${Attr5}  Voice
${time_interval}  15 seconds
${time1}  15 seconds
${time2}  5 minutes



*** Keywords ***
Navigate To Home Page
    [Documentation]  Navigating to the Home page by clicking on the Home link.
    Wait Until Element Is Visible  ${HomeLink_css}
    Sleep  3s
    Click  ${HomeLink_css}
    Wait Until Element Is Not Visible  ${loader}  30s

Navigate To Home Overview Page
    [Documentation]  Navigating to the Home - Overview page by clicking on the Overview sublink under Home link.
    Wait Until Element Is Visible  ${Home_Overview_css}
    Sleep  3s
    Click  ${Home_Overview_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Home Traffic Analysis Page
    [Documentation]  Navigating to the Home - Traffic Analysis page by clicking on the Traffic Analysis sublink under Home link.
    Wait Until Element Is Visible  ${Home_TrafficAnalysis_css}
    Sleep  3s
    Click  ${Home_TrafficAnalysis_css}
    Wait Until Element Is Not Visible  ${loader}  30s

Navigate To Home UCC Page
    [Documentation]  Navigating to the Home - UCC page by clicking on the UCC sublink under Home link.
    Wait Until Element Is Visible  ${Home_UCC_css}
    Sleep  3s
    Click  ${Home_UCC_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Home RF Performance Page
    [Documentation]  Navigating to the Home - RF Performance page by clicking on the RF Performance sublink under Home link.
    Wait Until Element Is Visible  ${Home_RF_Performance_css}
    Sleep  3s
    Click  ${Home_RF_Performance_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Home RF Capacity Page
    [Documentation]  Navigating to the Home - RF Capacity page by clicking on the RF Capacity sublink under Home link.
    Wait Until Element Is Visible  ${Home_RF_Capacity_css}
    Sleep  3s
    Click  ${Home_RF_Capacity_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Home Airmatch Page
    [Documentation]  Navigating to the Home - Airmatch page by clicking on the Airmatch sublink under Home link.
    Wait Until Element Is Visible  ${Home_Airmatch_css}
    Sleep  3s
    Click  ${Home_Airmatch_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Home Clarity Page
    [Documentation]  Navigating to the Home - Clarity page by clicking on the Clarity sublink under Home link.
    Wait Until Element Is Visible  ${Home_Clarity_css}
    Sleep  3s
    Click  ${Home_Clarity_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Home Topology Page
    [Documentation]  Navigating to the Home - Topology page by clicking on the Topology sublink under Home link.
    Wait Until Element Is Visible  ${Home_Topology_css}
    Sleep  3s
    Click  ${Home_Topology_css}
    Wait Until Element Is Not Visible  ${loader}  30s

Navigate To Home Network Deviations Page
    [Documentation]  Navigating to the Home - Network Deviations page by clicking on the Network Deviations sublink under Home link.
    Wait Until Element Is Visible  ${Home_Network_Deviations_css}
    Sleep  3s
    Click  ${Home_Network_Deviations_css}
    Wait Until Element Is Not Visible  ${loader}  30s

Navigate To Home Documentation Page
    [Documentation]  Navigating to the Home - Documentation page by clicking on the Documentation sublink under Home link.
    Wait Until Element Is Visible  ${Home_Documentation_css}
    Sleep  3s
    Click  ${Home_Documentation_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Home License Page
    [Documentation]  Navigating to the Home - License page by clicking on the License sublink under Home link.
    Wait Until Element Is Visible  ${Home_License_css}
    Sleep  3s
    Click  ${Home_License_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Home User Info Page
    [Documentation]  Navigating to the Home - User Info page by clicking on the User Info sublink under Home link.
    Wait Until Element Is Visible  ${Home_User_Info_css}
    Sleep  3s
    Click  ${Home_User_Info_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Group Page
    [Documentation]  Navigating to the Group page by clicking on the Group link.
    Wait Until Element Is Visible  ${GroupLink_css}
    Sleep  3s
    Click  ${GroupLink_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    

    
Navigate To Group List Page
    [Documentation]  Navigating to the Group list page by clicking on the list sublink under Group link.
    Wait Until Element Is Visible  ${Group_List_css}
    Sleep  3s
    Click  ${Group_List_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Group ConfigAuditJobs Page
    [Documentation]  Navigating to the Group ConfigAuditJobs page by clicking on the ConfigAuditJobs sublink under Group link.
    Wait Until Element Is Visible  ${Group_ConfigAuditJobs_css}
    Sleep  3s
    Click  ${Group_ConfigAuditJobs_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device Page
    [Documentation]  Navigating to the Device page by clicking on the Device link.
    Wait Until Element Is Visible  ${DeviceLink_css}
    Sleep  3s
    Click  ${DeviceLink_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device List Page
    [Documentation]  Navigating to the Device list page by clicking on the list sublink under Device link.
    Wait Until Element Is Visible  ${Device_List_css}
    Sleep  3s
    Click  ${Device_List_css}
    Wait Until Element Is Not Visible  ${loader}  30s

Navigate To Device New Page
    [Documentation]  Navigating to the Device - New page by clicking on the list sublink under Device link.
    Wait Until Element Is Visible  ${Device_New_css}
    Sleep  3s
    Click  ${Device_New_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device Up Page
    [Documentation]  Navigating to the Device - Up page by clicking on the list sublink under Device link.
    Wait Until Element Is Visible  ${Device_Up_css}
    Sleep  3s
    Click  ${Device_Up_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device Down Page
    [Documentation]  Navigating to the Device - Up page by clicking on the list sublink under Device link.
    Wait Until Element Is Visible  ${Device_Down_css}
    Sleep  3s
    Click  ${Device_Down_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device Mismatched Page
    [Documentation]  Navigating to the Device - Mismatched page by clicking on the list sublink under Device link.
    Wait Until Element Is Visible  ${Device_Mismatched_css}
    Sleep  3s
    Click  ${Device_Mismatched_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device Ignored Page
    [Documentation]  Navigating to the Device - Ignored page by clicking on the list sublink under Device link.
    Wait Until Element Is Visible  ${Device_Ignored_css}
    Sleep  3s
    Click  ${Device_Ignored_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device ControllerClusters Page
    [Documentation]  Navigating to the Device - ControllerClusters page by clicking on the list sublink under Device link.
    Wait Until Element Is Visible  ${Device_ControllerClusters_css}
    Sleep  3s
    Click  ${Device_ControllerClusters_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Clients Page
    [Documentation]  Navigating to the clients page by clicking on the clients link.
    Wait Until Element Is Visible  ${ClientsLink_css}
    Sleep  3s
    Click  ${ClientsLink_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Clients Overview Page
    [Documentation]  Navigating to the Clients - Overview page by clicking on the list sublink under Clients link.
    Wait Until Element Is Visible  ${Clients_Overview_css}
    Sleep  3s
    Click  ${Clients_Overview_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Clients Connected Page
    [Documentation]  Navigating to the Clients - Connected page by clicking on the list sublink under Clients link.
    Wait Until Element Is Visible  ${Clients_Connected_css}
    Sleep  3s
    Click  ${Clients_Connected_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Clients All Page
    [Documentation]  Navigating to the Clients - All page by clicking on the list sublink under Clients link.
    Wait Until Element Is Visible  ${Clients_All_css}
    Sleep  3s
    Click  ${Clients_All_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Clients Rogue Clients Page
    [Documentation]  Navigating to the Clients - Rogue Clients page by clicking on the list sublink under Clients link.
    Wait Until Element Is Visible  ${Clients_RogueClients_css}
    Sleep  3s
    Click  ${Clients_RogueClients_css}
    Wait Until Element Is Not Visible  ${loader}  30s
                  
Navigate To Clients Guest Users Page
    [Documentation]  Navigating to the Clients - Guest Users page by clicking on the list sublink under Clients link.
    Wait Until Element Is Visible  ${Clients_GuestUsers_css}
    Sleep  3s
    Click  ${Clients_GuestUsers_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Clients VPN Sessions Page
    [Documentation]  Navigating to the Clients - VPN Sessions page by clicking on the list sublink under Clients link.
    Wait Until Element Is Visible  ${Clients_VPNSessions_css}
    Sleep  3s
    Click  ${Clients_VPNSessions_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Clients VPN Users Page
    [Documentation]  Navigating to the Clients - VPN Users page by clicking on the list sublink under Clients link.
    Wait Until Element Is Visible  ${Clients_VPNUsers_css}
    Sleep  3s
    Click  ${Clients_VPNUsers_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Clients Tags Page
    [Documentation]  Navigating to the Clients - Tags page by clicking on the list sublink under Clients link.
    Wait Until Element Is Visible  ${Clients_Tags_css}
    Sleep  3s
    Click  ${Clients_Tags_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Reports Page
    [Documentation]  Navigating to the reports page by clicking on the clients link.
    Wait Until Element Is Visible  ${ReportsLink_css}
    Sleep  3s
    Click  ${ReportsLink_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Reports Generated Page
    [Documentation]  Navigating to the Reports - Generated page by clicking on the list sublink under Reports link.
    Wait Until Element Is Visible  ${Reports_Generated_css}
    Sleep  3s
    Click  ${Reports_Generated_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Reports Definitions Page
    [Documentation]  Navigating to the Reports - Generated page by clicking on the list sublink under Reports link.
    Wait Until Element Is Visible  ${Reports_Definitions_css}
    Sleep  3s
    Click  ${Reports_Definitions_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Systems Page
    [Documentation]  Navigating to the systems page by clicking on the systems link.
    Wait Until Element Is Visible  ${SystemLink_css}
    Sleep  3s
    Click  ${SystemLink_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Systems Status Page
    [Documentation]  Navigating to the Systems - Status page by clicking on the list sublink under Systems link.
    Wait Until Element Is Visible  ${System_Status_css}
    Sleep  3s
    Click  ${System_Status_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Systems Syslog Traps Page
    [Documentation]  Navigating to the Systems - Syslog Traps page by clicking on the list sublink under Systems link.
    Wait Until Element Is Visible  ${System_SyslogTraps_css}
    Sleep  3s
    Click  ${System_SyslogTraps_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Systems Event Log Page
    [Documentation]  Navigating to the Systems - Event Log page by clicking on the list sublink under Systems link.
    Wait Until Element Is Visible  ${System_EventLog_css}
    Sleep  3s
    Click  ${System_EventLog_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Systems Triggers Page
    [Documentation]  Navigating to the Systems - Triggers page by clicking on the list sublink under Systems link.
    Wait Until Element Is Visible  ${System_Triggers_css}
    Sleep  3s
    Click  ${System_Triggers_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Systems Alerts Page
    [Documentation]  Navigating to the Systems - Alerts page by clicking on the list sublink under Systems link.
    Wait Until Element Is Visible  ${System_Alerts_css}
    Sleep  3s
    Click  ${System_Alerts_css}
    Wait Until Element Is Not Visible  ${loader}  30s
                        
Navigate To Systems Backups Page
    [Documentation]  Navigating to the Systems - Backups page by clicking on the list sublink under Systems link.
    Wait Until Element Is Visible  ${System_Backups_css}
    Sleep  3s
    Click  ${System_Backups_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Systems Configuration Change Jobs Page
    [Documentation]  Navigating to the Systems - Configuration Change Jobs page by clicking on the list sublink under Systems link.
    Wait Until Element Is Visible  ${System_ConfigurationChangeJobs_css}
    Sleep  3s
    Click  ${System_ConfigurationChangeJobs_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Systems Firmware Upgrade Jobs Page
    [Documentation]  Navigating to the Systems - Firmware Upgrade Jobs page by clicking on the list sublink under Systems link.
    Wait Until Element Is Visible  ${System_FirmwareUpgradeJobs_css}
    Sleep  3s
    Click  ${System_FirmwareUpgradeJobs_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Systems DRT Upgrade Jobs Page
    [Documentation]  Navigating to the Systems - DRT Upgrade Jobs page by clicking on the list sublink under Systems link.
    Wait Until Element Is Visible  ${System_DRTUpgradeJobs_css}
    Sleep  3s
    Click  ${System_DRTUpgradeJobs_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Systems Performance Page
    [Documentation]  Navigating to the Systems - Performance page by clicking on the list sublink under Systems link.
    Wait Until Element Is Visible  ${System_Performance_css}
    Sleep  3s
    Click  ${System_Performance_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Systems Download Log Files Page
    [Documentation]  Navigating to the Systems - Download Log Files page by clicking on the list sublink under Systems link.
    Wait Until Element Is Visible  ${System_DownloadLogFiles_css}
    Sleep  3s
    Click  ${System_DownloadLogFiles_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device Setup Page
    [Documentation]  Navigating to the Device Setup page by clicking on the Device Setup link.
    Wait Until Element Is Visible  ${DeviceSetupLink_css}
    Sleep  3s
    Click  ${DeviceSetupLink_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device Setup Discover Page
    [Documentation]  Navigating to the Device Setup - Discover page by clicking on the list sublink under Device Setup link.
    Wait Until Element Is Visible  ${DeviceSetup_Discover_css}
    Sleep  3s
    Click  ${DeviceSetup_Discover_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device Setup Add Page
    [Documentation]  Navigating to the Device Setup - Add page by clicking on the list sublink under Device Setup link.
    Wait Until Element Is Visible  ${DeviceSetup_Add_css}
    Sleep  3s
    Click  ${DeviceSetup_Add_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device Setup Communication Page
    [Documentation]  Navigating to the Device Setup - Communication page by clicking on the list sublink under Device Setup link.
    Wait Until Element Is Visible  ${DeviceSetup_Communication_css}
    Sleep  3s
    Click  ${DeviceSetup_Communication_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device Setup ZTP Orchestrator Page
    [Documentation]  Navigating to the Device Setup - ZTP Orchestrator page by clicking on the list sublink under Device Setup link.
    Wait Until Element Is Visible  ${DeviceSetup_ZTPOrchestrator_css}
    Sleep  3s
    Click  ${DeviceSetup_ZTPOrchestrator_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device Setup Upload Firmware Files Page
    [Documentation]  Navigating to the Device Setup - Upload Firmware Files page by clicking on the list sublink under Device Setup link.
    Wait Until Element Is Visible  ${DeviceSetup_UploadFirmwareFiles_css}
    Sleep  3s
    Click  ${DeviceSetup_UploadFirmwareFiles_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Device Setup Certificates Page
    [Documentation]  Navigating to the Device Setup - Certificates page by clicking on the list sublink under Device Setup link.
    Wait Until Element Is Visible  ${DeviceSetup_Certificates_css}
    Sleep  3s
    Click  ${DeviceSetup_Certificates_css}
    Wait Until Element Is Not Visible  ${loader}  300s
    
Navigate To AMP Setup Page
    [Documentation]  Navigating to the AMP Setup page by clicking on the AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetupLink_css}
    Sleep  3s
    Click  ${AMPSetupLink_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To AMP Setup General Page
    [Documentation]  Navigating to the AMP Setup - General page by clicking on the list sublink under AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetup_General_css}
    Sleep  3s
    Click  ${AMPSetup_General_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To AMP Setup Network Page
    [Documentation]  Navigating to the AMP Setup - Network page by clicking on the list sublink under AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetup_Network_css}
    Sleep  3s
    Click  ${AMPSetup_Network_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To AMP Setup Users Page
    [Documentation]  Navigating to the AMP Setup - Users page by clicking on the list sublink under AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetup_Users_css}
    Sleep  3s
    Click  ${AMPSetup_Users_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To AMP Setup Roles Page
    [Documentation]  Navigating to the AMP Setup - Roles page by clicking on the list sublink under AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetup_Roles_css}
    Sleep  3s
    Click  ${AMPSetup_Roles_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To AMP Setup Authentication Page
    [Documentation]  Navigating to the AMP Setup - Authentication page by clicking on the list sublink under AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetup_Authentication_css}
    Sleep  3s
    Click  ${AMPSetup_Authentication_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To AMP Setup MDM Server Page
    [Documentation]  Navigating to the AMP Setup - MDM Server page by clicking on the list sublink under AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetup_MDMServer_css}
    Sleep  3s
    Click  ${AMPSetup_MDMServer_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To AMP Setup Device Type Setup Page
    [Documentation]  Navigating to the AMP Setup - Device Type Setup page by clicking on the list sublink under AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetup_DeviceTypeSetup_css}
    Sleep  3s
    Click  ${AMPSetup_DeviceTypeSetup_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To AMP Setup WLSE Page
    [Documentation]  Navigating to the AMP Setup - WLSE page by clicking on the list sublink under AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetup_WLSE_css}
    Sleep  3s
    Click  ${AMPSetup_WLSE_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To AMP Setup ACS Page
    [Documentation]  Navigating to the AMP Setup - ACS page by clicking on the list sublink under AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetup_ACS_css}
    Sleep  3s
    Click  ${AMPSetup_ACS_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To AMP Setup NMS Page
    [Documentation]  Navigating to the AMP Setup - NMS page by clicking on the list sublink under AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetup_NMS_css}
    Sleep  3s
    Click  ${AMPSetup_NMS_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To AMP Setup Radius Accounting Page
    [Documentation]  Navigating to the AMP Setup - Radius Accounting page by clicking on the list sublink under AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetup_RadiusAccounting_css}
    Sleep  3s
    Click  ${AMPSetup_RadiusAccounting_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To AMP Setup PCI Compliance Page
    [Documentation]  Navigating to the AMP Setup - PCI Compliance page by clicking on the list sublink under AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetup_PCICompliance_css}
    Sleep  3s
    Click  ${AMPSetup_PCICompliance_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To AMP Setup External Server Page
    [Documentation]  Navigating to the AMP Setup - External Server page by clicking on the list sublink under AMP Setup link.
    Wait Until Element Is Visible  ${AMPSetup_ExternalServer_css}
    Sleep  3s
    Click  ${AMPSetup_ExternalServer_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To RAPIDS Page
    [Documentation]  Navigating to the RAPIDS page by clicking on the RAPIDS link.
    Wait Until Element Is Visible  ${RAPIDSLink_css}
    Sleep  3s
    Click  ${RAPIDSLink_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To RAPIDS Overview Page
    [Documentation]  Navigating to the RAPIDS - Overview page by clicking on the list sublink under RAPIDS link.
    Wait Until Element Is Visible  ${RAPIDS_Overview_css}
    Sleep  3s
    Click  ${RAPIDS_Overview_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To RAPIDS List Page
    [Documentation]  Navigating to the RAPIDS - List page by clicking on the list sublink under RAPIDS link.
    Wait Until Element Is Visible  ${RAPIDS_List_css}
    Sleep  3s
    Click  ${RAPIDS_List_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To RAPIDS IDS Events Page
    [Documentation]  Navigating to the RAPIDS - IDS Events page by clicking on the list sublink under RAPIDS link.
    Wait Until Element Is Visible  ${RAPIDS_IDSEvents_css}
    Sleep  3s
    Click  ${RAPIDS_IDSEvents_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To RAPIDS Setup Page
    [Documentation]  Navigating to the RAPIDS - Setup page by clicking on the list sublink under RAPIDS link.
    Wait Until Element Is Visible  ${RAPIDS_Setup_css}
    Sleep  3s
    Click  ${RAPIDS_Setup_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To RAPIDS Rules Page
    [Documentation]  Navigating to the RAPIDS - Rules page by clicking on the list sublink under RAPIDS link.
    Wait Until Element Is Visible  ${RAPIDS_Rules_css}
    Sleep  3s
    Click  ${RAPIDS_Rules_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To RAPIDS Score Override Page
    [Documentation]  Navigating to the RAPIDS - Score Override page by clicking on the list sublink under RAPIDS link.
    Wait Until Element Is Visible  ${RAPIDS_ScoreOverride_css}
    Sleep  3s
    Click  ${RAPIDS_ScoreOverride_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To RAPIDS Audit Log Page
    [Documentation]  Navigating to the RAPIDS - Audit Log page by clicking on the list sublink under RAPIDS link.
    Wait Until Element Is Visible  ${RAPIDS_AuditLog_css}
    Sleep  3s
    Click  ${RAPIDS_AuditLog_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Visual RF Page
    [Documentation]  Navigating to the Visual RF page by clicking on the Visual RF link.
    Wait Until Element Is Visible  ${VisualRFLink_css}
    Sleep  3s
    Click  ${VisualRFLink_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Visual RF Floor Plan Page
    [Documentation]  Navigating to the Visual RF - Floor Plan page by clicking on the list sublink under Visual RF link.
    Wait Until Element Is Visible  ${VisualRF_FloorPlan_css}
    Sleep  3s
    Click  ${VisualRF_FloorPlan_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Visual RF Setup Page
    [Documentation]  Navigating to the Visual RF - Setup page by clicking on the list sublink under Visual RF link.
    Wait Until Element Is Visible  ${VisualRF_Setup_css}
    Sleep  3s
    Click  ${VisualRF_Setup_css}
    Wait Until Element Is Not Visible  ${loader}  30s
   
    
Navigate To Visual RF Import Page
    [Documentation]  Navigating to the Visual RF - Import page by clicking on the list sublink under Visual RF link.
    Wait Until Element Is Visible  ${VisualRF_Import_css}
    Sleep  3s
    Click  ${VisualRF_Import_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Visual RF Audit Log Page
    [Documentation]  Navigating to the Visual RF - Audit Log page by clicking on the list sublink under Visual RF link.
    Wait Until Element Is Visible  ${VisualRF_AuditLog_css}
    Sleep  3s
    Click  ${VisualRF_AuditLog_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Header New Devices Page
    [Documentation]  Navigating to the New Device page by clicking on the New Device Header link.
    Wait Until Element Is Visible  ${Header_NewDevice_css}
    Sleep  3s
    Click  ${Header_NewDevice_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Header Up Devices Page
    [Documentation]  Navigating to the Up Device page by clicking on the Up Device Header link.
    Wait Until Element Is Visible  ${Header_UpDevice_css}
    Sleep  3s
    Click  ${Header_UpDevice_css}
    Wait Until Element Is Not Visible  ${loader}  30s

Navigate To Header Up Wired Devices Page
    [Documentation]  Navigating to the Up Wired Device page by clicking on the Up Wired Device Header link.
    Wait Until Element Is Visible  ${Header_UpWiredDevice_css}
    Sleep  3s
    Click  ${Header_UpWiredDevice_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Header Down Devices Page
    [Documentation]  Navigating to the Down Device page by clicking on the Down Device Header link.
    Wait Until Element Is Visible  ${Header_DownDevice_css}
    Sleep  3s
    Click  ${Header_DownDevice_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Header Down Wired Devices Page
    [Documentation]  Navigating to the Up Wired Device page by clicking on the Up Wired Device Header link.
    Wait Until Element Is Visible  ${Header_DownWiredDevice_css}
    Sleep  3s
    Click  ${Header_DownWiredDevice_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Header Rogue Page
    [Documentation]  Navigating to the Up Wired Device page by clicking on the Up Wired Device Header link.
    Wait Until Element Is Visible  ${Header_Rogue_css}
    Sleep  3s
    Click  ${Header_Rogue_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Header Clients Page
    [Documentation]  Navigating to the Up Wired Device page by clicking on the Up Wired Device Header link.
    Wait Until Element Is Visible  ${Header_Clients_css}
    Sleep  3s
    Click  ${Header_Clients_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Navigate To Header Alerts Page
    [Documentation]  Navigating to the Up Wired Device page by clicking on the Up Wired Device Header link.
    Wait Until Element Is Visible  ${Header_Alerts_css}
    Sleep  3s
    Click  ${Header_Alerts_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Click on the SubHeader Link
    [Documentation]  Navigating to the Up Wired Device page by clicking on the Up Wired Device Header link.
    Wait Until Element Is Visible  ${Header_SubHeader_css}
    Sleep  3s
    Click  ${Header_SubHeader_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    
Assert RAPIDS Tab Displayed
    [Documentation]  Verify the RAPIDS tab is displayed.
    Wait Until Element Is Visible  ${sideMenu}  30s
    Sleep  3s
    ${isDisplayed}  Run Keyword And Return Status  Page Should Contain Link  ${RAPIDSLink_css}
    [Return]  ${isDisplayed}
    
Navigate To TOP Folder page
    [Documentation]  Navigating to TOP folder page.
    ...    
    Navigate To Home Page
    Wait Until Element Is Visible  ${sideMenu}  30s
    Sleep  3s
    Focus Element  ${Home_TOP_FolderLink_Xpath}
    Sleep  3s
    Click  ${Home_TOP_FolderLink_Xpath}
    WaitForPageLoading
    Sleep  5s
    AssertForElementPresent  ${Home_TOP_FolderLoc_css}
    
Go To Folder
    [Arguments]    ${folder} 
    DOMreadyByWaitTime  3
    Select From Dropdown List  //*[@name="jump_off"]  ${folder}
    WaitForPageLoading
    Sleep  5s 

    
Get First ROW Username
    DOMreadyByWaitTime  3
    ${columns}  Get Element Count  //tr/th/div[contains(text(),'Username')]/ancestor::th/preceding-sibling::th
    ${column}  Evaluate  ${columns}+1
    ${username}  Get Element Text  //div[@class='m_table']//tr[1]/td[${column}]
    [return]  ${username}
    
Get First ROW MAC Address
    DOMreadyByWaitTime  3
    ${columns}  Get Element Count  //tr/th/div[contains(text(),'MAC Address')]/ancestor::th/preceding-sibling::th
    ${column}  Evaluate  ${columns}+1
    ${MACAddress}  Get Element Text  //div[@class='m_table']//tr[1]/td[${column}]/a
    [return]  ${MACAddress}
    
Search By
    [Arguments]    ${value} 
    DOMreadyByWaitTime  3
    Click using Javascript  div.icon_search
    DOMreadyByWaitTime  3
    Type  input#search_input  ${value}
    DOMreadyByWaitTime  3
    Click using Javascript  label.icon_search.icon_search_popup
    DOMreadyByWaitTime  3
    AssertForElementPresent  //div[@role='dialog']
    

    ### Ram Kiran code  ###


Navigate To Visual RF Setup Page1
    [Documentation]  Navigating to the Visual RF - Setup page by clicking on the list sublink under Visual RF link.
    Wait Until Element Is Visible  ${VisualRF_Setup_css}
    Sleep  3s
    Click  ${VisualRF_Setup_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    ${status}  Run Keyword and return status  Radio button should be set to  visualrf_enabled_1  0
    Run Keyword if  "${status}"=="False"  Log  VRF enabled!  console=True
    ...  ELSE  Enable VRF

Enable VRF
    Click  ${VisualRF_Yesbutton}
    Click  ${visibility_css}
    Click  ${VisualRF_Savebutton}
    Sleep  10s
    Click  ${VisaulRFChange}
    Sleep  10s
    ${output}=  Get Element Text  ${VisualRF_confirmmsg}
    log  ${output}  console=True
    Should Be Equal As Strings  ${output}  ${expectedoutput_VRF}   
    

Navigate To Visual RF Floor Plan Page1
    [Documentation]  Navigating to the Visual RF - Floor Plan page by clicking on the list sublink under Visual RF link.
    Wait Until Element Is Visible  ${VisualRF_FloorPlan_css}
    Sleep  3s
    Click  ${VisualRF_FloorPlan_css}
    Wait Until Element Is Not Visible  ${loader}  30s
    Sleep  60s 
    #Click  link=Home
    Navigate To Home Page
    Navigate To Visual RF Page 
    sleep  20s
   # Reload page    
   # Sleep  30s
   
   Wait until keyword succeeds  3 min  10 s  scroll element into view  ${defaultcampus_xpath}
    Wait Until Element Is Visible  ${defaultcampus_xpath}  60s
    Sleep  2s  
    
    #Click  ${VisualRF_FloorPlan_css}
   # Click  ${VisualRFLink_css}
  #  Wait until keyword succeeds  1 min  5 sec  element should be visible ${defaultcampus_xpath}
    #Click  ${VisualRF_FloorPlan_css}
    ${output1}=  Get Text  ${defaultcampus_xpath}  
    log  ${output1}  console=True
    Should Be Equal As Strings  ${output1}  ${expectedvalue} 
    
Check for Creation of Campus
    [Arguments]  ${CampusName}
    [Documentation]  Check for Creation of campus in Airwave page
    Sleep  5s
    Scroll element into view  ${editbutton_css}
   # Execute JavaScript    window.scrollTo(0,0)
    Click  ${editbutton_css} 
    Click  ${newcampus_css}
    Type  ${Campus_Xpath}  ${CampusName}
   # ${gettext}=  Get Text  ${campus_name}
   # log   ${gettext}
    Click  ${Save_button}
    
Check for Creation of Buidling
    [Documentation]  Check for Creation of Building in the campus
    [Arguments]  ${CampusName}  ${buidlingadd_value}  ${latitude_value}  ${longitude value}
    ${SelectCampus}  Catenate  ${Loc_SelectCampus_xpath}  text()='${CampusName}']
    Double Click  ${SelectCampus}
    Sleep  5s
   # Double Click  ${campusclick_css}
    Click  ${editbutton_css}
    Sleep  5s
    Click  ${new_building}
    Sleep  5s
    Type  ${Campus_Xpath}  ${CampusName}
    Type  ${buildingaddress_xpath}  ${buidlingadd_value}
    Type  ${latitude xpath}  ${latitude_value}
    Type  ${longitude xpath}  ${longitude value}  
  #  Type  css=div.vrf_input textarea[style='']  "123"
   # Sleep  10s
   # Type  ${campus_name1}  ${textvalue}
   
   # Sleep  5s
    Click  ${Save_button} 
    
#Compare Groups with data
 
  #  Click  ${compareclick_css}  
    
    
Check for Creation of New Floor
    [Arguments]  ${CampusName}
    [Documentation]  Check for Creation of New Floor
    ${SelectCampus}  Catenate  ${Loc_SelectCampus_xpath}  text()='${CampusName}']
    Double Click  ${SelectCampus}
    Sleep  5s
    Click  ${editbutton_css}
   # Click  ${BuildingClick_css}
    Sleep  5s
   # Click  ${editbutton_css}
    Click  ${New_FloorPlan}
    Sleep  5s
    Choose File  ${choose_img}  ${img_location}
    Click  ${Save_button}
    Click  ${Finish_button}
    
Check for AP Overlays Present
  #  ${sidenavmenus}=  Get Element Text  ${sidenav_menu}
  #  log  ${sidenavmenus}
     @{list}  Create List  ${col1}  ${col2}  ${col3}  ${col4}  ${col5}  ${col6}
     ${state}  Set Variable  True
     @{search_result}    Get WebElements    ${sidenav_menu}
     :FOR  ${var1}  IN  @{search_result}
    \    log  ${var1.text}  console=True
     \    ${status}=  Run Keyword And Return Status  List Should Contain Value  ${list}  ${var1.text}
    \    Log  ${status}  console=True
    \    ${state}  Set Variable If  '${Status}'=='False'  False  ${state}
    #      \
    Should be true  ${state} 
    
Check for the elements present in AP Overlays
   # Click  xpath=//*[contains(@class,'vrf_titled_widget_title') and text()='AP Overlays'] 
    @{list}  Create List  ${Attr1}  ${Attr2}  ${Attr3}  ${Attr4}  ${Attr5}  
    ${state}  Set Variable  True
    @{search_result1}    Get WebElements    ${sidenav_menu1}
   # @{search_result2}    Split String  ${search_result1}  \n
    :FOR  ${var1}  IN  @{search_result1}
   # \    log  ${var1.text}  console=True
    \    ${search_result2}    Split String  ${var1.text}  \n
    \    log  ${search_result2}  
       
  #   \    ${status}=  Run Keyword And Return Status  List Should Contain Value  ${list}  ${var1.text}  
  #  \    Log  ${status}  console=True
  #  \    ${state}  Set Variable If  '${Status}'=='False'  False  ${state}
    #      \
    Should be true  ${state} 
    
Create a New Group with Status Polling
    [Documentation]  Creating a new group to AMP in 'Groups - Add' page.
    ...    
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
     
         
    
Compare 2 Groups
    [Arguments]  ${GroupsName1}  ${Pollingtime}  ${Groupname2}
    
    Navigate To Group Page
   # Create a New Group with Status Polling  ${GroupsName1}  ${StatusPolling}  
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
    

Create a Customised Trigger
    [Documentation]  Create a Customised Trigger in Airwave
    [Arguments]  ${TriggerList}  ${SeverityValue}
    Click  ${System_link}
    Sleep  10s
    Click  ${Trigger_link}
    Sleep  10s
    Scroll element into view  ${button_css}
    Click  ${button_css}
    Select Dropdown LabelValue  ${Typedropdown_css}  ${TriggerList}
    Select Dropdown LabelValue  ${Severity_css}  ${SeverityValue}
    Type  ${value_css}  5
    Click  ${Add_Button}
    
Check for success message
    ${outputvalue}=  Get Text  ${Confirmmsg_xpath}  
    log  ${outputvalue}  console=TRUE
    [Return]  ${outputvalue}
    
## need to check with satish this one
    
Check for the Alerts generated in the page
    Click  ${Alerts_link}
    Sleep  5s
    ${outputvalue}=  Get Text  css=tr.inactive_row.pencil  
    log  ${outputvalue}  console=TRUE
    Should Contain Any  ${outputvalue}  'Disk Usage Partition Percent Used >= 5%'
    


    	
Add deployed devices
    [Arguments]  ${CampusName}
    ${SelectCampus}  Catenate  ${Loc_SelectCampus_xpath}  text()='${CampusName}']
    Double Click  ${SelectCampus}
    sleep  5s
    Click  ${Loc_ViewButton}
    sleep  3s
    Click  ${Loc_SelectBuilding}/*[text()='${CampusName}']
    sleep  5s
    Click  ${Loc_ViewButton}
    sleep  3s
    click  ${Loc_SelectFloor}
    sleep  5s
    Click  ${editbutton_css}
    sleep  3s
    Click  ${Loc_AddDeployedDevices}
    sleep  30s
    Wait Until Element Is Not Visible  ${loader}  50s
    Click  ${Loc_Drag_Xpath}
    Drag and Drop  ${Loc_Drag_Xpath}  ${Loc_Drop_Xpath}
    sleep  3s
    

  
Delete existing Devices
    Click  ${Loc_NewDevice_Header}
    DOMreadyByWaitTime  3
    Click  ${Loc_DeviceActionDropdowm}
    DOMreadyByWaitTime  2
    Click  ${Loc_selectDeleteDevice}
    DOMreadyByWaitTime  2
    Click  ${Loc_DeviceCheckbox}
    Click  ${Loc_DeviceDeleteButton}
    DOMreadyByWaitTime  5
    Click  ${Loc_ApplyChangesButton}
    Wait Until Element Is Not Visible  ${loader}  30s
  

Check for topology
    DOMreadyByWaitTime  3
    Wait Until Element Is Not Visible  ${loader}  30s
    AssertForElementPresent  ${Loc_Topology_graph}
    Log  Topology Present!  console=True
    
Check View and Filter options
    Get Selected view layout option
    Get Selected Filter options
    
Get Selected view layout option
    Click  ${Loc_View_xpath}
    DOMreadyByWaitTime  3
    ${Selectedlayout}  get text  ${Loc_LayoutSelected}
    Log  ${Selectedlayout} Layout selected  console=true
    
Get Selected Filter options
    Click  ${Loc_Filter_xpath}
    DOMreadyByWaitTime  3
    @{filterdevices}  create list
    @{devicesList}  Get WebElements  //*[@class="task action ng-scope selected"]/*/*
    :FOR  ${dev}  IN  @{devicesList}
    \    ${device}  Get Element Text  ${dev}
    \    Append to List  ${filterdevices}  ${device}
    \    Log  ${device}  console=True
    Log  Filter options selected!  console=True
   
    
    
                                                                                                                                              