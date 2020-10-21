*** Variables ***
${Loc_ReportDeleteFT_button}  //*[@name="reports_delete"]
${Loc_ApplyChangesButtonFT_css}  css=input[name='confirm']
${Loc_TriggerDeleteFT}  //*[@name="per_role_delete"]
${Loc_SuccessfulMessage}  //*[@class="icofirst icon_confirmed ok"]

${Loc_icon_searchFT}  //*[@class="icon_search"]
${Loc_search_input_xpathFT}  //*[@id="search_input"]
${Loc_searchPopupFT}  //*[@class="icon_search icon_search_popup"]
${Device_manage_xpathFT}  //*[@ng-class="manage"]
${Loc_Delete_buttonFT}  //*[@name="delete"]

${Loc_DeleteFoldercssFT}  css=input[name='delete_folder']
${Loc_DeleteFolderConfirmButtoncssFT}  css=input[name='confirm']
${Loc_DeleteGroupButton_cssFT}  css=input[name='groups_delete']

${Loc_Clean_campusRemoveFT}  //*[text()='Remove']
${Loc_clean_confirmremoveFT}  //*[@name="ok"]

${Loc_Clean_VRFenablevalueFT}  //*[@name="visualrf_enabled_1" and @value='0']
${Loc_saveFT}  //input[@name='save']

${Loc_disableSNMPandTrap}  //*[@name="collect_syslog_and_trap_1" and @value="0"]