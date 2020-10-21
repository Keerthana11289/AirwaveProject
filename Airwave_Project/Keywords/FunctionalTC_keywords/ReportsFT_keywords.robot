*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../Locators/ReportsFT.robot
Resource          ../../Utilities/Data_Provider.robot

*** Keywords ***
Login To AMP page successful for FunctionalCases
    [Arguments]  ${UserName2}  ${Password2} 
    OpenBrowser
    Go To    ${host}
    Sleep  10s
  #  Wait Until Element Is Visible    ${Username}    20s
    Loginpage.Enter Username    ${UserName2}
    Loginpage.Enter Password    ${Password2} 
    Loginpage.Click Submit Button
    Loginpage.Verify Successful Login


Create report and get report details
    [Arguments]  ${testcase}
    Get new report details  ${testcase}
    Create a new report  ${Title}  ${Type}
    Get report Details from AMP  ${Title}
    
Create report with time and get report details
    [Arguments]  ${testcase}
    Get new report details  ${testcase}
    Create a new report with time  ${Title}  ${Type}  ${ReportStart}  ${ReportStop}
    Get report Details from AMP  ${Title}
    
Create a new report with time
    [Arguments]  ${title}  ${Type}  ${start}  ${stop}
    DOMreadyByWaitTime  5
    Click  ${Loc_Add_Report}
    DOMreadyByWaitTime  5
    WaitForElementPresent  ${Loc_reporttitle}
    Type  ${Loc_reporttitle}  ${title}
    Select Dropdown LabelValue  ${Loc_reportType}  ${Type}
    DOMreadyByWaitTime  3
    Type  ${Loc_ReportStarttime}  ${start}
    Type  ${Loc_ReportStoptime}  ${stop}
    DOMreadyByWaitTime  3
    Click  ${Loc_RunReport}
    DOMreadyByWaitTime  3
    Verify Created report  ${title}
    
    
Create a new report
    [Arguments]  ${title}  ${Type}
    DOMreadyByWaitTime  5
    Click  ${Loc_Add_Report}
    DOMreadyByWaitTime  5
    WaitForElementPresent  ${Loc_reporttitle}
    Type  ${Loc_reporttitle}  ${title}
    Select Dropdown LabelValue  ${Loc_reportType}  ${Type}
    DOMreadyByWaitTime  3
    Click  ${Loc_RunReport}
    DOMreadyByWaitTime  3
    Verify Created report  ${title}
    
Verify Created report
    [Arguments]  ${title}
    Navigate to Reports Generated Page
    DOMreadyByWaitTime  5
    Type  ${Loc_SearchGenReport}  ${title}
    Press Keys  None  RETURN
    DOMreadyByWaitTime  3
    AssertForElementPresent  //*[text()='${title}']
    Log  Report - ${title} created successfully!  console=True
    Wait until keyword succeeds  5 min  30 sec  Generated report  ${title}   
    
    
Get report Details from AMP
    [Arguments]  ${title}
    DOMreadyByWaitTime  3
    Click  //a[text()='${title}']
    DOMreadyByWaitTime  5


Generated report
    [Arguments]  ${title}
    Navigate to Reports Generated Page
    DOMreadyByWaitTime  5
    Type  ${Loc_SearchGenReport}  ${title}
    Press Keys  None  RETURN
    DOMreadyByWaitTime  3
    Element should be visible  //a[text()='${title}']   
    
Click Generated Report
    [Arguments]  ${title}
    DOMreadyByWaitTime  5
    Type  ${Loc_SearchGenReport}  ${Title}
    Press Keys  None  RETURN
    DOMreadyByWaitTime  3  
    Click  //a[text()='${title}']
    DOMreadyByWaitTime  5   

