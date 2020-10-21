*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../Locators/ClientsFT.robot
Resource          ../../Utilities/Data_Provider.robot


*** Keywords ***
Click MAC address of Connected Client
    DOMreadyByWaitTime  3
    Click  ${Loc_Folder_Dropdown}
    DOMreadyByWaitTime  2
    Click  ${Loc_Top_ClientsOption}
    DOMreadyByWaitTime  3
    ${MAC_count}  Get Element Count  ${Loc_MACAddressFT}
    Run Keyword If  '${MAC_count}'=='0'  Fail  No Connected Clients!
    Click  ${Loc_MACAddressFT}
    DOMreadyByWaitTime  3
    
Get Device Info on Clients Diagnostic Page
    WaitForElementPresent  ${Loc_DeviceInfoTitle}
    DOMreadyByWaitTime  3
    Scroll element into view  ${Loc_Username}
    Log  Device Info  console=True
    ${username}  Get element Text  ${Loc_Username}
    Log  Username: ${username}  console=True
    ${deviceType}  Get element Text  ${Loc_DeviceType}
    Log  Device Type: ${deviceType}  console=True
    ${MACaddress}  Get element Text  ${Loc_MACaddress}
    Log  MAC address: ${MACaddress}  console=True
    ${Role}  Get Element Text  ${Loc_Role}
    Log  Role: ${Role}  console=True
    
Get Device Info on Clients Detail Page
    Navigate to Clients Detail Page
    ${Username}  Get Element Text  ${Loc_cl_Username}
    Log  Username: ${Username}  console=True
    
Get current association on Clients Detail Page
    WaitForElementPresent  ${Loc_CLientDetailValue}
    Click  ${Loc_CLientDetailValue}
    DOMreadyByWaitTime  3
    Log  Current Association Info  console=True
    ${Cla_Username}  Get Current Assctn Data  Username  ${Loc_Cla_Username}
    ${Cl_Role}  Get Current Assctn Data  Role  ${Loc_Cl_Role}
    ${Cl_SignalQuality}  Get Current Assctn Data  Signal Quality  ${Loc_Cl_SignalQuality}
    ${Cl_Duration}  Get Current Assctn Data  Duration  ${Loc_Cl_Duration}
    ${Cl_Mode}  Get Current Assctn Data  Mode  ${Loc_Cl_Mode}
    ${Cl_Usage}  Get Current Assctn Data  Usage  ${Loc_Cl_Usage}
    ${Cl_SSID}  Get Current Assctn Data  SSID  ${Loc_Cl_SSID}
    ${Cl_Channelwidth}  Get Current Assctn Data  Channelwidth  ${Loc_Cl_Channelwidth}
    ${Cl_LAN IP1}  Get Current Assctn Data  LAN IP1  ${Loc_Cl_LAN IP1}
    ${Cl_AuthType}  Get Current Assctn Data  AuthType  ${Loc_Cl_AuthType}
    ${Cl_Cipher}  Get Current Assctn Data  Cipher  ${Loc_Cl_Cipher}
    ${Cl_Device}  Get Current Assctn Data  Device  ${Loc_Cl_Device}
    ${Cl_Controller}  Get Current Assctn Data  Controller  ${Loc_Cl_Controller}
    ${Cl_Radio}  Get Current Assctn Data  Radio  ${Loc_Cl_Radio}
    ${Cl_Vlan}  Get Current Assctn Data  VLAN  ${Loc_Cl_Vlan}
    ${Cl_ForwardMode}  Get Current Assctn Data  Forward Mode  ${Loc_Cl_ForwardMode}
    ${Cl_LAN Hostname1}  Get Current Assctn Data  LAN Hostname1  ${Loc_Cl_LAN Hostname1}
    ${Cl_Security Mode}  Get Current Assctn Data  Security Mode  ${Loc_Cl_Security Mode}
    ${Cl_Group}  Get Current Assctn Data  Group  ${Loc_Cl_Group}
    ${Cl_Folder}  Get Current Assctn Data  Folder  ${Loc_Cl_Folder}
    
    

