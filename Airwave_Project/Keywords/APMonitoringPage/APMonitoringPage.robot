*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary
Library           String
Library           WebdriverHelper
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Locators/RAPIDSPage.robot
Resource          ../../Locators/APMonitoringPage.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/RAPIDS/RAPIDSPage.robot
Resource          ../Device/DeviceFeature.robot


*** Variables ***
${host}    
${aw10_cli_supportpassword}    
${aw10_cli_supportuser}    
${DeviceName}

*** Keywords ***
Get the controller name from AP Monitor page
    [Documentation]  Get the controller name from AP Monitor page.
    Wait Until Element Is Visible  ${Loc_APMonitoringTableLocator}
    Sleep  3s
    ${apName}  Get Element Text  //tbody/tr/td[@nowrap='nowrap']/a
    [Return]  ${apName}
    
Verify the controller name on rogue-AP Monitor page
    [Documentation]  Get the controller name from rogue-AP Monitor page.
    [Arguments]  ${DeviceName}
    Click on AP link from rogue list
    ${apName}  Get the controller name from AP Monitor page
    ${status}  Should Be Equal As Strings  ${apName}  ${DeviceName}
    [return]  ${status}

Wait for Polling
    [Documentation]  Click on the 'Poll Now' button and wait for polling complete.
    Reload page
    WaitForPageLoading
    DOMreadyByWaitTime  3
    ${status}  Run Keyword And Return Status  AssertForElementPresent  ${Loc_PollNowButton}
    Run Keyword If  '${status}'!='True'  Wait for Polling
    Log  Polling Completed...!
    
Click Polling Button
    [Documentation]  Click 'Poll Now' button on AP Monitor page.
    Wait Until Element Is Visible  ${Loc_PollNowButton}
    Click  ${Loc_PollNowButton}
    
Get client count from Device Info Section
    DOMreadyByWaitTime  3
    ${clientCount}  Get Text  ${Loc_APM_ClientCountInfo}
    [return]  ${clientCount} 
    
Get client Usage from Device Info Section
    DOMreadyByWaitTime  3
    ${clientUsage}  Get Text  ${Loc_APM_ClientCountInfo}
    ${clientUsage}  Set Variable If  '${clientUsage}'=='-'  0
    [return]  ${clientUsage}  
    
Get client count from Radios section
    DOMreadyByWaitTime  3
    ${columnCount}  Get Element Count  //div[contains(@id,'div_radios')]//*[contains(text(),'Clients')]/parent::th/preceding-sibling::th
    ${clientColumn}  Evaluate  ${columnCount}+1
    @{radioIndexRows}  Get Webelements  //div[contains(@id,'div_radios')]//tr[@class='tableHeader']/following-sibling::tr/td[${clientColumn}]
    Set Test Variable  ${clientCount}  0
    :FOR  ${radio}  IN  @{radioIndexRows}
    \    ${clientCount}  Evaluate  ${clientCount}+${radio.text}
    \    
    [return]  ${clientCount}
     
Get client count from Graph section
    DOMreadyByWaitTime  3
    Click  ${Loc_DeviceListTimeInterval2h}
    WaitForPageLoading
    Click  ${Loc_DeviceListChart1Dropdown}
    DOMreadyByWaitTime  2
    Click  //div[@class='goog-menuitem-content' and text()='Clients']
    @{charts}  Get Webelements  ${Loc_DeviceListClient_Chart}
    Double Click  @{charts}[0]
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_DeviceListChartPopup}
    Set Test Variable  ${value}  0
    @{clientRadios}  Get Webelements  //div[@class='m_dialog_content_container']//tbody/tr/td[2]
    :FOR  ${radio}  IN  @{clientRadios}
    \    ${elementText}  Get Text  ${radio}
    \    ${value}  Evaluate  ${value}+${elementText}
    \    
    [return]  ${value}
    
