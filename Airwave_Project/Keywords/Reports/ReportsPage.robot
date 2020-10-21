*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Locators/DeviceSetupPages.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Utilities/Data_Provider.robot

*** Keywords ***
Create New Report
    [Arguments]  ${title}  ${Type}  ${start}  ${Stop}
    Click  ${Loc_New_Report}
    DOMreadyByWaitTime  5
    WaitForElementPresent  ${Loc_Report_Title}
    Type  ${Loc_Report_Title}  ${title}
    Select Dropdown LabelValue  ${Loc_Report_Type}  ${Type}
    Type  ${Loc_Report_Start}  ${start}
    Type  ${Loc_Report_Stop}  ${stop}
    Click  ${Loc_Report_AddandRun}

Verify Generated Report
    [Arguments]  ${Reporttitle}
    Type  ${Loc_ReportSearch}  ${Reporttitle}
    Press Keys  None  RETURN
    DOMreadyByWaitTime  3
    AssertForElementPresent  //*[contains(text(),'${Reporttitle}')]
   # WaitForElementPresent  ${Loc_Generated_Report}
   # WaitForElementPresent  xpath=//*[.='testreport']/parent::tr/*[8]
   # ${cnfrm}  Get Element Text  ${Loc_Generated_Report}
   # Log  ${cnfrm}  console=True