Get current association on Clients Diagnostic Page
    WaitForElementPresent  ${Loc_CurrentassociationTitle}
    DOMreadyByWaitTime  3
    Scroll element into view  ${Loc_Connectionmode}
    Log  Current Association  console=True
    ${ConnectionMode}  Get element Text  ${Loc_Connectionmode}
    Log  Connection Mode: ${ConnectionMode}  console=True
    ${duration}  Get element Text  ${Loc_Duration}
    Log  Duration: ${duration}  console=True
    ${IPaddress}  Get element Text  ${Loc_IPaddress}
    Log  IP address: ${IPaddress}  console=True
    ${Hostname}  Get Element Text  ${Loc_Hostname}
    Log  Hostname: ${Hostname}  console=True
    ${Usage}  Get Current Assctn Data  Usage  ${Loc_Usage}
    ${Security Mode}  Get Current Assctn Data  Security Mode  ${Loc_securityMode}
    ${Cipher}  Get Current Assctn Data  Cipher  ${Loc_Cipher}
    ${Auth Type}  Get Current Assctn Data  Auth Type  ${Loc_AuthType}
    ${VLAN}  Get Current Assctn Data  VLAN  ${Loc_VLAN}
    ${Forward Mode}  Get Current Assctn Data  Forward Mode  ${Loc_FwdMode}
    ${SNR}  Get Current Assctn Data  SNR  ${Loc_SNR}
    ${SSID}  Get Current Assctn Data  SSID  ${Loc_SSID}
    
    
Verify Quality Data
    AssertForElementPresent  ${Loc_QualityData}
    Scroll element into view  ${Loc_QualityData}
    Log  Quality Data verified!  console=True
    
    
    

Get Current Assctn Data
    [Arguments]  ${name}  ${Locator}
    Scroll element into view  ${Locator}
    ${data}  Get Element Text  ${Locator}
    Log  ${name}: ${data}  console=True
    [return]  ${data}
    
    
Get the values from Goodput chart
    Navigate to Clients Detail Page
    Click  ${Loc_2hTime}
    DOMreadyByWaitTime  3
    Click  ${Loc_GraphDropdown}
    DOMreadyByWaitTime  3
    Click  ${Loc_Goodputgraph}
    DOMreadyByWaitTime  3
    ${Count}  get element Count  ${Loc_Goodputdatagraph}
    Run keyword If  ${Count}==0  Fail  No Data!
    Mouse over  ${Loc_Goodputdatagraph}
    DOMreadyByWaitTime  3
    Double Click  ${Loc_Goodputdatagraph}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_Diagbox}
    ${TotalIn}  Get element text  ${Loc_GoodputTotalIn}
    Log  GoodPut Total In : ${TotalIn}  console=True
    ${totalOut}  Get element text  ${Loc_GoodputTotalOut}
    Log  GoodPut Total Out : ${totalOut}  console=True
    Click  ${Loc_CloseDialog}
    
Get the values from Speed chart
    Navigate to Clients Detail Page
    Click  ${Loc_2hTime}
    DOMreadyByWaitTime  3
    Click  ${Loc_GraphDropdown}
    DOMreadyByWaitTime  3
    Click  ${Loc_Speedgraph}
    DOMreadyByWaitTime  3
    ${Count}  get element Count  ${Loc_Speeddatagraph}
    Run keyword If  ${Count}==0  Fail  No Data!
     Mouse over  ${Loc_Speeddatagraph}
   DOMreadyByWaitTime  3
    Double Click  ${Loc_Speeddatagraph}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_Diagbox}
    ${Total}  Get Element Text  ${Loc_SpeedTotal}
    Log  Speed Total : ${Total}  console=True
    Click  ${Loc_CloseDialog}
    
