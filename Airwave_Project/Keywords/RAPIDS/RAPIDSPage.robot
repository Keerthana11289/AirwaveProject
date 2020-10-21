*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Locators/RAPIDSPage.robot
Resource          ../../Locators/APMonitoringPage.robot
Resource          ../../Keywords/HomePage.robot

*** Variables ***
${Loc_RAPIDSFirstListCheckBox}  //tr[1]/td[1]/input[@type='checkbox']
${AMProgue_countBeforeUpgrade}

*** Keywords ***
Check whether any rogues displayed or not
    [Documentation]  Verify whether any rogues displayed or not.
    Wait Until Element Is Visible  ${Loc_RAPIDSPageRogueTableLocator}
    Sleep  3s
    ${rowCount}  Get Element Count  //table[contains(@class,'highlightable')]/tbody/tr
    ${status}  Run Keyword And Return Status  Should Be True  ${rowCount} > 0
    [Return]  ${status}
    
Check whether Modify devices link is not present
    [Documentation]  Verify whether Modify devices link is not present.
    Wait Until Element Is Visible  ${Loc_RAPIDSPageRogueTableLocator}
    Sleep  3s
    ${status}  Run Keyword And Return Status  AssertForElementPresent  ${Loc_RAPIDSModifyDeviceActionIcon}
    [Return]  ${status}
    
Click on AP link from rogue list
    [Documentation]  Click on first AP in the Last Discovered AP column in the table.
    Wait Until Element Is Visible  ${Loc_RAPIDSPageRogueTableLocator}
    Sleep  3s
    ${rowCount}  Get Element Count  //tr[1]/th/div[@key='last_discovering_ap_id']/../preceding-sibling::th
    ${count}  Evaluate  ${rowCount}+1
    Click  //tr[1]/td[${count}]
    WaitForPageLoading
    Wait Until Element Is Visible  ${Loc_APMonitoringTableLocator}
    
Change RAPIDS Export Threshold
    [Documentation]  Click on first AP in the Last Discovered AP column in the table.
    [Arguments]  ${exportThresholdType}
    Navigate To RAPIDS Page
    Navigate To RAPIDS Setup Page
    Wait Until Element Is Visible  ${Loc_RAPIDSSetupPageLocator}
    Sleep  3s
    Select Dropdown LabelValue  ${Loc_RAPIDSExportFilter}  ${exportThresholdType}
    Sleep  3s
    Click  ${Loc_RAPIDSSetupApplyButton}
    ${status}  Run Keyword And Return Status  Click  ${Loc_RAPIDSSetupConfirmButton}
    Run Keyword If  '${status}'=='False'  Click  ${Loc_RAPIDSSetupConfirmationCancelButton}
    Wait Until Element Is Visible  ${Loc_RAPIDSSetupPageLocator}  20s
    
Click on Modify Devices link
    [Documentation]  Click on Modify Devices link from RAPIDS List Page.
    # Wait Until Element Is Visible  ${Loc_ModifyDeviceLink}
    Sleep  3s
    Click using Javascript  ${Loc_ModifyDeviceLink}
    Wait Until Element Is Visible  ${Loc_ModifyDeviceSection}
    
Get the First Rogue Name from the RAPIDS table
    [Documentation]  Get the First Rogue Name from the RAPIDS table.
    Wait Until Element Is Visible  //div[contains(text(),'Name')]  10s
    Sleep  3s
    ${rogueNameColumn}  Get Elements Count  //div[contains(text(),'Name')]/../preceding-sibling::th
    ${rogueNamePosition}  Evaluate  ${rogueNameColumn}+1
    ${rogueName}  Get Element Text  //tr[1]/td[${rogueNamePosition}]/a
    [return]  ${rogueName}
    
Select the rogue from the RAPIDS table
   [Documentation]  Select the first rogue from the RAPIDS table.
   ...    
   [Arguments]  ${RogueName}
   Wait Until Element Is Visible  ${Loc_RAPIDSFirstListCheckBox} 
   Sleep  3s
   Click  //a[text()='${RogueName}']//ancestor::tr/td/input[@type='checkbox']
   
Click on RAPIDS classification dropdown and select delete
   [Documentation]  Click on RAPIDS classification dropdown and select delete option.
   ...    
   [Arguments]  ${value}=Delete
   Wait Until Element Is Visible  ${Loc_RAPIDSDeviceAction}
   Click  ${Loc_RAPIDSDeviceAction}
   Click  //div[@class='goog-menuitem-content' and text()='${value}']
   Sleep  3s
   
