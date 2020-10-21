*** Variables ***
###Menu Links
${Loc_AMPSetup_GeneralLink}  css=a[ng-class='general']
${Loc_AMPSetup_NetworkLink}  css=a[ng-class='network']
${Loc_AMPSetup_UsersLink}  css=a[ng-class='users']
${Loc_AMPSetup_RolesLink}  css=a[ng-class='roles']
${Loc_AMPSetup_AuthenticationLink}  css=a[ng-class='authentication']
${Loc_AMPSetup_MDMServerLink}  css=a[ng-class='mdm_server']
${Loc_AMPSetup_DeviceTypeSetupLink}  css=a[ng-class='device_type_setup']
${Loc_AMPSetup_WLSELink}  css=a[ng-class='wlse']
${Loc_AMPSetup_ACSLink}  css=a[ng-class='acs']
${Loc_AMPSetup_NMSLink}  css=a[ng-class='nms']
${Loc_AMPSetup_RADIUSAccountingLink}  css=a[ng-class='radius_accounting']
${Loc_AMPSetup_PCIComplianceLink}  css=a[ng-class='pci_compliance']
${Loc_AMPSetup_ExternalServerLink}  css=a[ng-class='external_server']
##Add Rules
${Loc_AMPSetup_AddRole}  css=input[name='go_to_add']
${Loc_AMPSetup_AddRolePage_AdminPassword}  css=input[name='current_password']
${Loc_AMPSetup_AddRolePage_RoleName}  css=input[name='name']
${Loc_AMPSetup_AddRolePage_AMPAccessLevel}  css=select#amp_access_level
${Loc_AMPSetup_AddRolePage_AMPDeviceAccessLevel}  css=select#ap_access_level
${Loc_AMPSetup_AddRolePage_AMPFolderAccessLevel}  css=select#easy_top_folder_selector
${Loc_AMPSetup_AddRolePage_AMPRAPIDSAccessLevel}  css=select#rapids
${Loc_AMPSetup_AddRolePage_AMPVRFAccessLevel}  css=select#visualrf
${Loc_AMPSetup_AddRolePage_AMPAddButton}  css=input[name='add']
${Loc_AMPSetup_AddRolePage_AMPCancelButton}  css=input[name='cancel']
${Loc_AMPSetup_RoleTable_DeleteButton}  css=input[name='delete']
###Add User
${Loc_AMPSetup_AddUser}  css=input[name='go_to_add']
${Loc_AMPSetup_AddUserPage_AdminPassword}  css=input[name='current_password']
${Loc_AMPSetup_AddUserPage_Username}  css=input[name='username']
${Loc_AMPSetup_AddUserPage_Role}  css=select#role_id
${Loc_AMPSetup_AddUserPage_Password}  css=input[name='password']
${Loc_AMPSetup_AddUserPage_ConfirmPassword}  css=input[name='password_confirm']
${Loc_AMPSetup_AddUserPage_Name}  css=input[name='full_name']
${Loc_AMPSetup_AddUserPage_Email}  css=input[name='email']
${Loc_AMPSetup_AddUserPage_Phone}  css=input[name='phone']
${Loc_AMPSetup_AddUserPage_Notes}  css=textarea[name='notes']
${Loc_AMPSetup_AddUserPage_AddButton}  css=input[name='add']
${Loc_AMPSetup_AddUserPage_CancelButton}  css=input[name='cancel']
${Loc_AMPSetup_UserTable_DeleteButton}  css=input[name='delete']


### Code By abhi/ram
#${Loc_NewDevices_header}  //*[@class="header_name" and contains(text(),'NEW DEVICES')]
${Loc_TopHeader}  //*[@class="title_heading icon_arrow_down" and contains(text(),'Top Header')]
${Loc_VPNusers_checkbox}  //label[contains(.,'VPN Users')]/*
${Loc_Save}  //*[@class="small button" and @name="save"]
${Loc_VPNusers_header}  //*[@class="header_name" and contains(text(),'VPN USERS')]

