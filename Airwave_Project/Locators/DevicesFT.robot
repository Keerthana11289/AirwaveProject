*** Variables ***
${Loc_AdditionalAMPSettings}  //*[@class="title_heading icon_arrow_down" and contains(text(),'Additional AMP Services')]
${Loc_diableAMONDatacollection}  //*[@name="amon_processing_enable_1" and @value="0"]
${Loc_AMONvsSNMP}  //*[contains(text(),'Prefer AMON vs SNMP Polling')]
${Loc_enableAMONDatacollection}  //*[@name="amon_processing_enable_1" and @value="1"]
${Loc_DisableSNMPPolling}  //*[@name="use_amon_vs_snmp_1" and @value="0"]
${Loc_SNMPvsVPN}  //*[contains(text(),'Prefer SNMP Polling for VPN Clients')]
${Loc_EnsableSNMPPolling}  //*[@name="use_amon_vs_snmp_1" and @value="1"]
${Loc_SaveButton}  //*[@class="small button" and @name="save"]
${Loc_enableSNMPandTrap}  //*[@name="collect_syslog_and_trap_1" and @value="1"]


${Loc_AddGroupButton_cssFT}   css=input[name='groups_go_to_add']
${Loc_AddGroupNameField_cssFT}  css=input[name='name'] 
${Loc_AddGroupAddButton_cssFT}   xpath=//*[contains(@name,'groups_add')]
${Loc_AddNewFolder_XpathFT}  xpath=//a[text()='Add New Folder']
${Loc_FolderNameField_cssFT}  css=input[name='name']
${Loc_ParentFolderField_cssFT}  css=select#parent_id
${Loc_FolderAddButtonField_cssFT}  css=input[name='folder_list_add']

${Loc_DeviceTypeDropdown_cssFT}  css=select#type
${Loc_AddButton_cssFT}  css=input[type='submit']
${Loc_IPAddressField_xpathFT}  xpath=//input[contains(@name,'apparent_ip')]
${Loc_CommunityStringField_cssFT}  css=td input[name='snmp_secret']
${Loc_ConfirmCommunityStringField_cssFT}  css=td input[name='snmp_secret_confirm']
${Loc_TelnetSSHUsernameField_cssFT}  css=td input[name='username']
${Loc_TelnetSSHPasswordField_cssFT}  css=td input[name='password']
${Loc_ConfirmTelnetSSHPasswordField_cssFT}  css=td input[name='password_confirm']
${Loc_SelectGroupField_cssFT}  css=td select#ap_group_id
${Loc_SelectFolderField_cssFT}  css=td select#ap_folder_id
${Loc_DeviceAddButton_cssFT}  css=input[name='authorize']
${Loc_ApplyChangesButton_cssFT}  css=input[name='confirm']
${Loc_CancelButton_cssFT}  css=input[name='cancel']
${Loc_close_buttonFT}  //*[@aria-label="Close"]
${Loc_MonitorFT}  //*[@ng-class="monitor"]
${Loc_switchPollFT}  //*[text()='Poll Now']
${Loc_Poll_buttonFT}  //*[@name="poll_now" and @class="small button"]
${Loc_device_countFT}  //*[text()='NEW DEVICES']/parent::*//*[@class="stat_value headerLabel"]


#### Devices List ###
${Loc_folderDrop}  //*[@name="jump_off"]
${Loc_TopDevices}  //*[@name="jump_off"]/*[contains(text(),'Devices')]
${Loc_ClientCol}  //*[@class="m_checkbox"]/following-sibling::td[7]
${Loc_AMPclientCount}  //*[text()='Clients:']/following-sibling::*
${Loc_IP}  //*[text()='IP Address:']/parent::*//*/a
${Cont_Username}  //*[@placeholder="Username"]
${Cont_Password}  //*[@placeholder="Password"]
${Cont_Login}  //*[@name="login"]
${Loc_verifyLogin}  //*[text()='admin']
${Loc_WirelessClientCount}  //*[text()='CLIENTS']/parent::*//*[contains(@ng-click,'clientCount')]
${Loc_WiredClientCount}  //*[text()='CLIENTS']/parent::*//*[contains(@ng-click,'wiredClientCount')]

### new user
${Loc_AddUser}  //*[@name="go_to_add"]
${Loc_CurrentPwd}  //*[@name="current_password"]
${Loc_ReadonlyUsername}  //*[@name="username"]
${Loc_RoleUsername}  //*[@name="name"]
${Loc_RoleDropdown}  //*[@name="role_id"]
${Loc_ReadonlyPwd}  //*[@name="password"]
${Loc_ReadonlycnfrmPwd}  //*[@name="password_confirm"]
${Loc_AdduserAdd}  //*[@name="add" and @type="submit"]
${Loc_AddSuccessful}  //*[@class="icofirst icon_confirmed ok"]
${Loc_FolderDropdown}  //*[@name="easy_top_folder_selector"]
${Loc_RapidsDropdown}  //*[@name="rapids"]
${VRF_Dropdown}  css=select#visualrf.selectBox[name='visualrf']
${Loc_SignonDropdown}  //*[@name="aruba_controller_role"]
${Loc_DevAccess_Dropdown}  //*[@name="ap_access_level"]
${Loc_LogoutAMP}  //*[@id="app-menu-logout"]
${Loc_clientMonitor}  //*[@class='fieldName' and text()='Clients:']//following::td[1]
${Loc_clientPanel}  //li[contains(@id,'clients')]/*
${Loc_clientPanelcount}  css=div.total_row_count

${Loc_Delete_buttonFT}  //*[@name="delete"]

${Loc_icon_searchFT}  //*[@class="icon_search"]
${Loc_search_input_xpathFT}  //*[@id="search_input"]
${Loc_searchPopupFT}  //*[@class="icon_search icon_search_popup"]
${Loc_APdev1}  (//*[@class="panel table rounded white no_pad" and not(contains(@style,'display: none;'))]//*/parent::*/td)[1]
