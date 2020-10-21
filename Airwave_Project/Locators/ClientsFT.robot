*** Variables ***
${Loc_Folder_Dropdown}  //*[@name="jump_off"]
${Loc_Top_ClientsOption}  //*[@name="jump_off"]/*[contains(text(),'Clients')]
${Loc_MACAddressFT}  //*[@class="m_checkbox"]/following-sibling::td/*[contains(@href,'mac')]
${Loc_Client_detailFT}  //*[@ng-class="client_detail"]
${Loc_RFData_Title}  //*[@class="sectionTitle title_heading icon_arrow_down"]
${Loc_RFData_Floor}  //*[contains(@class,"sectionTitle ")]/parent::*/following-sibling::*//img
${Loc_RFTitle_Diagnostic}  //*[text()='Floorplan']
${Loc_RFimg_Diagnostic}  //*[text()='Floorplan']/parent::*//img
${Loc_UsageGraph}  //*[text()='Usage']/ancestor::*[@id="client_bandwidth_container"]
${Loc_Signal&NoiseGraph}  //*[text()='Signal & Noise (dBm)']/ancestor::*[@id="client_signal_container"]
${Loc_SNRgraph}  //*[text()='SNR (dB)']/ancestor::*[@id="client_snr_container"]
${Loc_CLientDetailValue}  //*[@class="title_heading icon_arrow_down"]
${Loc_ClientName}  //*[contains(text(),'Detail for')]/*
${Loc_APName}  //*[text()='Current Association']/following-sibling::*//*//*/*[contains(text(),'Device:')]/following-sibling::*
${Loc_ControllerName}  //*[text()='Current Association']/following-sibling::*//*//*/*[contains(text(),'Controller:')]/following-sibling::*
${Loc_WirelessName}  //*[text()='Current Association']/following-sibling::*//*//*/*[contains(text(),'SSID:')]/following-sibling::*
${Loc_Client_DiagnosticFT}  //*[@ng-class="diagnostics"]
${Loc_ClientNetwork}  //*[text()='Client']/parent::*/div
${Loc_WirelessNetwork}  //*[text()='Wireless']/parent::*/div
${Loc_APNetwork}  //*[text()='AP']/parent::*/div
${Loc_ControllerNetwork}  //*[text()='Controller']/parent::*/div
${Loc_DeviceInfoTitle}  //*[contains(text(),'Device Info')]
${Loc_Username}  //*[contains(text(),'Device Info')]/parent::*//*[text()='Username:']/following-sibling::*
${Loc_DeviceType}  //*[contains(text(),'Device Info')]/parent::*//*[text()='Device Type:']/following-sibling::*
${Loc_MACaddress}  //*[contains(text(),'Device Info')]/parent::*//*[text()='MAC Address:']/following-sibling::*
${Loc_Role}  //*[contains(text(),'Device Info')]/parent::*//*[text()='Role:']/following-sibling::*
${Loc_CurrentassociationTitle}  //*[contains(text(),'Current Association')]
${Loc_Connectionmode}  //*[contains(text(),'Current Association')]/parent::*//*[text()='Connection Mode:']/following-sibling::*
${Loc_Duration}  //*[contains(text(),'Current Association')]/parent::*//*[text()='Duration:']/following-sibling::*
${Loc_IPaddress}  //*[contains(text(),'Current Association')]/parent::*//*[text()='IP Address:']/following-sibling::*
${Loc_Hostname}  //*[contains(text(),'Current Association')]/parent::*//*[text()='Hostname:']/following-sibling::*
${Loc_Usage}  //*[contains(text(),'Current Association')]/parent::*//*[text()='Usage:']/following-sibling::*
${Loc_securityMode}  //*[contains(text(),'Current Association')]/parent::*//*[text()='Security Mode:']/following-sibling::*
${Loc_Cipher}  //*[contains(text(),'Current Association')]/parent::*//*[text()='Cipher:']/following-sibling::*
${Loc_AuthType}  //*[contains(text(),'Current Association')]/parent::*//*[text()='Auth type:']/following-sibling::*
${Loc_VLAN}  //*[contains(text(),'Current Association')]/parent::*//*[text()='VLAN:']/following-sibling::*
${Loc_FwdMode}  //*[contains(text(),'Current Association')]/parent::*//*[text()='Forward Mode:']/following-sibling::*
${Loc_SNR}  //*[contains(text(),'Current Association')]/parent::*//*[text()='SNR (dB):']/following-sibling::*
${Loc_SSID}  //*[contains(text(),'Current Association')]/parent::*//*[text()='SSID:']/following-sibling::*
${Loc_QualityData}  //*[contains(text(),'Quality')]/parent::*//*[@class="add_margin rating-container"]
${Loc_GraphDropdown}  (//div[@class='title_heading m_toolbar']//div[contains(@class,'dropdown_anchor')])[1]
${Loc_Goodputgraph}  //*[@class='goog-menuitem-content' and text()='Goodput']
${Loc_Goodputdatagraph}  //*[text()='Goodput']/ancestor::*[@class="title_heading m_toolbar"]/following-sibling::*//*[@class="highcharts-axis"][1]/*
${Loc_Diagbox}  //*[@role="dialog"]
${Loc_GoodputTotalIn}  //*[@role="dialog"]//*[@class="m_body"]/*//*[text()='Total In']/parent::*/following-sibling::*[4]
${Loc_GoodputTotalOut}  //*[@role="dialog"]//*[@class="m_body"]/*//*[text()='Total Out']/parent::*/following-sibling::*[4]
${Loc_CloseDialog}  //*[@aria-label="Close"]
${Loc_Speedgraph}  //*[@class='goog-menuitem-content' and text()='Speed']
${Loc_Speeddatagraph}  //*[text()='Speed']/ancestor::*[@class="title_heading m_toolbar"]/following-sibling::*//*[@class="highcharts-axis"][1]/*
${Loc_SpeedTotal}  //*[@role="dialog"]//*[@class="m_body"]/*//*[text()='Total']/parent::*/following-sibling::*[4]
${Loc_Healthgraph}  //*[@class='goog-menuitem-content' and text()='Health']
${Loc_Healthdatagraph}  //*[text()='Health']/ancestor::*[@class="title_heading m_toolbar"]/following-sibling::*//*[@class="highcharts-axis"][1]/*
${Loc_HealthTotal}  //*[@role="dialog"]//*[@class="m_body"]/*//*[text()='Health']/parent::*/following-sibling::*[4]
${Loc_Usagedetailgraph}  //*[@class='goog-menuitem-content' and text()='Usage']
${Loc_Usagedatagraph}  //*[text()='Usage']/ancestor::*[@class="title_heading m_toolbar"]/following-sibling::*//*[@class="highcharts-axis"][1]/*
${Loc_UsageTotalIn}  //*[@role="dialog"]//*[@class="m_body"]/*//*[text()='Total In']/parent::*/following-sibling::*[4]
${Loc_UsageTotalOut}  //*[@role="dialog"]//*[@class="m_body"]/*//*[text()='Total Out']/parent::*/following-sibling::*[4]
${Loc_1dTime}  //*[@role="dialog"]//*[contains(text(),'1d')]
${Loc_1wTime}  //*[@role="dialog"]//*[contains(text(),'1w')]
${Loc_SignalQuality}  //*[@class='goog-menuitem-content' and text()='Signal Quality']
${Loc_SignalQualitydata}  //*[text()='Signal Quality']/ancestor::*[@class="title_heading m_toolbar"]/following-sibling::*//*[@class="highcharts-axis"][1]/*
${Loc_SignalOut}  //*[@role="dialog"]//*[@class="m_body"]/*//*[text()='Signal']/parent::*/following-sibling::*[4]
${Loc_SignalNoise}  //*[@role="dialog"]//*[@class="m_body"]/*//*[text()='Noise']/parent::*/following-sibling::*[4]
${Loc_ChartScroll}  //*[@class="charts"]
${Loc_2hTime}  //div[@class='timerange-picker']/div[contains(text(),'2h')]


### Reference 
${Loc_graphDataClients}  //*[text()='Usage']/ancestor::*[@class="title_heading m_toolbar"]/following-sibling::*//*[@class="highcharts-series-group"]/*[contains(@transform,'translate')]/*
###



${Loc_cl_Username}  //*[contains(text(),'Username:')]/following-sibling::*
${Loc_Cla_Username}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Username')]/following-sibling::*
${Loc_Cl_Role}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Role')]/following-sibling::*
${Loc_Cl_SignalQuality}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Signal Quality:')]/following-sibling::*
${Loc_Cl_Duration}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Duration')]/following-sibling::*
${Loc_Cl_Mode}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Mode:')]/following-sibling::*
${Loc_Cl_Usage}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Usage:')]/following-sibling::*
${Loc_Cl_SSID}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'SSID:')]/following-sibling::*
${Loc_Cl_Channelwidth}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Channel Width:')]/following-sibling::*
${Loc_Cl_LAN IP1}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'LAN IP 1:')]/following-sibling::*/*/*
${Loc_Cl_AuthType}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Auth Type')]/following-sibling::*
${Loc_Cl_Cipher}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Cipher')]/following-sibling::*
${Loc_Cl_Device}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Device')]/following-sibling::*/*
${Loc_Cl_Controller}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Controller')]/following-sibling::*/*
${Loc_Cl_Radio}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Radio')]/following-sibling::*/*
${Loc_Cl_Vlan}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'VLAN:')]/following-sibling::*
${Loc_Cl_ForwardMode}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Forward Mode:')]/following-sibling::*
${Loc_Cl_LAN Hostname1}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'LAN Hostname 1:')]/following-sibling::*
${Loc_Cl_Security Mode}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Security Mode:')]/following-sibling::*
${Loc_Cl_Group}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Group:')]/following-sibling::*/*
${Loc_Cl_Folder}  //*[contains(text(),'Current Association')]/parent::*//*[contains(text(),'Folder:')]/following-sibling::*/*