${Loc_FirmwareReboot}  //*[@class="title_heading icon_arrow_down" and contains(text(),'Firmware')]
${Loc_FirmwareRadioButton}  //*[@id="monitor_only_upgrades_1_1"]
${Loc_icon_search}  //*[@class="icon_search"]
${Loc_search_input_xpath}  //*[@id="search_input"]
${Loc_searchinput_value}  aruba
${Loc_searchPopup}  //*[@class="icon_search icon_search_popup"]
${UpStatus_Devices}  (//*[@class="panel table rounded white no_pad" and not(contains(@style,'display: none;'))]//*[@title="Up"]/parent::*/td)[1]
${Device_manage_xpath}  //*[@ng-class="manage"]
${Device_info}  //*[contains(text(),'Monitor Only + Firmware Upgrades')]


${Loc_AutomaticAuthorization}  //*[@class="title_heading icon_arrow_down" and contains(text(),'Automatic Authorization')]
${Loc_APWhitelistRadioButton}  //*[@id="ap_white_list_disabled_1_0"]
${Loc_SwitchWhitelistRadioButton}  //*[@id="switch_white_list_disabled_1_0"]
${Loc_settingsSavedsuccessfull}  //*[contains(text(),'Settings have been saved.')]
${Loc_Whitelist_dropdown}  //*[@id="whitelist_ap_action_selector"]

${Loc_AdditionalSettings}  //*[@class="title_heading icon_arrow_down" and contains(text(),'Additional AMP Services')]
${Loc_AMONvsSNMPpoll_grpname}  use_amon_vs_snmp_1
${Loc_AMONvsSNMP_value}  1

${Loc_Performance}  //*[@class="title_heading icon_arrow_down" and contains(text(),'Performance')]
${Loc_ClientRelevanceFactor}  //*[contains(text(),'Client Association Relevance')]/parent::*//*[@type="text"]


### Client Detail
${Loc_Clients}  //*[@id="clients_button"]
#${Loc_SelectClient}  //*[@class="panel table rounded white no_pad" and not(contains(@style,'display: none;'))]//td[1]
${Loc_SelectClient}  (//*[@id="results_container"]/*[@class="panel table rounded white no_pad" and not(contains(@style,'display: none;'))]//td[@class="fake_link"])[1]
${Loc_Client_detail}  //*[@ng-class="client_detail"]
${Loc_UCC_Calls}  //*[contains(text(),'UCC Calls')]/ancestor::h4//following-sibling::*[2]//*[@class="total_row_count"]
${Loc_Clarity_data}  //*[contains(text(),'Clarity')]/ancestor::h4//following-sibling::*//*[@class="panel table rounded white no_pad"]

### Client Diagnostics Page
${Loc_ClientDiagnostics}  //*[@ng-class="diagnostics"]
${Loc_Clients_header}  //*[@class="header_name" and contains(text(),'CLIENTS')]
${Loc_Client_count}  //*[@class="m_checkbox"]
${Loc_MAC_Address}  //*[@class="m_checkbox"]/following-sibling::td/*[contains(@href,'mac')]
${Loc_Charts}  //*[contains(text(),'Charts')]
${Loc_Diag_chartCount}  //*[@class="mocha-chart-table"]
${Loc_UCC}  //*[contains(text(),'UCC')]
${Loc_Diag_UCCdata}  //*[contains(text(),'Calls')]/following::*[@id="ucc_call_list"]
${Loc_Clarity}  //*[contains(text(),'Clarity')]
${Loc_Diag_Claritydata}  //*[@class="clarity"]//*[@class="panel table rounded white no_pad"]
${Loc_Error_noData}  //*[@class="icofirst icon_alert"]
${Loc_TrafficAnalysis}  //*[contains(text(),'Traffic Analysis')]
${Loc_Diag_TAData}  //*[@class="quality_section"]//*[@class="data responsive"]


${Loc_HomepageClients}  //*[text()='Clients']/ancestor::*[@class="title_heading m_toolbar"]/following-sibling::*/*
${Loc_HomepageFolderQverView}  //*[text()='Folder Overview']/ancestor::tr/following-sibling::tr//*[@class="folder-table"]
${Loc_HomePageAlert}  //*[text()='Alert Summary']/ancestor::tr/following-sibling::tr//*[@id="div_alert_summary_list"]
${Loc_HomePage_QuickLink}   //*[text()='Quick Links']/ancestor::tr/following-sibling::tr
${Loc_HomepageMonitoring}  //*[text()='Monitoring Status']/parent::tr/following-sibling::tr[1]

${Loc_ClientConected}  //*[text()='Clients']/ancestor::*[@class="title_heading m_toolbar"]/following-sibling::*//*[@class="highcharts-grid"]/*

${Loc_close_button}  //*[@aria-label="Close"]