Delete the rogue from RAPIDS list and Verfiy
   [Documentation]  Delete the rogue from RAPIDS list and Verfiy.
   ...    
   [Arguments]  ${RogueName}
   Click on RAPIDS classification dropdown and select delete
   Select the rogue from the RAPIDS table  ${RogueName}
   Click  ${Loc_RogueDeleteButton}
   Click  ${Loc_RogueDeleteConfirmationButton}
   AssertForTableElementNotPresent  ${RogueName}
   
Verify ARP IP Match Timeout range With Default Value
   [Documentation]  Verify ARP IP Match Timeout range With Default Value.
   ...    
   [Arguments]  ${defaultValue}
   WaitForPageLoading
   ${locator}  Catenate  SEPARATOR=  ${Loc_RAPIDSSetupARPIPMatchTimeout}  [@value='${defaultValue}']
   AssertForElementPresent  ${locator}
   
Verify ARP IP Match Timeout range With Invalid Value
   [Documentation]  Verify ARP IP Match Timeout range With Invalid Value.
   ...    
   [Arguments]  ${invalidValueList}
   :FOR  ${invalidValue}  IN  @{invalidValueList}
   \    Log  Verify ARP IP Match Timeout range with '${invalidValue}' value  console=true
   \    WaitForPageLoading
   \    Type  ${Loc_RAPIDSSetupARPIPMatchTimeoutTextBox}  ${invalidValue}
   \    Click  ${Loc_RAPIDSSetupApplyButton}
   \    AssertForElementPresent  ${Loc_RAPIDSSetupARPIPMatchTimeoutValidationError}
   \    ${Element}  Get Webelement  ${Loc_RAPIDSSetupARPIPMatchTimeoutValidationError}
   \    Log  ${Element.text}  console=true
   \    DOMreadyByWaitTime  3
   \    Reload Page 

Verify ARP IP Match Timeout range With valid Value
   [Documentation]  Verify ARP IP Match Timeout range With valid Value.
   ...    
   [Arguments]  ${validValueList}
   :FOR  ${validValue}  IN  @{validValueList}
   \    
   \    WaitForPageLoading
   \    Type  ${Loc_RAPIDSSetupARPIPMatchTimeoutTextBox}  ${validValue}
   \    Click  ${Loc_RAPIDSSetupApplyButton}
   \    AssertForElementPresent  ${Loc_RAPIDSSetupConfirmButton}
   \    DOMreadyByWaitTime  3
   \    Click  ${Loc_RAPIDSSetupConfirmButton}
   \    Verify ARP IP Match Timeout range With Default Value  ${validValue}
   
Verify Wired-to-Wireless MAC Address Correlation range With Default Value
   [Documentation]  Verify Wired-to-Wireless MAC Address Correlation range With Default Value.
   ...    
   [Arguments]  ${defaultValue}
   WaitForPageLoading
   ${locator}  Catenate  SEPARATOR=  ${Loc_RAPIDSSetupWiredtoWirelessMACAddressCorrelation}  [@value='${defaultValue}']
   AssertForElementPresent  ${locator}
   
Verify Wired-to-Wireless MAC Address Correlation range With Invalid Value
   [Documentation]  Verify Wired-to-Wireless MAC Address Correlation range With Invalid Value.
   ...    
   [Arguments]  ${invalidValueList}
   :FOR  ${invalidValue}  IN  @{invalidValueList}
   \    Log  Verify Wired-to-Wireless MAC Address Correlation range with '${invalidValue}' value  console=true
   \    WaitForPageLoading
   \    Type  ${Loc_RAPIDSSetupWiredtoWirelessMACAddressCorrelation}  ${invalidValue}
   \    Click  ${Loc_RAPIDSSetupApplyButton}
   \    AssertForElementPresent  ${Loc_RAPIDSSetupARPIPMatchTimeoutValidationError}
   \    ${Element}  Get Webelement  ${Loc_RAPIDSSetupARPIPMatchTimeoutValidationError}
   \    Log  ${Element.text}  console=true
   \    DOMreadyByWaitTime  3
   \    Reload Page    

Verify Wired-to-Wireless MAC Address Correlation range With valid Value
   [Documentation]  Verify Wired-to-Wireless MAC Address Correlation range With valid Value.
   ...    
   [Arguments]  ${validValueList}
   :FOR  ${validValue}  IN  @{validValueList}
   \    
   \    WaitForPageLoading
   \    Type  ${Loc_RAPIDSSetupWiredtoWirelessMACAddressCorrelation}  ${validValue}
   \    Click  ${Loc_RAPIDSSetupApplyButton}
   \    AssertForElementPresent  ${Loc_RAPIDSSetupConfirmButton}
   \    DOMreadyByWaitTime  3
   \    Click  ${Loc_RAPIDSSetupConfirmButton}
   \    Verify Wired-to-Wireless MAC Address Correlation range With Default Value  ${validValue}
   \    
   
