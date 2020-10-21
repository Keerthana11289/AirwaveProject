*** Variables ***
${header_rogue_xpath}  //*[@class="header_name" and contains(text(),'ROGUE')]
${roguecount_xpath}  //*[@class="total_row_count"]
${AP_upcount_xpath}  //*[@id="app-header-stats-up"]//*[@class="stat_value headerLabel"]
${AP_downcount_xpath}  //*[@id="app-header-stats-down"]//*[@class="stat_value headerLabel"]
${Loc_SystemEventLog}  //*[contains(@class,"data responsive")]//td
${Loc_Eventlogin}  /preceding-sibling::td[contains(text(),'CLIUserAudit')]/preceding-sibling::td
