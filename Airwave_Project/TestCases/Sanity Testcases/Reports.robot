*** Settings ***
Documentation     Page/feature library for Login
...    
#Suite Setup       Login And Verify
#Suite Teardown    LogoutAW
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Locators/DeviceSetupPages.robot
Resource          ../../Keywords/Device/DeviceFeature.robot
Resource          ../../Keywords/Device/DeviceSetup_keywords.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Keywords/Reports/ReportsPage.robot


*** Test Cases ***
 


Create Report
    [Documentation]   prerequisite Add license in the Home license page given
    [Tags]  case19
    Navigate To Reports Page
    Navigate To Reports Definitions Page
    Get report details  Create Report
    Create New Report  ${Title}  ${Type}  ${ReportStart}  ${ReportStop}   

Generated Report
    [Documentation]   Find created report in the generat tab
    [Tags]  case20
    Navigate To Reports Page
    Navigate To Reports Generated Page
    Get Generated report details  Create Report
    Verify Generated Report  ${Reporttitle}


Export Reports to pdf, csv data
    [Documentation]   Make sure that reports are exported to csv and pdf after upgrade
    ...    
    [Tags]  Case21
    Navigate To Reports Page
    Navigate To Reports Generated Page
    Set focus to element  ${ExportToCSV}
    Click  ${ExportToCSV}

*** Keywords ***
    
Get report details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${TitleList} =  Data_Provider.GetDataProviderColumnValue  Data_Title
    ${Title} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TitleList}  1
    Set Suite Variable  ${Title}
    ${TypeList} =  Data_Provider.GetDataProviderColumnValue  Data_Type
    ${Type} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TypeList}  1
    Set Suite Variable  ${Type}
    ${ReportStartList} =  Data_Provider.GetDataProviderColumnValue  Data_Report Start
    ${ReportStart} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReportStartList}  1
    Set Suite Variable  ${ReportStart}
    ${ReportStopList} =  Data_Provider.GetDataProviderColumnValue  Data_Report Stop
    ${ReportStop} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReportStopList}  1
    Set Suite Variable  ${ReportStop}

Get Generated report details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${ReporttitleList} =  Data_Provider.GetDataProviderColumnValue  Data_Title
    ${Reporttitle} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReporttitleList}  1
    Set Suite Variable  ${Reporttitle}
    

   
*** Variables ***
${SheetName}  Reports
${Networkname}
${IP}
${Mask}
${Type}
${Communitystring}
${Title}
${ReportStart}
${ReportStop}
${Reporttitle}
${ExportToCSV}  //*[contains(text(),'Export CSV')]