*** Variables ***

${Loc_RapidsDropdownrole}  //*[contains(@name,"rapids")]
${VRF_Dropdownrole}  //*[contains(@name,"visualrf")]
${Loc_SignonDropdownrole}  //*[contains(@name,"aruba_controller_role")]
${Loc_DevAccess_Dropdownrole}  //*[contains(@name,"ap_access_level")]
${viewbutton_css}  //div[@class="vrf_tab_bar vrf_tab_bar-vertical"]/*[contains(text(),'View')]

${displayclient_xpath}  xpath=//*[contains(text(),'Display client')]/following::label[2]
${displayclient_xpath1}  xpath=//*[contains(text(),'Display client')]/following::label[1]
${clientairwave_css}  css=.selectBox[name='amp_access_level']
${clientairwave1_css}  AirWave Management Client
${clientairwave2_css}  Guest Access Sponsor 
${expcted_output}  New Role added successfully.

${Vrfcol1}  Home
${Vrfcol2}  Overview
${Vrfcol3}  Traffic Analysis
${Vrfcol4}  UCC
${Vrfcol5}  RF Performance
${Vrfcol6}  RF Capacity
${Vrfcol7}  AirMatch
${Vrfcol8}  Clarity
${Vrfcol9}  Topology
${Vrfcol10}  Mesh
${Vrfcol11}  Network Deviations
${Vrfcol12}  Documentation
${Vrfcol13}  License
${Vrfcol14}  User Info
${Vrfcol15}  Groups
${Vrfcol16}  Devices
${Vrfcol17}  Clients
${Vrfcol18}  Reports
${Vrfcol19}  System
${Vrfcol20}  Device Setup
${Vrfcol21}  AMP Setup
${Vrfcol22}  RAPIDS
${Vrfcol23}  VisualRF

${Help_Icon}  xpath=//*[contains(@class,'icon_help')]
${VRF_Text}  xpath=//*[contains(text(),'Using VisualRF')]
${expected_outputVRF1}  Using VisualRF

${Loc_Clean_campusRemoveFT}  //*[text()='Remove']
${Loc_clean_confirmremoveFT}  //*[@name="ok"]

${Loc_DefaultView}  xpath=//*[contains(text(),'admin')]/following-sibling::td/*[contains(text(),'Admin')]
${Loc_SelectedChkbox}  css=[name='delete_ids'][disabled='']
${Loc_ReadWriteProp}  xpath=//*[contains(@class,'sidenav')]/*
${Loc_UsingVRF}  xpath=//*[contains(text(),'Using VisualRF')]

${Loc_RefreshIcon}  //*[contains(@title,'Refresh')]
${Loc_NetworkVer}  //*[@title="Network"]


##3##################################
${Loc_SaveButtonRole}  //*[@name="save"]