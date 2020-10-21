*** Variables ***
${Loc_APMonitoringTableLocator}  //div[@class='ap-monitoring']
${Loc_PollNowButton}  css=input[name='poll_now']
${Loc_APM_ClientCountInfo}  //div[contains(@id,'AP__Monitoring__InfoTable')]//td[contains(text(),'Clients')]/following-sibling::td[1]
${Loc_APM_ClientCountInfo}  //div[contains(@id,'AP__Monitoring__InfoTable')]//td[contains(text(),'Usage')]/following-sibling::td[1]
${Loc_DeviceListTimeInterval2h}  //div[@class='timerange-picker']/div[contains(text(),'2h')]
${Loc_DeviceListTimeInterval1d}  //div[@class='timerange-picker']/div[contains(text(),'1d')]
${Loc_DeviceListTimeInterval1w}  //div[@class='timerange-picker']/div[contains(text(),'1w')]
${Loc_DeviceListTimeInterval1y}  //div[@class='timerange-picker']/div[contains(text(),'1y')]
${Loc_DeviceListClientChart}  css=div.charts rect.highcharts-background
${Loc_DeviceListChartPopup}  //div[@class='mwx_dialog panel no_pad rounded']
${Loc_DeviceListChart1Dropdown}  (//div[@class='title_heading m_toolbar']//div[contains(@class,'dropdown_anchor')])[1]