*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
#Suite Setup       Login And Verify
#Suite Teardown    LogoutAW
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Keywords/System/system_keywords.robot
Resource          ../../Locators/system.robot
Resource          ../../Utilities/Data_Provider.robot

*** Test Cases ***
Check the System Performance page
    [Documentation]  Check System Performance page for CPU, Memory, Disk, I/O Usage, etc
    [tags]  case37
    Navigate To Systems Page
    Navigate To Systems Performance Page
    Check for CPU data 
    Check for Memory
    Check for Disk
    Check for I/O Usage
    
Check the System Statistics graph
    [Documentation]  Check the AMON, RabbitMQ, Redis, DataBase statistics   
    [tags]  case38
    Navigate To Systems Page
    Navigate To Systems Performance Page
    Check AMON RabbitMq and Redis Statistics
    Check Database Statistics

