*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Suite Setup       RAPIDS Suite Setup
Suite Teardown    Close Browser
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Locators/DeviceSetupPages.robot
Resource          ../../Keywords/Device/DeviceFeature.robot
Resource          ../../Keywords/RAPIDS/RAPIDSPage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Keywords/APMonitoringPage/APMonitoringPage.robot
Resource          ../../Keywords/AMPSetup/AMPSetupFeature.robot
Resource          ../../Utilities/Data_Provider.robot


*** Test Cases ***
Verify ARP IP Match Timeout range Field in AMP Setup Page
    [Documentation]  Verify ARP IP Match Timeout must range between 1- 168. 
    ...    Here Getting the test data from 'RAPIDS-Setup' sheet - "Verify ARP IP Match Timeout range Field in AMP Setup Page" Test case column name. 
    [Tags]  smokeTest
    RAPIDS Data Setup  Verify ARP IP Match Timeout range Field in AMP Setup Page
    Verify ARP IP Match Timeout range with Default Value  ${DefaultValue}
    Verify ARP IP Match Timeout range With Invalid Value  ${InvalidValues}
    Verify ARP IP Match Timeout range With valid Value  ${ValidValues}
    
Verify Wired-to-Wireless MAC Address Correlation Field in AMP Setup Page
    [Documentation]  Verify Wired-to-Wireless MAC Address Correlation must range between 0-8.
    ...    Here Getting the test data from 'RAPIDS-Setup' sheet - "Verify Wired-to-Wireless MAC Address Correlation Field in AMP Setup Page" Test case column name. 
    [Tags]  smokeTest
    RAPIDS Data Setup  Verify Wired-to-Wireless MAC Address Correlation Field in AMP Setup Page
    Verify Wired-to-Wireless MAC Address Correlation range With Default Value  ${DefaultValue}
    Verify Wired-to-Wireless MAC Address Correlation range With Invalid Value  ${InvalidValues}
    Verify Wired-to-Wireless MAC Address Correlation range With valid Value  ${ValidValues}
    
Verify Wireless BSSID Correlation Field in AMP Setup Page
    [Documentation]  Verify Wireless BSSID Correlation must range between 0-8. 
    ...    Here Getting the test data from 'RAPIDS-Setup' sheet - "Verify Wireless BSSID Correlation Field in AMP Setup Page" Test case column name. 
    [Tags]  smokeTest
    RAPIDS Data Setup  Verify Wireless BSSID Correlation Field in AMP Setup Page
    Verify Wireless BSSID Correlation range With Default Value  ${DefaultValue}
    Verify Wireless BSSID Correlation range With Invalid Value  ${InvalidValues}
    Verify Wireless BSSID Correlation range With valid Value  ${ValidValues}
    
Verify Delete Rogues not detected range Field in AMP Setup Page
    [Documentation]  Verify Delete Rogues not detected must range between 1-14 (Days). 
    ...    Here Getting the test data from 'RAPIDS-Setup' sheet - "Verify Wireless BSSID Correlation Field in AMP Setup Page" Test case column name. 
    [Tags]  smokeTest
    RAPIDS Data Setup  Verify Delete Rogues not detected range Field in AMP Setup Page
    Verify Delete Rogues not detected range With Default Value  ${DefaultValue}
    Verify Delete Rogues not detected range With Invalid Value  ${InvalidValues}
    Verify Delete Rogues not detected range With valid Value  ${ValidValues}    

*** Keywords ***
RAPIDS Data Setup
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${DefaultValueList} =  Data_Provider.GetDataProviderColumnValue  Data_DefaultValue
  ${DefaultValue} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DefaultValueList}  1
  Set Suite Variable  ${DefaultValue}
  ${InvalidValuesList} =  Data_Provider.GetDataProviderColumnValue  Data_InvalidValues
  ${InvalidValues} =  Data_Provider.DataProviderSplitterValuesInDataList  ${InvalidValuesList}
  Set Suite Variable  ${InvalidValues}
  ${ValidValuesList} =  Data_Provider.GetDataProviderColumnValue  Data_ValidValues
  ${ValidValues} =  Data_Provider.DataProviderSplitterValuesInDataList  ${ValidValuesList}
  Set Suite Variable  ${ValidValues}

RAPIDS Suite Setup
    [Documentation]  Suite setup for RAPIDS Setup Test cases
    Login And Verify
    Navigate To RAPIDS Page
    Navigate To RAPIDS Setup Page    
    
*** Variables ***
${SheetName}  RAPIDS_SetupTC
${DefaultValue}
${InvalidValues}
${ValidValues}    
    
    