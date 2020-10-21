*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../Locators/HomeFT.robot
Resource          ../../Utilities/Data_Provider.robot

*** Keywords ***
Get Summary Pie Chart data
    DOMreadyByWaitTime  10
    ${count}  Get element Count  ${Loc_PieClientName}
    Run keyword if  ${count}==1  Pass Execution  WARNING:No data..So Passing the TestCase!
    Scroll Element into View  ${Loc_SummaryPieChart}
    AssertForElementPresent  ${Loc_SummaryPieChart}
    ${Total}  Set Variable  0
    Log  Connection Summary PieChart Present!  console=True
    :FOR  ${i}  IN RANGE  1  ${count}
    \    ${Client}  Get Element Text  (${Loc_PieClientName})[${i}]
    \    ${2.4Ghz}  Get Element Text  (${Loc_Pie2.4GHz})[${i}]
    \    ${2.4Ghz}  Run Keyword if  '${2.4Ghz}'=='-'  Set variable  0
    \    ...  ELSE  Set variable  ${2.4Ghz} 
    \    ${2.4Ghz}  Convert To Integer  ${2.4Ghz}
    \    ${5Ghz}  Get Element Text  (${Loc_Pie5GHz})[${i}]
    \    ${5Ghz}  Run Keyword if  '${5Ghz}'=='-'  Set variable  0
    \    ...  ELSE  Set variable  ${5Ghz}
    \    ${5Ghz}  Convert To Integer  ${5Ghz}
    \    Log  ${Client} - 2.4Ghz: ${2.4Ghz}  console=True
    \    Log  ${Client} - 5Ghz: ${5Ghz}  console=True
    \    ${clientTotal}  Evaluate  ${2.4Ghz}+${5Ghz}
    \    Log  ${Client} - Total: ${clientTotal}
    \    ${Total}  Evaluate  ${Total}+${clientTotal}
    Log  Total Clients: ${Total}  console=True

Get Health Chart data
    DOMreadyByWaitTime  10
    ${Amp_data}  Set Variable  0
    ${count}  Get element Count  ${Loc_HealthChart}
    Run keyword if  ${count}==0  Pass Execution  WARNING:No data..So Passing the TestCase!
    ${ycount}  Get element count  ${Loc_Health_Yaxis}
    Run keyword if  ${ycount}==0  Pass Execution  WARNING:No data..So Passing the TestCase!
    Scroll element into view  ${Loc_HealthChart}
    @{HealthData}  Get WebElements  ${Loc_HealthChart}
    :FOR  ${data}  IN  @{HealthData}
    \    ${val}  Get Element Text  ${data}
    \    ${val}  Convert To Integer  ${val}
    \    ${Amp_data}  Evaluate  ${Amp_data}+${val}
    \    Log  ${val}  console=True
    Log  AMP Health Data : ${Amp_data}  console=True
    
Get SNR Chart data
     DOMreadyByWaitTime  10
    ${Amp_data}  Set Variable  0
    ${count}  Get element Count  ${Loc_SNRchart}
    Run keyword if  ${count}==0  Pass Execution  WARNING:No data..So Passing the TestCase!
    ${ycount}  Get element count  ${Loc_SNR_Yaxis}
    Run keyword if  ${ycount}==0  Pass Execution  WARNING:No data..So Passing the TestCase!
    Scroll element into view  ${Loc_SNRchart}
    @{SNRData}  Get WebElements  ${Loc_SNRchart}
    :FOR  ${data}  IN  @{SNRData}
    \    ${val}  Get Element Text  ${data}
    \    ${val}  Convert To Integer  ${val}
    \    ${Amp_data}  Evaluate  ${Amp_data}+${val}
    \    Log  ${val}  console=True
    Log  AMP SNR Data : ${Amp_data}  console=True
    