Get client usage from Graph section
    DOMreadyByWaitTime  3
    Click  ${Loc_DeviceListTimeInterval2h}
    WaitForPageLoading
    Click  ${Loc_DeviceListChart1Dropdown}
    DOMreadyByWaitTime  2
    Click  //div[@class='goog-menuitem-content' and text()='Usage']
    @{charts}  Get Webelements  ${Loc_DeviceListClient_Chart}
    Double Click  @{charts}[0]
    DOMreadyByWaitTime  3
    WaitForElementPresent  ${Loc_DeviceListChartPopup}
    Set Test Variable  ${value}  0
    @{clientRadios}  Get Webelements  //div[@class='m_dialog_content_container']//tbody/tr/td[2]
    :FOR  ${radio}  IN  @{clientRadios}
    \    ${elementText}  Get Text  ${radio}
    \    @{values}  Split String  ${elementText}
    \    log  @{values}[0]
    \    ${value}  Evaluate  ${value}+@{values}[0]
    \    
    [return]  ${value}  
    
Get client count from by client Overview Page Graph section
    [Arguments]    ${Section}
    DOMreadyByWaitTime  3
    ${ele_Count}  Get Element Count  //div[@class='highcharts-container']//*[contains(text(),'${Section}')]/ancestor::*[name()='text']/following-sibling::*[name()='g']//*[@class='highcharts-legend-item']
    ${ele_count}  Evaluate  ${ele_count}+1
    Set Test Variable  ${count}  0
    :FOR  ${index}  IN RANGE  1  ${ele_count}
    \    
    \    Click  //div[@class='highcharts-container']//*[contains(text(),'${Section}')]/ancestor::*[name()='text']/following-sibling::*[name()='g']//*[@class='highcharts-legend-item'][${index}]
    \    WaitForElementPresent  //div[@role='dialog']
    \    ${dialogTitle}  Get Element Text  //div[@role='dialog']//span[@role='heading']
    \    @{values}  Split String  ${dialogTitle}
    \    Log  @{values}[0]
    \    ${count}  Evaluate  ${count}+@{values}[0]
    \    Click  css=span.mwx_dialog-title-close
    \    DOMreadyByWaitTime  3
    \    
    [return]  ${count}      

Verify Client Count In AP Monitor Page 
    DOMreadyByWaitTime  3
    ${clientcountFromDeviceInfo}  Get client count from Device Info Section
    ${clientcountFromRadioInfo}  Get client count from Radios section
    ${clientcountFromGraphInfo}  Get client count from Graph section
    ${status}  Run Keyword And Return Status  Evaluate  ${clientcountFromDeviceInfo}==${clientcountFromRadioInfo}==${clientcountFromGraphInfo}
    [return]  ${status}
    
Verify Client Count on Home Overview Page 
    DOMreadyByWaitTime  3
    ${clientcountFromGraphInfo}  Get client count from Graph section
    ${clientCount}   Get Client Count From DB  
    ${status}  Run Keyword And Return Status  Evaluate  ${clientCount}==${clientcountFromGraphInfo}
    [return]  ${status}
    
Verify Client usage on Home Overview Page 
    DOMreadyByWaitTime  3
    ${clientusageFromGraphInfo}  Get client usage from Graph section
    ${clientUsage}   Get Client Usage From DB  
    ${status}  Run Keyword And Return Status  Evaluate  ${clientUsage}==${clientusageFromGraphInfo}
    [return]  ${status}
    
Verify Client counts on Clients Overview Page
    [Arguments]    ${Section} 
    DOMreadyByWaitTime  3
    ${clientcountFromGraphInfo}  Get client count from by client Overview Page Graph section  ${Section}
    ${clientcount}   Get Client Count From DB  ${Section}
    ${status}  Run Keyword And Return Status  Evaluate  ${clientcount}==${clientcountFromGraphInfo}
    [return]  ${status}
    
Verify Client Usage In AP Monitor Page 
    DOMreadyByWaitTime  3
    ${clientusageFromDeviceInfo}  Get client Usage from Device Info Section
    ${clientusageFromGraphInfo}  Get client usage from Graph section
    ${status}  Verify the Client Usage Details  ${clientusageFromDeviceInfo}  ${clientusageFromGraphInfo}
    [return]  ${status}
    