Verify Wireless BSSID Correlation range With Default Value
   [Documentation]  Verify Wireless BSSID Correlation range With Default Value.
   ...    
   [Arguments]  ${defaultValue}
   WaitForPageLoading
   ${locator}  Catenate  SEPARATOR=  ${Loc_RAPIDSSetupWirelessBSSIDCorrelation}  [@value='${defaultValue}']
   AssertForElementPresent  ${locator}
   
Verify Wireless BSSID Correlation range With Invalid Value
   [Documentation]  Verify Wireless BSSID Correlation range With Invalid Value.
   ...    
   [Arguments]  ${invalidValueList}
   :FOR  ${invalidValue}  IN  @{invalidValueList}
   \    Log  Verify Wireless BSSID Correlation range with '${invalidValue}' value  console=true
   \    WaitForPageLoading
   \    Type  ${Loc_RAPIDSSetupWirelessBSSIDCorrelation}  ${invalidValue}
   \    Click  ${Loc_RAPIDSSetupApplyButton}
   \    AssertForElementPresent  ${Loc_RAPIDSSetupARPIPMatchTimeoutValidationError}
   \    ${Element}  Get Webelement  ${Loc_RAPIDSSetupARPIPMatchTimeoutValidationError}
   \    Log  ${Element.text}  console=true
   \    DOMreadyByWaitTime  3
   \    Reload Page
   \        

Verify Wireless BSSID Correlation range With valid Value
   [Documentation]  Verify Wireless BSSID Correlation range With valid Value.
   ...    
   [Arguments]  ${validValueList}
   :FOR  ${validValue}  IN  @{validValueList}
   \    
   \    WaitForPageLoading
   \    Type  ${Loc_RAPIDSSetupWirelessBSSIDCorrelation}  ${validValue}
   \    Click  ${Loc_RAPIDSSetupApplyButton}
   \    AssertForElementPresent  ${Loc_RAPIDSSetupConfirmButton}
   \    DOMreadyByWaitTime  3
   \    Click  ${Loc_RAPIDSSetupConfirmButton}
   \    Verify Wireless BSSID Correlation range With Default Value  ${validValue}
   \    
   
Verify Delete Rogues not detected range With Default Value
   [Documentation]  Verify Delete Rogues not detected range With Default Value.
   ...    
   [Arguments]  ${defaultValue}
   WaitForPageLoading
   ${locator}  Catenate  SEPARATOR=  ${Loc_RAPIDSSetupDeleteRoguesRange}  [@value='${defaultValue}']
   AssertForElementPresent  ${locator}
   
Verify Delete Rogues not detected range With Invalid Value
   [Documentation]  Verify Wireless BSSID Correlation range With Invalid Value.
   ...    
   [Arguments]  ${invalidValueList}
   :FOR  ${invalidValue}  IN  @{invalidValueList}
   \    Log  Verify Wireless BSSID Correlation range with '${invalidValue}' value  console=true
   \    WaitForPageLoading
   \    Type  ${Loc_RAPIDSSetupDeleteRoguesRange}  ${invalidValue}
   \    Click  ${Loc_RAPIDSSetupApplyButton}
   \    AssertForElementPresent  ${Loc_RAPIDSSetupARPIPMatchTimeoutValidationError}
   \    ${Element}  Get Webelement  ${Loc_RAPIDSSetupARPIPMatchTimeoutValidationError}
   \    Log  ${Element.text}  console=true
   \    DOMreadyByWaitTime  3
   \    Reload Page
   \        

Verify Delete Rogues not detected range With valid Value
   [Documentation]  Verify Wireless BSSID Correlation range With valid Value.
   ...    
   [Arguments]  ${validValueList}
   :FOR  ${validValue}  IN  @{validValueList}
   \    
   \    WaitForPageLoading
   \    Type  ${Loc_RAPIDSSetupDeleteRoguesRange}  ${validValue}
   \    Click  ${Loc_RAPIDSSetupApplyButton}
   \    AssertForElementPresent  ${Loc_RAPIDSSetupConfirmButton}
   \    DOMreadyByWaitTime  3
   \    Click  ${Loc_RAPIDSSetupConfirmButton}
   \    Verify Delete Rogues not detected range With Default Value  ${validValue}
   \    
   



