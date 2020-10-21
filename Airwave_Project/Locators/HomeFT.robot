*** Variables ***
${Loc_HealthChart}  //*[text()='Health (%)']/parent::*//*[contains(@class,"grid")]/following-sibling::*/*[contains(@transform,'translate')]/*[contains(@style,"font")]/*
${Loc_SNRchart}  //*[text()='SNR (dB)']/parent::*//*[contains(@class,"grid")]/following-sibling::*/*[contains(@transform,'translate')]/*[contains(@style,"font")]/*
${Loc_SpeedChart}  //*[text()='Speed (Mbps)']/parent::*//*[contains(@class,"grid")]/following-sibling::*/*[contains(@transform,'translate')]/*[contains(@style,"font")]/*
${Loc_leastHealthClient}  //*[text()='Least Healthy Clients']/parent::*//*[@class="m_body"]/tr/*/following-sibling::*
${Loc_LowestSNRClient}  //*[text()='Lowest SNR Clients']/parent::*//*[@class="m_body"]/tr/*/following-sibling::*
${Loc_LowestSpeedClient}  //*[text()='Lowest Speed Clients']/parent::*//*[@class="m_body"]/tr/*/following-sibling::*
${Loc_ClickClient1}  //*[text()='Least Healthy Clients']/parent::*//*[@class="m_body"]/tr/*/a
${Loc_ClickClient2}  //*[text()='Lowest SNR Clients']/parent::*//*[@class="m_body"]/tr/*/a
${Loc_ClickClient3}  //*[text()='Lowest Speed Clients']/parent::*//*[@class="m_body"]/tr/*/a

${Loc_ClientDiagnosticNavigation}  //*[@class="nav_tab ng-scope current"]/*[@ng-class="diagnostics"]
${Loc_PieClientName}  //*[text()='Connection Summary']/parent::*//*[@class="m_body"]/*/*[1]
${Loc_SummaryPieChart}  //*[text()='Connection Summary']/parent::*//*[contains(@class,'series-group')]/*[contains(@transform,'translate')]/*
${Loc_Pie2.4GHz}  //*[text()='Connection Summary']/parent::*//*[@class="m_body"]/*/*[2]
${Loc_Pie5Ghz}  //*[text()='Connection Summary']/parent::*//*[@class="m_body"]/*/*[3]
${Loc_Health_Yaxis}  //*[text()='Health (%)']/parent::*//*[contains(@class,"grid")]/following-sibling::*[contains(@class,'yaxis-labels')]/*
${Loc_SNR_Yaxis}  //*[text()='SNR (dB)']/parent::*//*[contains(@class,"grid")]/following-sibling::*[contains(@class,'yaxis-labels')]/*
${Loc_Speed_Yaxis}  //*[text()='Speed (Mbps)']/parent::*//*[contains(@class,"grid")]/following-sibling::*[contains(@class,'yaxis-labels')]/*