Get Client Count From DB
    [Arguments]  ${getBy}=Overall
    @{host_IP}  Split String  ${host}  //
    ${count}  Get Client Count  @{host_IP}[-1]  ${aw10_cli_supportuser}  ${aw10_cli_supportpassword}  ${getBy}
    [return]  ${count}
    
Get Client Usage From DB
    @{host_IP}  Split String  ${host}  //
    ${count}  Get Client Usage  @{host_IP}[-1]  ${aw10_cli_supportuser}  ${aw10_cli_supportpassword}
    [return]  ${count}
   
Verify the search value
    [Arguments]  ${value}
    Navigate To Home Page
    Search By  ${value}
    DOMreadyByWaitTime  3
    ${status}  Run Keyword And Return Status  AssertForElementPresent  //td[contains(text(),'${value}')]
    [return]  ${status}
    
Verify the client counts on client Connected page
    DOMreadyByWaitTime  3
    Go To Folder  Top
    ${clientcountFromConnectedPage}  Get Element Text  //*[@class='monitoring_title' and text()='CLIENTS']/following::div/div[@class='monitoring_view']/a
    ${clientcountFromGraph}  Get client count from Graph section
    ${status}  Run Keyword And Return Status  Evaluate  ${clientcountFromGraph}==${clientcountFromConnectedPage}
    [return]  ${status}
    
Verify the client usage on client Connected page
    DOMreadyByWaitTime  3
    Go To Folder  Top
    ${clientusageFromConnectedPage}  Get Element Text  //*[@class='monitoring_title' and text()='USAGE']/following::div/div[@class='monitoring_view']/a
    ${clientusageFromGraph}  Get client usage from Graph section
    ${status}  Run Keyword And Return Status  Evaluate  ${clientusageFromGraph}==${clientusageFromConnectedPage}
    [return]  ${status}
    
Verify the client table on client Connected page
    DOMreadyByWaitTime  3
    Go To Folder  Top
    Create a New filter for Client Details
    ${clientusageFromConnectedPage}  Get Element Text  //*[@class='monitoring_title' and text()='USAGE']/following::div/div[@class='monitoring_view']/a
    ${clientusageFromGraph}  Get client usage from Graph section
    ${status}  Run Keyword And Return Status  Evaluate  ${clientusageFromGraph}==${clientusageFromConnectedPage}
    [return]  ${status}
    
Create a New filter for Client Details
    DOMreadyByWaitTime  3
    Click  //*[@id='section-controls']//li/a[text()='Clients']
    WaitForPageLoading
    Click  css=a.icosolo.icon_arrow_down
    Sleep  3s
    Click  xpath=//a[@class='menu_item enable']
    Wait Until element is visible  css=.mwx_dialog.panel.no_pad.rounded
    Type  //div[@class='filter_data']/input[@type='text']  Filter_01
    DOMreadyByWaitTime  2
    @{columns}  Create List  Connection Mode  Role  Sig. Qual.  Device Type  OS Detail  Channel Width  Duration  SSID  VLAN  Device Name  LAN IP Addresses  Cipher  Auth. Type
    :FOR  ${column}  IN  @{columns}
    \    DOMreadyByWaitTime  2
    \    ${element}  Get WebElement  xpath=//div[text()='${column}']
    # \    webdriverlib_helper_init
    # \    scroll_by_javascript  ${element}
    # \    Execute Javascript  ${js_ScrollToView}  ${element}
    \    Scroll element into view  xpath=//div[text()='${column}']
    \    DOMreadyByWaitTime  2
    \    Drag and Drop  xpath=//div[text()='${column}']  css=div#actual_col_list.column_list
    \    DOMreadyByWaitTime  2
    \    
    Click  //div[@class='mwx_dialog-buttons']/button[@name='ok']    