### Code by Keerthana ###
Check for Rogue data
    WaitForElementPresent  ${Loc_Rogue_piechart}
    ${count}  Get Elements Count  ${Loc_Rogue_piechart}
    Should be true  '${count}'!='0'
    Log  Rogue data verified!  console=True
    
Check for Rogue List
    AssertForElementPresent  ${Loc_roguelist_xpath}
    WaitForElementPresent  ${Loc_roguelist_xpath}
    ${text}  Get Element Text  ${Loc_roguelist_xpath}
    ${fst}  ${lst}  split string  ${text}  :
    ${count}  remove string  ${lst}  ]
    ${AMProgue_countBeforeUpgrade}  strip string  ${count}
    log  AMP rogue count: ${count}  console=True
    Set Global Variable  ${AMProgue_countBeforeUpgrade}
   # [return]  ${count}
    

    
Check configuration is retained
    [arguments]  ${ExportThresholdValue}
    Select Dropdown LabelValue  ${Loc_RapidsExportThreshold}  ${ExportThresholdValue}
    Click  ${Loc_savebutton}
    DOMreadyByWaitTime  5
    ${selected_label}  Get Selected List Label  ${Loc_RapidsExportThreshold}
    Log  ${selected_label}  console=True
    Should be true  '${selected_label}'=='${ExportThresholdValue}'
    
Check rogue rules are retained
    [arguments]  ${classification}
    Click  ${Loc_signalstrengthEditicon}
    DOMreadyByWaitTime  5
    Wait Until Element Is Not Visible  ${loader}  30s
    Select Dropdown LabelValue  ${Loc_classificationDropdown}  ${classification}
    Click  ${Loc_savebutton}
    DOMreadyByWaitTime  3
    ${Text_classification}  Get Element Text  ${Loc_ClassificationafterModify}
    Log  ${Text_classification}  console=True
    Should be true  '${classification}'=='${Text_classification}'
    
Modify rogue rules
    Click  ${Loc_signalstrengthEditicon}
    DOMreadyByWaitTime  5
    Wait Until Element Is Not Visible  ${loader}  30s
    Click  ${Loc_disablebutton} 
    Click  ${Loc_savebutton}
    DOMreadyByWaitTime  3
    
Create new rule and verify
    [arguments]  ${Rulename}  ${threat}  ${Signalmin}  ${classification}
    Click  ${Loc_addRule}
    DOMreadyByWaitTime  3
    Type  ${Loc_RuleNameTextbox}  ${Rulename}
    Select Dropdown LabelValue  ${Loc_classificationDropdown}  ${classification}
    Select Dropdown LabelValue  ${Loc_threatDropdown}  ${threat}
    CLick  ${Loc_enablebutton}
    Click  ${Loc_classruledropdown}  
    Click  ${Loc_signalstrengthvalue}
    DOMreadyByWaitTime  3
    Click  ${Loc_classADD}
    DOMreadyByWaitTime  3
    Type  ${Loc_strengthText}  ${Signalmin}
    Click  ${Loc_ADDbutton}
    DOMreadyByWaitTime  3
    Log  New rule: ${Rulename} added!  console=True
    ${Drag}  get element count  ${Loc_dropRule}
    Drag and Drop  ${Loc_signalDrag}  (${Loc_dropRule})[${Drag}]
    sleep  3s
    Drag and Drop  //*[text()='${Rulename}']/${Loc_dragRule}  (${Loc_dropRule})[1]
    DOMreadyByWaitTime  5
    Click  ${Loc_savandApply}
    DOMreadyByWaitTime  3
    Click  ${Loc_applychanges}
    DOMreadyByWaitTime  20
    Navigate To RAPIDS List Page
    DOMreadyByWaitTime  10
    AssertForElementPresent  //*[@title="${Rulename}"]
    
Check ARP IP Match Timeout
    ${value}  Get Value  ${Loc_ARPIPMatch}
    ${value}  convert to integer  ${value}
    Log  ${value}  console=True
    Should be true  ${value} > 0 and ${value} <= 168
  

Change ARP IP Match Timeout
    [Arguments]  ${value}
    Type  ${Loc_ARPIPMatch}  ${value}
    Click  ${Loc_Save}
    DOMreadyByWaitTime  3
 

Check Negative Value Change
    [Arguments]  ${value}
    Type  ${Loc_ARPIPMatch}  ${value}
    Click  ${Loc_Save}
    WaitForElementPresent  ${Loc_ARP_Error}
    
    
    
    
    
    
    
    
    
    
    
    
    
    