Get Speed Chart data
    DOMreadyByWaitTime  10
    ${Amp_data}  Set Variable  0
    ${count}  Get element Count  ${Loc_SpeedChart}
    Run keyword if  ${count}==0  Pass Execution  No data!
    ${ycount}  Get element count  ${Loc_Speed_Yaxis}
    Run keyword if  ${ycount}==0  Pass Execution  No data!
    Scroll element into view  ${Loc_SpeedChart}
    @{SpeedData}  Get WebElements  ${Loc_SpeedChart}
    :FOR  ${data}  IN  @{SpeedData}
    \    ${val}  Get Element Text  ${data}
    \    ${val}  Convert To Integer  ${val}
    \    ${Amp_data}  Evaluate  ${Amp_data}+${val}
    \    Log  ${val}  console=True
    Log  AMP Speed Data : ${Amp_data}  console=True
    
Get Least Healthy Client data
    DOMreadyByWaitTime  10
    ${Amp_data}  Set Variable  0
    ${count}  Get element Count  ${Loc_leastHealthClient}
    Run keyword if  ${count}==0  Pass Execution  WARNING:No data..So Passing the TestCase!
    Scroll element into view  ${Loc_leastHealthClient}
    @{LeastClientHealthData}  Get WebElements  ${Loc_leastHealthClient}
    :FOR  ${data}  IN  @{LeastClientHealthData}
    \    ${val}  Get Element Text  ${data}
    \    ${val}  Convert To Integer  ${val}
    \    ${Amp_data}  Evaluate  ${Amp_data}+${val}
    \    Log  ${val}  console=True
    Log  AMP Least Healthy Client Data : ${Amp_data}  console=True
    
Get Lowest SNR Client data
    DOMreadyByWaitTime  3
    ${Amp_data}  Set Variable  0
    ${count}  Get element Count  ${Loc_LowestSNRClient}
    Run keyword if  ${count}==0  Pass Execution  WARNING:No data..So Passing the TestCase!
    Scroll element into view  ${Loc_LowestSNRClient}
    @{LowestSNRclientData}  Get WebElements  ${Loc_LowestSNRClient}
    :FOR  ${data}  IN  @{LowestSNRclientData}
    \    ${val}  Get Element Text  ${data}
    \    ${val}  Convert To Integer  ${val}
    \    ${Amp_data}  Evaluate  ${Amp_data}+${val}
    \    Log  ${val}  console=True
    Log  AMP Lowest SNR Client Data : ${Amp_data}  console=True
    
Get Lowest Speed Client data
    DOMreadyByWaitTime  10
    ${Amp_data}  Set Variable  0
    ${count}  Get element Count  ${Loc_LowestSpeedClient}
    Run keyword if  ${count}==0  Pass Execution  WARNING:No data..So Passing the TestCase!
    Scroll element into view  ${Loc_LowestSpeedClient}
    @{LowestSpeedclientData}  Get WebElements  ${Loc_LowestSpeedClient}
    :FOR  ${data}  IN  @{LowestSpeedclientData}
    \    ${val}  Get Element Text  ${data}
    \    ${val}  Convert To Integer  ${val}
    \    ${Amp_data}  Evaluate  ${Amp_data}+${val}
    \    Log  ${val}  console=True
    Log  AMP Lowest Speed Client Data : ${Amp_data}  console=True
    
Client navigation to Diagnostics Page
    DOMreadyByWaitTime  10
    ${count1}  Get element Count  ${Loc_ClickClient1}
    ${count2}  Get element Count  ${Loc_ClickClient2}
    ${count3}  Get element Count  ${Loc_ClickClient3}
    Run keyword if  ${count1}==0 and ${count2}==0 and ${count3}==0  Pass execution  No Clients!
    Run keyword if  "${count1}"!="0"  Check Diagnostic Navigation  ${Loc_ClickClient1}
    Run keyword if  "${count2}"!="0"  Check Diagnostic Navigation  ${Loc_ClickClient2}
    Run keyword if  "${count3}"!="0"  Check Diagnostic Navigation  ${Loc_ClickClient3}
    
    
    
Check Diagnostic Navigation
    [Arguments]  ${Loc_ClickClient}
    Scroll element into view  ${Loc_ClickClient}
    Click  ${Loc_ClickClient}
    DOMreadyByWaitTime  10
    AssertForElementPresent  ${Loc_ClientDiagnosticNavigation}
    Log  Client Navigated to Diagnostic Page from RF Performance!  console=True
    Pass Execution  Navigation verified!
    
    
    