Get the values from Health chart
    Navigate to Clients Detail Page
    Click  ${Loc_2hTime}
    DOMreadyByWaitTime  3
    Click  ${Loc_GraphDropdown}
    DOMreadyByWaitTime  3
    Click  ${Loc_Healthgraph}
    DOMreadyByWaitTime  3
    ${Count}  get element Count  ${Loc_Healthdatagraph}
    Run keyword If  ${Count}==0  Fail  No Data!
    Mouse over  ${Loc_Healthdatagraph}
   DOMreadyByWaitTime  3
    Double Click  ${Loc_Healthdatagraph}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_Diagbox}
    ${Total}  Get Element Text  ${Loc_HealthTotal}
    Log  Health : ${Total}  console=True
    Click  ${Loc_CloseDialog}
    Click  ${Loc_GraphDropdown}
    DOMreadyByWaitTime  3
    Click  ${Loc_SignalQuality}
    DOMreadyByWaitTime  3
    
Get the values from Usage chart for 2h,1d,1w
    Navigate to Clients Detail Page
    Click  ${Loc_2hTime}
    DOMreadyByWaitTime  3
    Click  ${Loc_GraphDropdown}
    DOMreadyByWaitTime  3
    Click  ${Loc_Usagedetailgraph}
    DOMreadyByWaitTime  3
    ${Count}  get element Count  ${Loc_Usagedatagraph}
    Run keyword If  ${Count}==0  Fail  No Data!
   Mouse over  ${Loc_Usagedatagraph}
   DOMreadyByWaitTime  3
    Double Click  ${Loc_Usagedatagraph}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_Diagbox}
    ${2hTotalIn}  Get element text  ${Loc_UsageTotalIn}
    Log  Usage 2h Total In : ${2hTotalIn}  console=True
    ${2htotalOut}  Get element text  ${Loc_UsageTotalOut}
    Log  Usage 2h Total Out : ${2htotalOut}  console=True
    Click  ${Loc_1dTime}
    DOMreadyByWaitTime  3
    ${1dTotalIn}  Get element text  ${Loc_UsageTotalIn}
    Log  Usage 1d Total In : ${1dTotalIn}  console=True
    ${1dtotalOut}  Get element text  ${Loc_UsageTotalOut}
    Log  Usage 1d Total Out : ${1dtotalOut}  console=True
    Click  ${Loc_1wTime}
    DOMreadyByWaitTime  3
    ${1wTotalIn}  Get element text  ${Loc_UsageTotalIn}
    Log  Usage 1w Total In : ${1wTotalIn}  console=True
    ${1wtotalOut}  Get element text  ${Loc_UsageTotalOut}
    Log  Usage 1w Total Out : ${1wtotalOut}  console=True
    Click  ${Loc_CloseDialog}
    

Get the values from Signal and Noise chart for 2h,1d,1w
     Navigate to Clients Detail Page
     Click  ${Loc_2hTime}
    DOMreadyByWaitTime  3
     Click  ${Loc_GraphDropdown}
     DOMreadyByWaitTime  3
     Click  ${Loc_SignalQuality}
     DOMreadyByWaitTime  3
     ${Count}  get element Count  ${Loc_SignalQualitydata}
    Run keyword If  ${Count}==0  Fail  No Data!
   Mouse over  ${Loc_SignalQualitydata}
   DOMreadyByWaitTime  3
    Double Click  ${Loc_SignalQualitydata}
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_Diagbox}
    ${2hsignal}  Get element text  ${Loc_SignalOut}
    Log  Signal 2h : ${2hsignal}  console=True
    ${2hNoise}  Get element text  ${Loc_SignalNoise}
    Log  Noise 2h : ${2hNoise}  console=True
    Click  ${Loc_1dTime}
    DOMreadyByWaitTime  3
    ${1dsignal}  Get element text  ${Loc_SignalOut}
    Log  Signal 1d : ${1dsignal}  console=True
    ${1dNoise}  Get element text  ${Loc_SignalNoise}
    Log  Noise 1d : ${1dNoise}  console=True
    Click  ${Loc_1wTime}
    DOMreadyByWaitTime  3
    ${1wsignal}  Get element text  ${Loc_SignalOut}
    Log  Signal 1w : ${1wsignal}  console=True
    ${1wNoise}  Get element text  ${Loc_SignalNoise}
    Log  Noise 1w : ${1wNoise}  console=True
    Click  ${Loc_CloseDialog}
     

    
    
    

        

    
    
