*** Variables ***
${loader}  xpath=//div[@class='page inner_wrap loading_background relative']  

${sideMenu}  css=div#amp-nav
${HomeLink_css}  css=a.home.ng-binding
${Home_Overview_css}  css=a[ng-class='overview']
${Home_TrafficAnalysis_css}  css=a[ng-class='traffic_analysis']
${Home_UCC_css}  css=a[ng-class='ucc']
${Home_RF_Performance_css}  css=a[ng-class='rf_performance']
${Home_RF_Capacity_css}  css=a[ng-class='rf_capacity']
${Home_Airmatch_css}  css=a[ng-class='airmatch']
${Home_Clarity_css}  css=a[ng-class='clarity']
${Home_Topology_css}  css=a[ng-class='topology']
${Home_Network_Deviations_css}  css=a[ng-class='network_deviations']
${Home_Documentation_css}  css=a[ng-class='documentation']
${Home_License_css}  css=a[ng-class='license']
${Home_User_Info_css}  css=a[ng-class='user_info']
${Home_TOP_FolderLink_Xpath}  xpath=//span[text()='Top']
${Home_TOP_FolderPage_css}  css=select[name='jump_off']
${Home_TOP_FolderLoc_css}  css=div.add_margin b
${GroupLink_css}  css=a.groups.ng-binding
${Group_List_css}  css=a[ng-class='list']
${Group_ConfigAuditJobs_css}  css=a[ng-class='config__audit_jobs']
${DeviceLink_css}  css=a.devices.ng-binding
${Device_List_css}  css=a[ng-class='list']
${Device_New_css}  css=a[ng-class='new']
${Device_Up_css}  css=a[ng-class='up']
${Device_Down_css}  css=a[ng-class='down']
${Device_Mismatched_css}  css=a[ng-class='mismatched']
${Device_Ignored_css}  css=a[ng-class='ignored']
${Device_ControllerClusters_css}  css=a[ng-class='controller_clusters']
${ClientsLink_css}  css=a.clients.ng-binding
${Clients_Overview_css}  css=a[ng-class='overview']
${Clients_Connected_css}  css=a[ng-class='connected']
${Clients_All_css}  css=a[ng-class='all']
${Clients_RogueClients_css}  css=a[ng-class='rogue_clients']
${Clients_GuestUsers_css}  css=a[ng-class='guest_users']
${Clients_VPNSessions_css}  css=a[ng-class='vpn_sessions']
${Clients_VPNUsers_css}  css=a[ng-class='vpn_users']
${Clients_Tags_css}  css=a[ng-class='tags']
${ReportsLink_css}  css=a.reports.ng-binding
${Reports_Generated_css}  css=a[ng-class='generated']
${Reports_Definitions_css}  css=a[ng-class='definitions']
${SystemLink_css}  css=a.system.ng-binding
${System_Status_css}  css=a[ng-class='status']
${System_SyslogTraps_css}  css=a[ng-class='syslog__traps']
${System_EventLog_css}  css=a[ng-class='event_log']
${System_Triggers_css}  css=a[ng-class='triggers']
${System_Alerts_css}  css=a[ng-class='alerts']
${System_Backups_css}  css=a[ng-class='backups']
${System_ConfigurationChangeJobs_css}  css=a[ng-class='configuration_change_jobs']
${System_FirmwareUpgradeJobs_css}  css=a[ng-class='firmware_upgrade_jobs']
${System_DRTUpgradeJobs_css}  css=a[ng-class='drt_upgrade_jobs']
${System_Performance_css}  css=a[ng-class='performance']
${System_DownloadLogFiles_css}  css=a[ng-class='download_log_files']
${DeviceSetupLink_css}  css=a.device_setup.ng-binding
${DeviceSetup_Discover_css}  css=a[ng-class='discover']
${DeviceSetup_Add_css}  css=a[ng-class='add']
${DeviceSetup_Communication_css}  css=a[ng-class='communication']
${DeviceSetup_ZTPOrchestrator_css}  css=a[ng-class='ztp_orchestrator']
${DeviceSetup_UploadFirmwareFiles_css}  css=a[ng-class='upload_firmware__files']
${DeviceSetup_Certificates_css}  css=a[ng-class='certificates']
${AMPSetupLink_css}  css=a.amp_setup.ng-binding
${AMPSetup_General_css}  css=a[ng-class='general']
${AMPSetup_Network_css}  css=a[ng-class='network']
${AMPSetup_Users_css}  css=a[ng-class='users']
${AMPSetup_Roles_css}  css=a[ng-class='roles']
${AMPSetup_Authentication_css}  css=a[ng-class='authentication']
${AMPSetup_MDMServer_css}  css=a[ng-class='mdm_server']
${AMPSetup_DeviceTypeSetup_css}  css=a[ng-class='device_type_setup']
${AMPSetup_WLSE_css}  css=a[ng-class='wlse']
${AMPSetup_ACS_css}  css=a[ng-class='acs']
${AMPSetup_NMS_css}  css=a[ng-class='nms']
${AMPSetup_RadiusAccounting_css}  css=a[ng-class='radius_accounting']
${AMPSetup_PCICompliance_css}  css=a[ng-class='pci_compliance']
${AMPSetup_ExternalServer_css}  css=a[ng-class='external_server']
${RAPIDSLink_css}  css=a.rapids.ng-binding
${RAPIDS_Overview_css}  css=a[ng-class='overview']
${RAPIDS_List_css}  css=a[ng-class='list']
${RAPIDS_IDSEvents_css}  css=a[ng-class='ids_events']
${RAPIDS_Setup_css}  css=a[ng-class='setup']
${RAPIDS_Rules_css}  css=a[ng-class='rules']
${RAPIDS_ScoreOverride_css}  css=a[ng-class='score_override']
${RAPIDS_AuditLog_css}  css=a[ng-class='audit_log']
${VisualRFLink_css}  css=a.visualrf.ng-binding
${VisualRF_FloorPlan_css}  css=a[ng-class='floor_plans']
${VisualRF_Setup_css}  css=a[ng-class='setup']
${VisualRF_Import_css}  css=a[ng-class='import']
${VisualRF_AuditLog_css}  css=a[ng-class='audit_log']
${Header_NewDevice_css}  css=a#app-header-stats-new_count div
${Header_UpDevice_css}  css=a#app-header-stats-up div
${Header_UpWiredDevice_css}  css=a#app-header-stats-up_wired div
${Header_DownDevice_css}  css=a#app-header-stats-down div
${Header_DownWiredDevice_css}  css=a#app-header-stats-down_wired div
${Header_Rogue_css}  css=a#app-header-stats-rogue div
${Header_Clients_css}  css=a#app-header-stats-client_count div
${Header_Alerts_css}  css=a#app-header-stats-alerts div
${Header_SubHeader_css}  div.app-subheader-td-div

