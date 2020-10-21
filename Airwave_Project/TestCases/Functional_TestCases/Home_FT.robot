*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/FunctionalTC_keywords/HomeFT_keywords.robot
Resource          ../../Locators/HomeFT.robot

*** Test Cases ***
Verify Summary Pie chart in RF Performance Page
    [Documentation]  Read the data from Summary Pie chart and Database and compare
    ...    
    [Tags]  Case 82
    sleep  10s
    Navigate To Home Page
    Navigate To Home RF Performance Page
    Get Summary Pie Chart data
    
Verify Health chart in RF Performance Page
    [Documentation]  Read the data from Health Bar chart and Database and compare
    ...    
    [Tags]  Case 83
    Navigate To Home Page
    Navigate To Home RF Performance Page
    Get Health Chart data

Verify SNR chart in RF Performance Page
    [Documentation]  Read the data from SNR Bar chart and Database and compare
    ...    
    [Tags]  Case 84
    Navigate To Home Page
    Navigate To Home RF Performance Page
    Get SNR Chart data
    
Verify Speed chart in RF Performance Page
    [Documentation]  Read the data from Speed Bar chart and Database and compare
    ...    
    [Tags]  Case 85
    Navigate To Home Page
    Navigate To Home RF Performance Page
    Get Speed Chart data
    
Verify Least Health Clients data
    [Documentation]  Read the data from Least Health Clients chart and Database and compare
    ...    
    [Tags]  Case 86
    Navigate To Home Page
    Navigate To Home RF Performance Page
    Get Least Healthy Client data
    
Verify Lowest SNR Clients data
    [Documentation]  Read the data from Lowest SNR Clients chart and Database and compare
    ...    
    [Tags]  Case 87
    Navigate To Home Page
    Navigate To Home RF Performance Page
    Get Lowest SNR Client data
    
Verify Lowest Speed Clients data
    [Documentation]  Read the data from Lowest Speed Clients chart and Database and compare
    ...    
    [Tags]  Case 88
    Navigate To Home Page
    Navigate To Home RF Performance Page
    Get Lowest Speed Client data
    
Verify Client navigation to Diagnostics from RF Performance
    [Documentation]  Check if client navigates to diagnostice page from RF page -> Home
    ...    
    [Tags]  Case 89
    Navigate To Home Page
    Navigate To Home RF Performance Page
    Client navigation to Diagnostics Page
    
    
    
    
