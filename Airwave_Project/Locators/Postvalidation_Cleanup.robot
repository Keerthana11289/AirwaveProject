*** Variables ***
### discover devices ###
${Loc_pv_addNetwork}  //*[@name="network_del_form"]
${Loc_pv_addCredential}  //*[@name="credential_del_form"]
${Loc_pv_addScanset}  //*[@name="scan_set_del_form"]
### discover device clean ###
${Loc_clean_Checkbox}  /parent::*//*[@type="checkbox"]
${Loc_DeleteConfirm}  //*[@class="icofirst icon_confirmed ok"]
${Loc_credentialDelete}  //*[@name="credential_delete"]
${Loc_ScansetDelete}  //*[@name="scan_set_delete"]
${loc_Networkdelete}  //*[@name="network_delete"]

### AMPsetup Page ###
${Loc_pv_rebootRadiobutton}  monitor_only_upgrades_1
${Loc_pv_Rebootbutton_value}  1
${Loc_pv_InstantAPWhitelist_radiobutton}  ap_white_list_disabled_1
${Loc_pv_InstantAP_value}  0
${Loc_pv_arubaswitchRadiobutton}  switch_white_list_disabled_1
${Loc_pv_arubaswitch_value}  0
### AMPsetup Page Clean ###
${Loc_Clean_FirmwareRadioButton}  //*[@id="monitor_only_upgrades_1_0"]
${Loc_Clean_APWhitelistRadioButton}  //*[@id="ap_white_list_disabled_1_1"]
${Loc_Clean_SwitchWhitelistRadioButton}  //*[@id="switch_white_list_disabled_1_1"]

### Device Setup Page Clean ###
${Loc_Delete_button}  //*[@name="delete"]

### Reports Clean ###
${Loc_ReportDelete_button}  //*[@name="reports_delete"]
${Loc_ExportToCSV}  //*[contains(text(),'Export CSV')]

### Visual RF ###
${Loc_VRFenableName}  visualrf_enabled_1
${Loc_VRFenablevalue}  1
${Loc_Clean_VRFenablevalue}  //*[@name="visualrf_enabled_1" and @value='0']
${Loc_save}  //input[@name='save']

${Loc_Clean_campusRemove}  //*[text()='Remove']
${Loc_clean_confirmremove}  //*[@name="ok"]
###Rapids ###
${Loc_signalstrength}  //*[contains(text(),'Signal strength')]/following-sibling::*[text()='No']


