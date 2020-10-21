*** Settings ***
Documentation     Page/feature library for Login
...    
Suite Setup       Login And Verify
Suite Teardown    LogoutAW
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Locators/DeviceSetupPages.robot
Resource          ../../Keywords/Device/DeviceFeature.robot
Resource          ../../Keywords/Device/DeviceSetup_keywords.robot
Resource          ../../Keywords/Login/LoginFeature.robot


*** Test Cases ***

Discover devices with eval license
    [Documentation]   prerequisite Add license in the Home license page given
    [Tags]  case2
    Navigate To Device Setup Page
    Get network details  Check Network Scan
    Add New Scan Network  ${Networkname}  ${IP}  ${Mask}
    Add New Scan Credential  ${Networkname}  ${Type}  ${Communitystring}
    Add New Scan Set  ${Networkname}
    
Discover devices with permanent license
    [Documentation]   prerequisite Add license in the Home license page given
    [Tags]  case3
    Navigate To Device Setup Page
    Get network details  Check Network Scan
    Add New Scan Network  ${Networkname}  ${IP}  ${Mask}
    Add New Scan Credential  ${Networkname}  ${Type}  ${Communitystring}
    Add New Scan Set  ${Networkname}

Add Certificates
    [Tags]  case23
    Navigate To Device Setup Page
    Navigate To Device Setup Certificates Page
    ### Trusted CA Certificate
    Add Certificate  root  ${TrustedCert_location}  CER  Trusted CA  
    ### Intermediate Certificate
    Add Certificate  root  ${IntermediateCert_location}  CER  Intermediate CA
    ### Multi Intermediate Certificate
    Add Certificate  root  ${MultiIntermediateCert_location}  CER  Intermediate CA


Check Network Scan
    [Tags]  case10     
    Navigate To Device Setup Page
    Get network details  Check Network Scan
    Add New Scan Network  ${Networkname}  ${IP}  ${Mask}
    Add New Scan Credential  ${Networkname}  ${Type}  ${Communitystring}
    Add New Scan Set  ${Networkname}
  

*** Keywords ***
Get network details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${NetworknameList} =  Data_Provider.GetDataProviderColumnValue  Data_Networkname
    ${Networkname} =  Data_Provider.DataProviderSplitterForMultipleValues  ${NetworknameList}  1
    Set Suite Variable  ${Networkname}
    ${IPList} =  Data_Provider.GetDataProviderColumnValue  Data_IP
    ${IP} =  Data_Provider.DataProviderSplitterForMultipleValues  ${IPList}  1
    Set Suite Variable  ${IP}
    ${MaskList} =  Data_Provider.GetDataProviderColumnValue  Data_Mask
    ${Mask} =  Data_Provider.DataProviderSplitterForMultipleValues  ${MaskList}  1
    Set Suite Variable  ${Mask}
    ${TypeList} =  Data_Provider.GetDataProviderColumnValue  Data_Type
    ${Type} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TypeList}  1
    Set Suite Variable  ${Type}
    ${CommunitystringList} =  Data_Provider.GetDataProviderColumnValue  Data_Communitystring
    ${Communitystring} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CommunitystringList}  1
    Set Suite Variable  ${Communitystring}
    
*** Variables ***
${SheetName}  Devices
${Networkname}
${IP}
${Mask}
${Type}
${Communitystring}
    