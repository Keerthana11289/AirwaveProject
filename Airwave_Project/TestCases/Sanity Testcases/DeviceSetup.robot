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


*** Test Cases ***

Discover devices with eval license
    [Documentation]   prerequisite Add license in the Home license page given
    [Tags]  case2
    DOMreadyByWaitTime  10
    ${count}  Get device count
    Run keyword if  ${count}!=0  Delete existing Devices
    Run keyword if  ${count}!=0  Reload page
    Run keyword if  ${count}!=0  DOMreadyByWaitTime  60
    Navigate To Device Setup Page
    Get network details  Discover devices with eval license
    
    Add New Scan Network  ${Networkname}  ${IP}  ${Mask}
    Add New Scan Credential  ${Networkname}  ${Type}  ${Communitystring}
    DOMreadyByWaitTime  10
    ${deviceCount_1}  Get device count
    log  ${deviceCount_1}  console=True
    Add New Scan Set  ${Networkname}
    Scan network  ${Networkname}
    Wait until keyword succeeds  12 min  2 min  Verify Scan Completion  ${Networkname}
    Click  ${Loc_Refreshbutton}
    DOMreadyByWaitTime  60
    Verify device count after scan   ${deviceCount_1}


    
Discover devices with permanent license
    [Documentation]   prerequisite Add license in the Home license page given
    [Tags]  case3
    Navigate To Device Setup Page
    Get network details  Discover devices with permanent license
  #  ${deviceCount_1}  Get device count
  #  log  ${deviceCount_1}  console=True
    Add New Scan Network  ${Networkname}  ${IP}  ${Mask}
    Add New Scan Credential  ${Networkname}  ${Type}  ${Communitystring}
    Add New Scan Set  ${Networkname}
    Scan network  ${Networkname}
    Wait until keyword succeeds  12 min  2 min  Verify Scan Completion  ${Networkname}
  #  Verify device count after scan   ${deviceCount_1}

    
Check Network Scan 
    [Documentation]  prerequisite Add license in the Home license page given    
    [Tags]  case10
    Navigate To Device Setup Page
    Get network details  Check Network Scan
  #  ${deviceCount_1}  Get device count
  #  log  ${deviceCount_1}  console=True
    Add New Scan Network  ${Networkname}  ${IP}  ${Mask}
    Add New Scan Credential  ${Networkname}  ${Type}  ${Communitystring}
    Add New Scan Set  ${Networkname}
    Scan network  ${Networkname}
    Wait until keyword succeeds  12 min  2 min  Verify Scan Completion  ${Networkname}
  #  Verify device count after scan   ${deviceCount_1}
    



Add Certificates
    Navigate To Device Setup Page
    Navigate To Device Setup Certificates Page
    Get Certificate details  Add Certificates
    ### Trusted CA Certificate
    Add Certificate  ${TrustedCertName}  ${TrustedCert_location}  ${CertFormat}  ${TrustedType}  
    ### Intermediate Certificate
    Add Certificate  ${IntermediateCertName}  ${IntermediateCert_location}  ${CertFormat}  ${IntermediateType}
    ### Multi Intermediate Certificate
    Add Certificate  ${MultiIntermediateCertName}  ${MultiIntermediateCert_location}  ${CertFormat}  ${MultiIntermediateType}





Check modifying the default device credentials in Communication page
    [Documentation]   Modifying the default device credentials in Communication page
    [Tags]  case22
    Navigate To Device Setup Page
    Navigate To Device Setup Communication Page
    ModifyTelnetAndSSHusername  ${Username}
    Navigate To Device Setup Page
    Navigate To Device Setup Add Page
    Verify Username  ${Username}  ${Dev_Type}
    
Check topology for device status and links
    [Documentation]   Make sure topology is showing correctly after upgrade, newly added devices should be showing in topology correctly
    ...    
    [Tags]  Case43
    Navigate To Home Page
    Navigate To Home Topology Page
    Check for topology
   # Check View and Filter options

    

  

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
    

Get IP for configuration status
     [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${GrpIpList} =  Data_Provider.GetDataProviderColumnValue  Data_GroupIP
    ${GrpIP} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GrpIpList}  1
    Set Suite Variable  ${GrpIP}
    
Get Certificate details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${TrustedCertNameList} =  Data_Provider.GetDataProviderColumnValue  Data_TrustedCertName
    ${TrustedCertName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TrustedCertNameList}  1
    Set Suite Variable  ${TrustedCertName}
    ${IntermediateCertNameList} =  Data_Provider.GetDataProviderColumnValue  Data_IntermediateCertName
    ${IntermediateCertName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${IntermediateCertNameList}  1
    Set Suite Variable  ${IntermediateCertName}
    ${MultiIntermediateCertNameList} =  Data_Provider.GetDataProviderColumnValue  Data_MultiIntermediateCertName
    ${MultiIntermediateCertName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${MultiIntermediateCertNameList}  1
    Set Suite Variable  ${MultiIntermediateCertName}
    ${CertFormatList} =  Data_Provider.GetDataProviderColumnValue  Data_CertFormat
    ${CertFormat} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CertFormatList}  1
    Set Suite Variable  ${CertFormat}
    ${TrustedTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_TrustedType
    ${TrustedType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TrustedTypeList}  1
    Set Suite Variable  ${TrustedType}
    ${IntermediateTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_IntermediateType
    ${IntermediateType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${IntermediateTypeList}  1
    Set Suite Variable  ${IntermediateType}
    ${MultiIntermediateTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_MultiIntermediateType
    ${MultiIntermediateType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${MultiIntermediateTypeList}  1
    Set Suite Variable  ${MultiIntermediateType}
    



    
*** Variables ***
${SheetName}  Devices
${Networkname}
${IP}
${Mask}
${Type}
${Communitystring}
${Username}  manager
${Dev_Type}  Aruba Device
${GrpIP}
${TrustedCertName}
${IntermediateCertName}
${MultiIntermediateCertName}
${CertFormat}
${TrustedType}
${IntermediateType}
${MultiIntermediateType}

 

*** comments ***
Discover devices with eval license
    [Documentation]   prerequisite Add license in the Home license page given
    [Tags]  case2
    Navigate To Device Setup Page
    Get network details  Discover devices with eval license
    ${deviceCount_1}  Get device count
    log  ${deviceCount_1}  console=True
    Add New Scan Network  ${Networkname}  ${IP}  ${Mask}
    Add New Scan Credential  ${Networkname}  ${Type}  ${Communitystring}
    Add New Scan Set  ${Networkname}
    Scan network  ${Networkname}
    Wait until keyword succeeds  12 min  3 min  Verify Scan Completion  ${Networkname}
    Verify device count after scan   ${deviceCount_1}
       