Export Report and verify
    [Arguments]  ${testcase}
    Get new report details  ${testcase}
    Click Generated Report  ${Title}
    DOMreadyByWaitTime  3
    ### Export To Xml
    Click  ${Loc_ExportToXML}
    DOMreadyByWaitTime  5
    Switch Window  locator=NEW
    DOMreadyByWaitTime  5
    AssertForElementPresent  //*[contains(text(),'${Title}')]
    DOMreadyByWaitTime  3
    Close Window
    DOMreadyByWaitTime  3
    Switch Window  MAIN
    DOMreadyByWaitTime  5
    Log  Report-${Title} Exported to XML successfully!  console=True
    
    ### Export to Csv
    Click  ${Loc_ExportToCSV}
    DOMreadyByWaitTime  5
    Log  Report-${Title} Exported to CSV successfully!  console=True
    ### Export To PDF
    Click  ${Loc_ExportToPDF}
    DOMreadyByWaitTime  5
    Log  Report-${Title} Exported to PDF successfully!  console=True
    
    
Print Report and verify
    [Arguments]  ${testcase}
    Get new report details  ${testcase}
    Click Generated Report  ${Title}
    DOMreadyByWaitTime  3
    Click  ${Loc_PrintReport}
    DOMreadyByWaitTime  10
    Switch Window  locator=NEW
    DOMreadyByWaitTime  5
    Close Window
    Log  Print Report - ${Title} Verified successfully!  console=True
    Switch Window  MAIN
    DOMreadyByWaitTime  10
    
Email Report and verify
    [Arguments]  ${testcase}
    Get Mail Details  ${testcase}
    Click Generated Report  ${Title}
    DOMreadyByWaitTime  3
    Click  ${Loc_EmailReport}
    DOMreadyByWaitTime  3
    Type  ${Loc_RecEmail}  ${RecipientMail}
    DOMreadyByWaitTime  3
    Type  ${Loc_SendEmail}  ${SenderMail}
    DOMreadyByWaitTime  3
    Select Dropdown LabelValue  ${Loc_EmailTypeDropdown}  ${MailFormat}
    DOMreadyByWaitTime  3
    Click  ${Loc_EmailButton}
    DOMreadyByWaitTime  3
    AssertForElementPresent  ${Loc_EmailSuccessful}
    Log  Report-${Title} emailed from ${SenderMail} to ${RecipientMail} successfully!  console=True

*** Keywords ***
Login Data Setup FunctionalCases
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${UserNameList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginUsername
  ${LoginUserName1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UserNameList}  1
  Set Suite Variable  ${LoginUserName1}
  ${PasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_LoginPassword
  ${LoginPassword1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  1
  Set Suite Variable  ${LoginPassword1}
  
Get new report details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${TitleList} =  Data_Provider.GetDataProviderColumnValue  Data_ReportTitle
    ${Title} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TitleList}  1
    Set Suite Variable  ${Title}
    ${TypeList} =  Data_Provider.GetDataProviderColumnValue  Data_ReportType
    ${Type} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TypeList}  1
    Set Suite Variable  ${Type}
    ${ReportStartList} =  Data_Provider.GetDataProviderColumnValue  Data_ReportStart
    ${ReportStart} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReportStartList}  1
    Set Suite Variable  ${ReportStart}
    ${ReportStopList} =  Data_Provider.GetDataProviderColumnValue  Data_ReportStop
    ${ReportStop} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ReportStopList}  1
    Set Suite Variable  ${ReportStop}
    
  
Get Mail Details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${TitleList} =  Data_Provider.GetDataProviderColumnValue  Data_ReportTitle
    ${Title} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TitleList}  1
    Set Suite Variable  ${Title}
    ${MailFormatList} =  Data_Provider.GetDataProviderColumnValue  Data_MailFormat
    ${MailFormat} =  Data_Provider.DataProviderSplitterForMultipleValues  ${MailFormatList}  1
    Set Suite Variable  ${MailFormat}
    ${RecipientMailList} =  Data_Provider.GetDataProviderColumnValue  Data_RecipientMail
    ${RecipientMail} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RecipientMailList}  1
    Set Suite Variable  ${RecipientMail}
    ${SenderMailList} =  Data_Provider.GetDataProviderColumnValue  Data_SenderMail
    ${SenderMail} =  Data_Provider.DataProviderSplitterForMultipleValues  ${SenderMailList}  1
    Set Suite Variable  ${SenderMail}
    
    
    


*** Variables ***
${LoginUserName1}
${LoginPassword1}
${Title}
${Type}
${ReportStart}
${ReportStop}
${MailFormat}
${RecipientMail}
${SenderMail}
