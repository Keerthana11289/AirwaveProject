*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/AOSmodule_keywords/APdeviceFeature4.0_keywords.robot
#Resource          ../../Keywords/AOSmodule_keywords/APdeviceFeature2.0_keywords.robot
Resource          ../../Locators/APdeviceFeature.robot
#Resource          ../../Keywords/AOSmodule_keywords/APdeviceFeature3.0_keywords.robot


*** Test Cases ***

Verify New Cluster Dashboard tab under Overview
    [Documentation]  Verify Controller Clusters Page in AP Devices List
    ...    
    [Tags]  Case4_1
    Navigate To Device Page
    Verify Controller cluster page
    
*** Comments ***
Check column filtering on all the columns in Cluster Page
    [Documentation]  Check column filtering
    ...    
    [Tags]  Case4_12
    
    
    



*** Variables ***
${SheetName}  AOSCluster

    