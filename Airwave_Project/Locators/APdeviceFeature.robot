*** Variables ***
${Loc_icon_searchAP}  //*[@class="icon_search"]
${Loc_search_input_xpathAP}  //*[@id="search_input"]
${Loc_searchPopupAP}  //*[@class="icon_search icon_search_popup"]
${Loc_close_buttonAP}  //*[@aria-label="Close"]
${Loc_ControllerButton}  //*[@id="controllers_button"]
${Loc_ControllerLink}  (//*[@class="panel table rounded white no_pad" and not(contains(@style,'display: none;'))]//*[@class="m_body"]//td)[1]
${Loc_SelectPollDevice}  //*[text()='Poll selected devices']
${Loc_deviceCheckbox}  parent::*/preceding-sibling::*[@class="m_checkbox"]/*
${Loc_PollButton}  //*[text()='Poll Now']
${Loc_ApplyChangesButtonAP}  css=input.button.small[name='confirm']
${Loc_SuccessfulMsg}  //*[@class="icofirst icon_confirmed ok"]

${Loc_RuncommandQL}  //*[@name="command_runner"]
${Columns_list_xpath}  //*[@name="quicklinks"]/*

${Loc_AddGroupButton_cssFT}   css=input[name='groups_go_to_add']
${Loc_AddGroupNameField_cssFT}  css=input[name='name'] 
${Loc_AddGroupAddButton_cssFT}   xpath=//*[contains(@name,'groups_add')]
${Loc_AddNewFolder_XpathFT}  xpath=//a[text()='Add New Folder']
${Loc_FolderNameField_cssFT}  css=input[name='name']
${Loc_ParentFolderField_cssFT}  css=select#parent_id
${Loc_FolderAddButtonField_cssFT}  css=input[name='folder_list_add']
${Loc_SelectMoveDevice}  //*[text()='Change device Group/Folder']
${Loc_MoveGroupDropdowm}  //*[contains(@class,'group_select')]//*[contains(@class,"button-inner-box")]
${Loc_MoveButton}  //*[text()='Move']
${Loc_ContinueButton}  //*[@value="Continue"]

${Loc_MonitorFT}  //*[@ng-class="monitor"]
${Loc_DeleteGroupButton_cssAP}  css=input[name='groups_delete']
${Loc_SelectAuditDevice}  //*[text()='Audit selected devices']
${Loc_AuditButtonAP}  //*[text()='Audit']

${Loc_FirmwareOption}  //*[@class="title_heading icon_arrow_down" and contains(text(),'Firmware')]
${Loc_rebootRadiobutton}  monitor_only_upgrades_1
${Loc_Rebootbutton_value}  0
${Loc_dis_FirmwareRadioButton}  //*[@id="monitor_only_upgrades_1_0"]
${Loc_AMPSave}  //*[@class="small button" and @name="save"]
${Loc_Device_manage_xpath}  //*[@ng-class="manage"]
${Loc_FirmwareDevice_info}  //*[contains(text(),'Monitor Only + Firmware Upgrades')]


${Loc_DeviceTypeDropdown_cssAOS}  css=select#type
${Loc_AddButton_cssAOS}  css=input[type='submit']
${Loc_IPAddressField_xpathAOS}  xpath=//input[contains(@name,'apparent_ip')]
${Loc_CommunityStringField_cssAOS}  css=td input[name='snmp_secret']
${Loc_ConfirmCommunityStringField_cssAOS}  css=td input[name='snmp_secret_confirm']
${Loc_TelnetSSHUsernameField_cssAOS}  css=td input[name='username']
${Loc_TelnetSSHPasswordField_cssAOS}  css=td input[name='password']
${Loc_ConfirmTelnetSSHPasswordField_cssAOS}  css=td input[name='password_confirm']
${Loc_SelectGroupField_cssAOS}  css=td select#ap_group_id
${Loc_SelectFolderField_cssAOS}  css=td select#ap_folder_id
${Loc_DeviceAddButton_cssAOS}  css=input[name='authorize']
${Loc_ApplyChangesButton_cssAOS}  css=input[name='confirm']
${Loc_CancelButton_cssAOS}  css=input[name='cancel']
${Loc_close_buttonAOS}  //*[@aria-label="Close"]
${Loc_switchPollAOS}  //*[text()='Poll Now']
${Loc_Poll_buttonAOS}  //*[@name="poll_now" and @class="small button"]

${Loc_PollStatusAOS}  //*[text()='Status:']/parent::
${Loc_PollConfigurationAOS}  //*[text()='Configuration:']/parent::
${Loc_DevCount}  //*[@class="m_body edit_state"]/*/*/input
${Loc_AllDeviceCheckbox}  //*[text()='Device']/parent::*/preceding-sibling::*/*

${Loc_GroupSelect}  //*[contains(@class,'group_select')]//*[contains(@class,"button-inner-box")]
${Loc_DevAdd}  //*[text()='Add']


${Loc_FirmwareText}  //*[text()='Firmware:']/following-sibling::*
${Loc_TypeText}  //*[text()='Type:']/following-sibling::*



${Loc_AP_List}  css=.ng-binding[href='/ap_list']
${Loc_ListView_filterMenu}  css=button.m_listview_filter_menu_text
${Loc_AlertError}  css=p.icon_alert.error
${Loc_Rename_Devices}  //*[text()='Rename devices']
${Loc_Input1}  //*[text()='Group']/parent::*//*[@class="m_selectable_menu-filter"]/input
${Loc_Input2}  (//*[@class="m_body edit_state"]//*/*[@class="edit_state"]/*)[1]
${expected_RenameResult}  No selected devices support this operation.
${Loc_ChangeDeviceGroup}  //*[contains(@class,'device_actions')]//*[contains(@class,"button-inner-box")]
${Loc_GroupController}  //*[@class="goog-menuitem-content"]/*[contains(.,'MM120')]
${Loc_GroupFilter}  xpath=//*[contains(@key,'ap_group_id')]/following-sibling::div[2]
${Loc_UpgradeFirmware}  //*[text()='Upgrade firmware for selected devices']
${expected_Upgraderesult}  None of the selected devices can have their firmware upgraded.
${expected_ReProvisioning}  No selected devices support reprovisioning.
${Loc_ReProvisioning}  //*[text()='Reprovision selected Aruba devices'] 
${Loc_AuditSettins}  //*[text()='Audit selected devices']
${Loc_ManagementLvl}  //*[text()='Management Level']
${Loc_ManageReadWrite}  //*[text()='Manage Read/Write']
${Expected_importingunreferenced}  None of the selected devices support importing Aruba profiles.
${Expected_UpdateAPGroup}  //p[@class='icofirst icon_alert error']
${Loc_ImportUnreferenced}  //*[text()='Import unreferenced Aruba profiles from selected devices']
${Loc_ImportSettings}  //*[contains(text(),'Import settings from selected devices')]
${Loc_UpdatingAPGroupDevice}   //*[text()='Aruba AP Group'] 
${Loc_readstate}  //*[@class="read_state"]//*
${Loc_FactoryResetDevice}  //*[text()='Reboot selected devices']
${Loc_RebootDevice}  //*[text()='Factory reset selected devices']
${Loc_DeleteDevices}  //*[text()='Delete selected devices']

${Loc_FirstCheckbox}  //*[@class="read_state"]//*/ancestor::*/*[@class="m_checkbox"]/*
${Loc_AddMaintanenceDevice}  //*[text()='Add Maintenance Window'] 
${Loc_InputName}  //*[@name="name"]
${Loc_OccuranceDD}  //*[@name="recurrence_pattern"]
${Loc_MonthDD}  //*[@name="annually_month"]
${Loc_DayDD}  //*[@name="annually_day"]
${Loc_TimeBx}  //*[@name="start_time_only"]
${Loc_DurationDD}  //*[@name="duration"]
${Loc_ADDbutton}  //*[@class="small button"]
${Loc_NoChangesButton}  //*[@class="awms_table confirm_page" and contains(.,'There are no changes to be applied')]


${Loc_CPUgraph}  //*[text()='CPU Utilization']/ancestor::*/*[@class="title_heading m_toolbar"]/following-sibling::*//*[@class="highcharts-grid"]/*
${Loc_MemoryGraph}  //*[text()='Memory Utilization']/ancestor::*/*[@class="title_heading m_toolbar"]/following-sibling::*//*[@class="highcharts-grid"]/*


${Loc_ReportFirmware}  xpath=//td[contains(text(),'Aruba_8.7.0.0')]
${Loc_DeviceFirmware}  //td[contains(text(),'8.7.0.0')]
${Loc_MM_apGroup}  //select[@id='use_ap_group']
${Loc_SelectAPGroup}  //input[@id='ap_groups_5']
${Loc_Report_Start}  xpath=//*[contains(text(),'Report Start:')]/parent::*//*[@type="text"]
${Loc_Report_Stop}  xpath=//*[contains(text(),'Report End:')]/parent::*//*[@type="text"]
${Loc_FlashBackup}  //input[@name='create_backup_now_button']
${Loc_VerifyingConfig}  xpath=//div[contains(text(),'(Verifying new configuration)')]
${Loc_RunningConfig}  //a[contains(text(),'View Running Configuration')]
${Loc_PCI_heading}  //div[@class='title_heading'] 

${Loc_License}  //*[contains(@href,'license')]
${Loc_LicenseText}  //*[contains(@class,'title_heading')]
${Loc_LicRowcount}  css=span.row_count

${Loc_ReportDeleteFT_button}  //*[@name="reports_delete"]

${Loc_Config_Status}  //*[text()='Configuration:']/parent::*[contains(.,'Good')]
${Loc_ImportButton}  //*[@value="Import"]
${Loc_CreateBackup}  //*[@value="Create Backup Now"]
${Loc_ManageReadWriteoption}  //*[contains(text(),'Manage Read/Write')]/parent::*/*
${Loc_SaveandApply}  [value='Save and Apply'][type='submit']
${Loc_CorrespondingGroup}  //*[@class="header_table_column_padding"]//a
${Loc_LocalConfig}  //*[contains(text(),'Local Config')]
${Loc_NetworkConfig}  //*[contains(text(),'Local Config')]//following::span[1]
${Loc_VLANConfig}  //*[contains(text(),'VLANS')]
${Loc_VLAN}  //ul[contains(@class,'expand')]//following::li/a[text()='VLAN']
${Loc_VLANname}  //*[contains(text(),'Name:')]//following::input[1]
${Loc_VLANid}  //*[contains(text(),'Name:')]//following::input[2]

${Loc_compliancePage}  //a[contains(text(),'Compliance')]
${Loc_PCIcompliance}  //div[@class='title_heading']


${Loc_ContStatus}  (//*[@class="panel table rounded white no_pad" and not(contains(@style,'display: none;'))]//*[@class="m_body"]//td)[1]/following::*[text()='Up']
 
${Loc_AuthProtocol}  //*[@name="auth_protocol"]
${Loc_PrivacyPassword}  //*[@name="priv_password"]
${Loc_ConfirmPrivacyPassword}  //*[@name="priv_password_confirm"]
${Loc_PrivProtocol}  //*[@name="priv_protocol"]

${Loc_MMrole}  //td[contains(text(),'Controller Role:')]/following-sibling::td
${Loc_MDrole}  //td[contains(text(),'Controller Role:')]//following-sibling::td[1]
${Loc_MDstatus}  //*[text()='Status:']/parent::*[contains(.,'Up')]
${MDstatus}  //*[@title="Up"]

${Loc_AlertsandEvents}  //*[@id="alerts"]/*
${Loc_DevicEventData}  //*[contains(text(),'Device Events')]/ancestor::tr/following-sibling::*[@class="inactive_row"]
${Loc_AuditLog}  //*[text()='Audit Log']
${Loc_EventLog}  //*[text()='view system event log']
${Loc_Cluster}  //*[@role="rowgroup"]//following::*[contains(@class,"ui-grid-cell")]/*[contains(@cell-href,"cc_monitoring")]

${Loc_AddFirmware}  //*[@name="firmware_go_to_add"]
${Loc_FirmwareType}  //*[@name="type"]
${Loc_Description}  //*[@name="description"]
${Loc_ServerProtocol}  //*[@name="server_protocol"]
${Loc_ChooseFileFirmware}  //*[@name="upload_filename"]
${Loc_FileLocation}  C:\\Users\\Keerthina\\eclipse-workspace\\Airwave_jun21\\TestArgu\\ArubaOS_72xx_8.5.0.7_74786
${Loc_FirmwareADD}  //*[@name="firmware_add"]

${Loc_FirmwareRebootAP}  //*[@class="title_heading icon_arrow_down" and contains(text(),'Firmware')]
${Loc_FirmwareRadioButtonAP}  //*[@id="monitor_only_upgrades_1_1"]
${Loc_SaveAP}  //*[@class="small button" and @name="save"]  
${Loc_MonitorandFirmware}  //*[contains(text(),'Monitor Only + Firmware Upgrades')]
${Loc_FirmwareButton}  //*[@name="firmware_upgrade"]
${Loc_DesiredFirmware}  //*[contains(@name,"desired_firmware")]
${Loc_FirmwareButton1}  //*[@name="upgrade"]
${Loc_FirmwareProgress}  //*[text()='Firmware:']/following-sibling::*[contains(text(),'In progress')]
${Loc_DeviceTab}  //*[@id="devices"]/*
${Loc_ConfigGood}  //*[text()='Configuration:']//following::*[contains(.,'Good')]

