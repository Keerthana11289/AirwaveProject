*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Sanity Testcases/ValidateLoginKeywords.robot
Resource          ../../Locators/APdeviceFeature.robot
Library           ../../Utilities/Common/WebdriverHelper.py
#Resource          ../../Keywords/AOSmodule_keywords/APdeviceFeature2.0_keywords.robot
Resource          ../../Utilities/Data_Provider.robot


*** Keywords ***
Verify Controller cluster page
    Navigate To Device ControllerClusters Page
    DOMReadyByWaitTime  5
    Log  Controller Cluster page verified!  console=True
    