Check Visual RF Data in Client Detail Page
    Navigate to Clients Detail Page
    WaitForElementPresent  ${Loc_RFData_Title}
    Click  ${Loc_RFData_Title}
    DOMreadyByWaitTime  3
    AssertForElementPresent  ${Loc_RFData_Floor}
    Scroll element into view  ${Loc_RFData_Floor}
    DOMreadyByWaitTime  5
    Log  Visual RF Data in Clients Detail Page verified!  console=True
    
Check Visual RF Data in Client Diagnostic Page
    WaitForElementPresent  ${Loc_RFTitle_Diagnostic}
    DOMreadyByWaitTime  5
    AssertForElementPresent  ${Loc_RFimg_Diagnostic}
    Scroll element into view  ${Loc_RFimg_Diagnostic}
    DOMreadyByWaitTime  5
    Log  Visual RF Data in Clients Diagnostics Page verified!  console=True
    
Check Usage, Signal and Noise and SNR graphs in Clients Diagnostic Page
    ### Usage graph
    AssertForElementPresent  ${Loc_UsageGraph}
    Log  Usage Graph in Client Diagnostic page verified!  console=True
    ### Signal and Noise graph
    AssertForElementPresent  ${Loc_Signal&NoiseGraph}
    Log  Signal and Noise Graph in Client Diagnostic page verified!  console=True
    ### SNR graph
    AssertForElementPresent  ${Loc_SNRgraph}
    Log  SNR Graph in Client Diagnostic page verified!  console=True
    
Get Client, AP, controller name in Client Detail Page
    Navigate to Clients Detail Page
    WaitForElementPresent  ${Loc_CLientDetailValue}
    Click  ${Loc_CLientDetailValue}
    DOMreadyByWaitTime  3
    ${ClientName}  Get element Text  ${Loc_ClientName}
    log  Client Name: ${ClientName}  console=True
    ${WirelessName}  Get element Text  ${Loc_WirelessName}
    log  Wireless Name: ${WirelessName}  console=True
    ${APName}  Get element Text  ${Loc_APName}
    log  AP Name: ${APName}  console=True
    ${ControllerName}  Get element Text  ${Loc_ControllerName}
    log  Controller Name: ${ControllerName}  console=True
    [return]  ${WirelessName}  ${APName}  ${ControllerName}
    
Verify the network diagram in Client Diagnostic Page
    [Arguments]  ${WirelessName}  ${APName}  ${ControllerName}
    Navigate to Clients Diagnostics Page
    ### Client
    AssertForElementPresent  ${Loc_ClientNetwork}
    Scroll element into view  ${Loc_ClientNetwork}
    Log  Client Network verified!  console=True
    ### Wireless device
    AssertForElementPresent  //*[text()='${WirelessName}']/ancestor::td/div
    Log  Wireless - ${WirelessName} Network verified!  console=True
    ### Device or AP
    AssertForElementPresent  //*[text()='${APName}']/ancestor::td/div
    Log  AP - ${APName} Network verified!  console=True
    ### Controller
    AssertForElementPresent  //*[text()='${ControllerName}']/ancestor::td/div
    Log  Controller - ${ControllerName} Network verified!  console=True
    
    
    
    
    
    
    
    

Navigate to Clients Detail Page
    Wait Until Element Is Visible  ${Loc_Client_detailFT}
    Sleep  3s
    Click  ${Loc_Client_detailFT}
    Wait Until Element Is Not Visible  ${loader}  30s
    DOMreadyByWaitTime  5
   
Navigate to Clients Diagnostics Page
    Wait Until Element Is Visible  ${Loc_Client_DiagnosticFT}
    Sleep  3s
    Click  ${Loc_Client_DiagnosticFT}
    Wait Until Element Is Not Visible  ${loader}  30s
    DOMreadyByWaitTime  5
    