##  ramkiran code  ###
${visibility_css}  css=#vrf_restrict_empty_floorplan_visibility_1_1[type='radio'][value='1']

${VisualRF_Yesbutton}  css=#visualrf_enabled_1_1[type='radio'][name='visualrf_enabled_1']  
${VisualRF_Savebutton}  css=[name='save'][type='submit']
${VisaulRFChange}  css=[value='Apply Changes Now'][type='submit'][name='save']
${VisualRF_confirmmsg}  css=p.icofirst.icon_confirmed.ok
${expectedoutput_VRF}  Settings have been saved.
${defaultcampus_xpath}  xpath=//*[contains(@class,'vrf_icon_title airwave_tooltip') and text()='Default Campus'] 
${expectedvalue}  Default Campus
#${editbutton_css}  css=div.vrf_menu_tab:nth-of-type(3) 
${editbutton_css}  xpath=//div[@class="vrf_tab_bar vrf_tab_bar-vertical"]/*[contains(text(),'Edit')] 
${viewbutton_css}  //div[@class="vrf_tab_bar vrf_tab_bar-vertical"]/*[contains(text(),'View')]
${newcampus_css}  css=div.vrf_action_link:nth-of-type(5)
${Campus_Xpath}  //div[@class='mwx_dialog-content']//div[@class='vrf_input']/input[@type='text'][1]
${Save_button}  css=button[value='save'][title='']
${campus_name1}  //div[@class='mwx_dialog-content']//div[@class='vrf_input']/input[@type='text'][2]
${BuildingClick_css}  (//div[@class='vrf_icon_title airwave_tooltip' and contains(text(),'Testcampus10')])
${new_building}  css=div div.vrf_action_link:nth-of-type(5)
${New_FloorPlan}  css=div div.vrf_action_link:nth-of-type(4)
${campusclick_css}  xpath=(//div[@class='vrf_icon_title airwave_tooltip' and contains(text(),'Testcamp23')])
${buildingaddress_xpath}  xpath=(//*[@class="vrf_info_table"]//*[@class="vrf_input"])[2]/*
${latitude xpath}  xpath=(//*[@class="vrf_info_table"]//*[@class="vrf_input"])[3]/*
${longitude xpath}  xpath=(//*[@class="vrf_info_table"]//*[@class="vrf_input"])[4]/*
${choose_img}  css=input.file_input_elem[type='file']
${img_location}  C:\\Users\\Keerthina\\eclipse-workspace\\Airwave_jun21\\TestArgu\\aruba.png
${Finish_button}  xpath=//*[contains(text(),'Finish')]
${sidenav_menu}  xpath=//*[contains(@class,'vrf_titled_widget_title')]
${sidenav_menu1}  xpath=//*[contains(text(),'AP Overlays')]//following-sibling::*//*[@class="vrf_checkedbutton-content"]
${compareclick_link}  link=Compare two groups
${Loc_AddGroupButton_css1}   css=input[name='groups_go_to_add']
${Loc_AddGroupNameField_css1}  css=input[name='name'] 
${Loc_AddGroupAddButton_css1}  css=input[name='groups_add']
${polling_css}  xpath=//*[contains(@id,'poll_period_up_down')]
${savebutton_css}  css=[name='apply'][type='submit'][value='Save and Apply']
${Applybutton_css}  css=[name='confirm'][value='Apply Changes Now']
${cmp_grp1}  css=select#id.selectBox[name='id']
${cmp_grp2}  css=select.selectBox[name='other_group_id']
${Comparebutton}  css=[name='compare'][type='submit'][value='Compare']
#${polling_period}  xpath=//*[contains(text(),'Up/Down Status Polling Period')]/following-sibling::td
${polling_period}  xpath=//*[contains(text(),'Up/Down Status Polling Period')]/following-sibling::td[@class]
${System_link}  link=System
${Trigger_link}  css=.ng-binding[href='/triggers'][ng-class='triggers']
${button_css}  css=[type='submit'][value='Add']
${Typedropdown_css}  css=select.selectBox[name='type']
${Severity_css}  css=select.selectBox[name='severity']
${value_css}  css=textarea.selectBox[name='value_new1']
${Add_Button}  css=[type='submit'][value='Add']
${Confirmmsg_xpath}  xpath=//*[contains(@class,'icofirst icon_confirmed ok')]
${Alerts_link}  css=[href='/alerts'] p.header_name


###  abhi code  ###
### Device discover
${Loc_Add_scan_network}  //*[@class="small button" and @name="network_go_to_add"]
${Loc_name_input}  //*[@type="text" and @name="name"]
${Loc_network_input}  //*[@type="text" and @name="network"]
${Loc_mask_input}  //*[@type="text" and @name="netmask"]
${Loc_add_network}  //*[@class="small button" and @name="network_add"]
${Loc_networkaddedsuccessful}  //*[contains(text(),'New Scan Network added successfully.')]
${Loc_Add_scan_credential}  //*[@class="small button" and @name="credential_go_to_add"]
${Loc_Type_dropdown}  //*[@name="type"]
${Loc_Communitystring}  //*[@type="password" and @name="secret_snmp"]
${Loc_Communitystring_cnfrm}  //*[@type="password" and @name="secret_snmp_confirm"]
${Loc_add_credential}  //*[@class="small button" and @name="credential_add"]
${Loc_credentialaddedsuccessful}  //*[contains(text(),'New Scan Credential added successfully.')]
${Loc_Add_scan_set}  //*[@class="small button" and @name="scan_set_go_to_add"]
${Loc_Network_scan_set}  //*[contains(text(),'Network')]/parent::*
${Loc_Credentials_scan_set}  //*[contains(text(),'Credentials')]/parent::*
${Loc_add_set}  //*[@class="small button" and @name="scan_set_add"]
${Loc_scansetaddedsuccessful}  //*[contains(text(),'New Scan Set added successfully.')]
${Loc_scan_addScanset}  //*[@name="scan_set_del_form"]
${Loc_scan_Checkbox}  /parent::*//*[@type="checkbox"]
${Loc_Refreshbutton}  //*[contains(text(),'Refresh')]
${Loc_Scan_button}  //*[@type="submit" and @value="Scan"]


### Add Certificate
${Add_NewCertButton}  //*[@class="small button" and @name="go_to_add"]
${Loc_certificateAddedSuccess}  //*[contains(text(),'New Certificate added successfully.')]
${Loc_CertName}  //*[@type="text" and @name="name"]
${Choose_file}  //*[contains(@name,'file_upload')]
${TrustedCert_location}  C:\\Users\\Keerthina\\eclipse-workspace\\Airwave_jun21\\TestArgu\\trust_cert_root.cer
${formatDropdown}  //*[@name="format"]
${CertType}  //*[@name="type"]
${Add_cert}  //*[@class="small button" and @name="add"]
${MultiIntermediateCert_location}  C:\\Users\\Keerthina\\eclipse-workspace\\Airwave_jun21\\TestArgu\\multiinter.cer
${IntermediateCert_location}  C:\\Users\\Keerthina\\eclipse-workspace\\Airwave_jun21\\TestArgu\\inter1.cer




# abhi
${Loc_New_Report}  xpath=//input[@name='definitions_go_to_add']
${Loc_Report_Title}  css=input[name='title']
${Loc_Report_Type}  xpath=//select[@id='type']
${Loc_Report_Start}  xpath=//*[contains(text(),'Report Start:')]/parent::*//*[@type="text"]
${Loc_Report_Stop}  xpath=//*[contains(text(),'Report End:')]/parent::*//*[@type="text"]
${Loc_Report_AddandRun}  xpath=//input[@name='definitions_do_and_run']
${Loc_added_report}  xpath=//*[contains(text(),'Device Summary Sanity')]
${Loc_ReportSearch}  //*[@name="reports_search_title"]

${Loc_Generated_Report}  xpath=//a[contains(text(),'Device Summary Sanity')]

${Device_config_xpath}  //*[@ng-class="config"]
${Loc_Audit_button}  //*[@class="small button" and @value="Audit"]
${Loc_Verifying_config_status}  //*[contains(text(),'Verifying')]
${Loc_Good_config_status}  //*[contains(text(),'Good')]

${Loc_SelectCampus_xpath}  //div[@class='vrf_icon_title airwave_tooltip' and
${Loc_ViewButton}  //div[@class="vrf_tab_bar vrf_tab_bar-vertical"]/*[contains(text(),'View')]
${Loc_SelectBuilding}  //div[@class="vrf_link vrf_input fake_link"]
${Loc_SelectFloor}  //div[@class="vrf_link vrf_input fake_link"]/*
${Loc_AddDeployedDevices}  //*[@title="Add Deployed Devices"]
${Loc_Drag_Xpath}  (//*[contains(@class,"deployeddeviceadd")]/parent::*/*[@class="goog-tree-item-label"])[1]
${Loc_Drop_Xpath}  //*[@id="vrf_drawing_control"]


${Loc_NewDevice_Header}  //*[contains(text(),'NEW DEVICES')]
${Loc_DeviceActionDropdowm}  //*[contains(@class,'device_actions')]//*[contains(@class,"button-inner-box")]
${Loc_selectDeleteDevice}  //*[text()='Delete Selected Devices']
${Loc_DeviceCheckbox}  //*[@class="title" and @key="name"]/parent::*/preceding-sibling::*/*
${Loc_DeviceDeleteButton}  //button[text()='Delete']
${Loc_ApplyChangesButton}  css=input.button.small[name='confirm']



${Loc_Topology_graph}  //*[@class="vis-network"]/canvas
${Loc_View_xpath}  //*[contains(text(),'View')]
${Loc_LayoutSelected}  //*[@class="task action ng-scope selected"]/*/*
${Loc_Filter_xpath}  //*[contains(text(),'Filter')]
${Loc_FilterDevices}  //*[@class="task action ng-scope selected"]/*/*/following-sibling::text()



