*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/FunctionalTC_keywords/ReportsFT_keywords.robot
Resource          ../../Locators/ReportsFT.robot




*** Test Cases ***

Login To AMP
    [Documentation]  Here Getting the test data from 'ReportsFT' sheet - "Login Details" Test case column name. 
    [Tags]  Case1
    Login Data Setup FunctionalCases  Login Details  
    Login To AMP page successful for FunctionalCases  ${LoginUserName1}  ${LoginPassword1} 
    


Generate Reports - Client Inventory and compare data 
    [Documentation]  Create a report and get details and compare with DB 
    [Tags]  Case 43
    Navigate To Reports Page
    Navigate To Reports Definitions Page
    Create report and get report details  Client Inventory
    
    
Generate Reports - Client Session and compare data 
    [Documentation]  Create a report and get details and compare with DB 
    [Tags]  Case 44
    Navigate To Reports Page
    Navigate To Reports Definitions Page
    Create report with time and get report details  Client Session
    
Generate Reports - Device Summary and compare data 
    [Documentation]  Create a report and get details and compare with DB 
    [Tags]  Case 45
    Navigate To Reports Page
    Navigate To Reports Definitions Page
    Create report with time and get report details  Device Summary
    
Generate Reports - New Clients and compare data 
    [Documentation]  Create a report and get details and compare with DB 
    [Tags]  Case 46
    Navigate To Reports Page
    Navigate To Reports Definitions Page
    Create report with time and get report details  New Clients
    
Verify Export Client session Report to xml, csv, and pdf
    [Documentation]  Export a Client session report to xml, csv, and pdf format and verify
    [Tags]  Case 47
    Navigate To Reports Page
    Navigate to Reports Generated Page
    Export Report and verify  Client Session
    
Verify Print-Report 
    [Documentation]  Print a Client session report and verify
    [Tags]  Case 48
    Navigate To Reports Page
    Navigate to Reports Generated Page
    Print Report and verify  Client Session

Verify Email Client session report 
    [Documentation]  Print a Client session report and verify
    [Tags]  Case 49
    Navigate To Reports Page
    Navigate to Reports Generated Page
    Email Report and verify  Email Report




*** Variables ***
${SheetName}  Reports_FT