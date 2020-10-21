*** Variables ***
${Loc_RAPIDSPageRogueTableLocator}  css=div.rogue_ap_type div.list_view
${Loc_RAPIDSSetupPageLocator}  xpath=//form[@name='add']/div
${Loc_RAPIDSExportFilter}  css=select#rapids_export_filter_level_1
${Loc_RAPIDSSetupApplyButton}  css=input.button[name='apply']
${Loc_RAPIDSSetupConfirmButton}  css=input.button[name='confirm']
${Loc_RAPIDSSetupConfirmationCancelButton}  css=input.delete[type='submit']
${Loc_RAPIDSModifyDeviceActionIcon}  css=div#action_edit.action_icon
${Loc_ModifyDeviceLink}  .fontface.icon_edit
${Loc_ModifyDeviceSection}  css=div.m_modify_devices
${Loc_RAPIDSDeviceAction}  css=div.m_inline_block.device_actions div.goog-menu-button-inner-box.goog-inline-block
${Loc_RogueDeleteButton}  css=button.button.small.goog-button
${Loc_RogueDeleteConfirmationButton}  css=input.button.small[name='confirm']
### RAPIDS Setup Page
${Loc_RAPIDSSetupARPIPMatchTimeout}  //input[@name='rapids_arp_window_1']
${Loc_RAPIDSSetupARPIPMatchTimeoutTextBox}  css=input[name='rapids_arp_window_1']
${Loc_RAPIDSSetupARPIPMatchTimeoutValidationError}  css=p.icofirst.icon_alert.error
${Loc_RAPIDSSetupWiredtoWirelessMACAddressCorrelation}  //input[@name='rapids_rogue_mac_window_1']
${Loc_RAPIDSSetupWirelessBSSIDCorrelation}  //input[@name='rapids_rogue_bssid_window_1']
${Loc_RAPIDSSetupDeleteRoguesRange}  //input[@name='rapids_filter_not_heard_for_1']


### Code By Keerthana ###
### Rapids Overview ###
${Loc_Rogue_piechart}  //*[contains(text(),'Rogue Data')]/parent::*/following-sibling::*//img

### rapids list
${Loc_roguelist_xpath}  //*[@class="total_row_count"]

### rapids setup
${Loc_RapidsExportThreshold}  //*[@id="rapids_export_filter_level_1"]
${Loc_ExportThresholdValue}  Rogue
${Loc_savebutton}  //*[@class="small button" and @name="save"]
### rapids rules
${Loc_signalstrengthEditicon}  //*[contains(text(),'Signal strength > -75 dBm')]/parent::*//a
${Loc_classificationDropdown}  //*[@id="RAPIDS_Classification_Rule"]/following-sibling::*/*[contains(text(),'Classification:')]/parent::*//*[@class="selectBox"]
${Loc_classification}  Rogue
${Loc_ClassificationafterModify}  //*[contains(text(),'Signal strength > -75 dBm')]/parent::*//td[4]

${Loc_disablebutton}  //*[contains(text(),'Enabled')]/parent::*//*[@value="0"]
${Loc_addRule}  //*[@name="go_to_add"]
${Loc_RuleNameTextbox}  //*[contains(text(),'Rule name')]/parent::*//*[@type="text"]
${Loc_threatDropdown}  //*[@name="threat_level"]
${Loc_enablebutton}  //*[contains(text(),'Enabled')]/parent::*//*[@value="1"]
${Loc_classruledropdown}  //*[@name="classification_rule_to_add"]
${Loc_signalstrengthvalue}  //*[text()='Signal strength']
${Loc_classADD}  //*[@name="classification_add"]
${Loc_strengthText}  //*[contains(text(),'Signal minimum')]/parent::*//*[@type="text"]
${Loc_ADDbutton}  //*[@class="small button" and @name="add"]
${Loc_signalDrag}  //*[contains(text(),'Signal strength')]/following-sibling::*[@class="dragHandle"]
${Loc_dragRule}  following-sibling::*[@class="dragHandle"]
${Loc_dropRule}  //*[@class="dragHandle"]
${Loc_savandApply}  //*[@value="Save and Apply"]
${Loc_applychanges}  //*[@value="Apply Changes Now"]

${Loc_ARPIPMatch}  xpath=//*[contains(text(),'ARP IP Match Timeout')]/parent::*//*[@type="text"]
${Loc_ARP_Error}  xpath=//p[@class='icofirst icon_alert error']
${Loc_Save}  xpath=//input[@name='save']
