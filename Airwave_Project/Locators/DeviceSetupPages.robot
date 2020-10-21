*** Variables ***
${Loc_DeviceTypeDropdown_css}  css=select#type
${Loc_AddButton_css}  css=input[type='submit']
### Add Device Page
${Loc_NameField_css}  css=td input[name='name']
${Loc_IPAddressField_xpath}  xpath=//input[contains(@name,'apparent_ip')]
${Loc_SNMPPortField_css}  css=td input[name='snmp_port']
${Loc_SSHPortField_css}  css=td input[name='ssh_port']
${Loc_CommunityStringField_css}  css=td input[name='snmp_secret']
${Loc_ConfirmCommunityStringField_css}  css=td input[name='snmp_secret_confirm']
${Loc_SNMPv3UsernameField_css}  css=td input[name='snmpv3_username']
${Loc_AuthPasswordField_css}  css=td input[name='auth_password']
${Loc_ConfirmAuthPasswordField_css}  css=td input[name='auth_password_confirm']
${Loc_SNMPv3AuthProtocolField_css}  css=td select#auth_protocol
${Loc_PrivacyPasswordField_css}  css=td input[name='priv_password']
${Loc_ConfirmPrivacyPasswordField_css}  css=td input[name='priv_password_confirm']
${Loc_SNMPv3PrivacyProtocolField_css}  css=td select#priv_protocol
${Loc_TelnetSSHUsernameField_css}  css=td input[name='username']
${Loc_TelnetSSHPasswordField_css}  css=td input[name='password']
${Loc_ConfirmTelnetSSHPasswordField_css}  css=td input[name='password_confirm']
${Loc_SelectGroupField_css}  css=td select#ap_group_id
${Loc_SelectFolderField_css}  css=td select#ap_folder_id
${Loc_DeviceUpdateGroupSettings_css}  css=input#update_profile_from_dc
${Loc_MoniterOnlySettings_css}  css=input#monitor_only_1
${Loc_ManageRWSettings_css}  css=input#monitor_only_0
${Loc_DeviceAddButton_css}  css=input[name='authorize']
${Loc_DeviceCancelButton_css}  css=input[name='cancel']
${Loc_AddDeviceWarningInfo_css}  css=p.warninfo
${Loc_ApplyChangesButton_css}  css=input[name='confirm']
${Loc_CancelButton_css}  css=input[name='cancel']
### Add a Group
${Loc_AddGroupButton_css}   css=input[name='groups_go_to_add']
${Loc_AddGroupNameField_css}  css=input[name='name'] 
#${Loc_AddGroupAddButton_css}  css=input[name='groups_add']
${Loc_AddGroupAddButton_css}   xpath=//*[contains(@name,'groups_add')]
${Loc_AddGroupCancelButton_css}  css=input[name='groups_cancel']
${Loc_DeleteGroupButton_css}  css=input[name='groups_delete']
### Add Folder
${Loc_AddNewFolder_Xpath}  xpath=//a[text()='Add New Folder']
${Loc_FolderNameField_css}  css=input[name='name']
${Loc_ParentFolderField_css}  css=select#parent_id
${Loc_FolderAddButtonField_css}  css=input[name='folder_list_add']
${Loc_FolderCancelButtonField_css}  css=input[name='folder_list_cancel']
${Loc_FolderListTable}  xpath=//div[@id='div_folder_list']
${Loc_DeleteFoldercss}  css=input[name='delete_folder']
${Loc_DeleteFolderConfirmButtoncss}  css=input[name='confirm']
### TOP FOLDER PAGE
${Loc_FolderEditIcon}  .fontface.icon_edit
${Loc_DeviceModifySection}  css=div.modify_devices_container
${Loc_DeviceActionDropdownSection}  css=div.device_actions.m_inline_block div.goog-inline-block.goog-menu-button-inner-box
${Loc_ChangeDeviceGroupFolderDropdownValue}  xpath=//div[contains(@class,'goog-menuitem-content') and contains(text(),'Change device Group/Folder')]
${Loc_GroupDropdownSection}  css=div.group_select div.goog-menu-button-outer-box
${Loc_GroupDropdownValue}  xpath=//div[contains(@class,'goog-menuitem-content') and contains(text(),'7200 Master Local')]
${Loc_FolderDropdownSection}  css=div.folder_select div.goog-menu-button-outer-box
${Loc_TopFolderDropdownValue}  xpath=//div[contains(@class,'goog-menuitem-content') and contains(text(),'Top')]
${Loc_MoveButton}  xpath=//button[contains(@class,'m_inline_block')][1]
${Loc_ApplyAllButton}  xpath=//button[contains(@class,'m_inline_block')][2]
${Loc_FolderDropDowncss}  css=select#jump_off
${Loc_FolderChangeWarningMsg}  css=div.visible.warning
${Loc_WarningContinueButton}  css=input.button[value='Continue']
${Loc_ConfirmationTablecss}  css=div.confirm_page.awms_table
${Loc_ApplyChangesButton}  css=input.button.small[name='confirm']
###Side Menu Locators
${Loc_DevicesListLink}  css=a[ng-class='list']
${Loc_DevicesMonitorLink}  css=a[ng-class='monitor']
${Loc_DevicesInterfacesLink}  css=a[ng-class='interfaces']
${Loc_DevicesManageLink}  css=a[ng-class='manage']
${Loc_DevicesConfigLink}  css=a[ng-class='config']
${Loc_DevicesRoguesContainedLink}  css=a[ng-class='rogues_contained']
${Loc_DevicesNewLink}  css=a[ng-class='new']
${Loc_DevicesUpLink}  css=a[ng-class='up']
${Loc_DevicesDownLink}  css=a[ng-class='down']
${Loc_DevicesMismatchedLink}  css=a[ng-class='mismatched']
${Loc_DevicesIgnoredLink}  css=a[ng-class='ignored']
${Loc_DevicesControllerClustersLink}  css=a[ng-class='controller_clusters']
####Devices New Page
${Loc_DevicesNew_GroupDropdown}  //div[contains(@class,'group_select')]/div[contains(@class,'goog-menu-button')]
${Loc_DevicesNew_FolderDropdown}  //div[contains(@class,'folder_select')]/div[contains(@class,'goog-menu-button')]
${Loc_DevicesNew_AddButton}  css=button.button.small.m_inline_block.goog-button
###Device List Page
${Loc_DeviceListChart1Dropdown}  (//div[@class='title_heading m_toolbar']//div[contains(@class,'dropdown_anchor')])[1]
${Loc_DeviceListClientChart}  css=div.charts rect.highcharts-background
${Loc_DeviceListChartPopup}  //div[@class='mwx_dialog panel no_pad rounded']
${Loc_DeviceListTimeInterval2h}  //div[@class='timerange-picker']/div[contains(text(),'2h')]
${Loc_DeviceListTimeInterval1d}  //div[@class='timerange-picker']/div[contains(text(),'1d')]
${Loc_DeviceListTimeInterval1w}  //div[@class='timerange-picker']/div[contains(text(),'1w')]
${Loc_DeviceListTimeInterval1y}  //div[@class='timerange-picker']/div[contains(text(),'1y')]
${Loc_Generated_Report}  xpath=//*[contains(text(),'Device Summary Sanity')]



${Loc_Username}   xpath=//*[contains(text(),'Telnet/SSH Username:')]/parent::*//*[@type="text"]
${Loc_ArubaEdit}   xpath=//*[.='Aruba']/parent::tr/*/*
${Loc_CommunicationSave}   xpath=//input[@name='save']
${Loc_AddDeviceType}  xpath=//select[@id='type']
${Loc_AddDevice}  xpath=//input[@name='create']

${Loc_scan_addScanset}  //*[@name="scan_set_del_form"]
${Loc_scan_Checkbox}  /parent::*//*[@type="checkbox"]
${Loc_Refreshbutton}  //*[contains(text(),'Refresh')]
${Loc_Scan_button}  //*[@type="submit" and @value="Scan"]
${Loc_device_count}  //*[text()='NEW DEVICES']/parent::*//*[@class="stat_value headerLabel"]


### Controller
${Loc_switchPoll}  //*[text()='Poll Now']
${Loc_Poll_button}  //*[@name="poll_now" and @class="small button"]
${Loc_PollingMessage}  //p[contains(text(),'Polling now')]
${Loc_PollStatus}  //*[text()='Status:']/parent::
${Loc_PollConfiguration}  //*[text()='Configuration:']/parent::
${Loc_PollIP}  //*[text()='IP Address:']/parent::*//*/a
${Loc_close_button}  //*[@aria-label="Close"]
${Loc_Monitor}  //*[@ng-class="monitor"]
${Loc_selectDevice}  //*[text()='Add Selected Devices']
${Loc_selectGroupDropdowm}  //*[contains(@class,'group')]//*[contains(@class,"button-inner-box")]
${Loc_selectFolderDropdown}  //*[contains(@class,'folder_select')]//*[contains(@class,"button-inner-box")]
${Loc_AddButton}  //button[text()='Add']



${System_link}  link=System
${Triggers_link}  css=a.ng-binding[ng-class='triggers']

${Loc_AddTrigger}  //*[@class="small button" and @value="Add"]
${Loc_triggerTypeDropdown}  //*[@name="type"]
${Loc_severityDropdown}  //*[@name="severity"]
${Loc_ValueText}  //*[@name="value_new1"]
${Loc_AddVAl}  //*[@name="per_role_add" and @value="Add"]
${Loc_AlertHeader}  //*[text()='ALERTS']/parent::*//*[@class="stat_value headerLabel"]


  
