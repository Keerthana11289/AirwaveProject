*** Settings ***
Documentation     Page/feature library for Clients Monitoring
...    
Suite Setup       Login And Verify
Suite Teardown    LogoutAW
Library           SeleniumLibrary
Library           String

Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Utilities/Data_Provider.robot
Resource          ../../Utilities/REST_API_CALLS.robot
Resource          ../../Keywords/Device/DeviceFeature.robot
Resource          ../../Keywords/APMonitoringPage/APMonitoringPage.robot
#Resource          ../../Utilities/Common/WebdriverHelper.py

*** Variables ***
${SheetName}  ClientMonitoring
${GroupName}
${FolderName}
${RAPIDSExportThresholdType}
${aw10_cli_supportuser}  
${aw10_cli_supportpassword}

*** Test cases ***
Verify Client count on the Group Level
    [Documentation]  Verifying the Client counts on the Group Level.
    ...    Here Getting the test data from 'ClientMonitoring' sheet - "Verify Client count on the Group Level" Test case column name. 
    [Tags]  smokeTest3
    ClientMonitoring Data Setup  Verify Client count on the Group Level
    # ClientMonitoring Test Setup
    Navigate To Group Page
    Navigate To Group List Page
    ${clientCountFromGroupListPage}  Get Client Count From Group Table  ${GroupName}
    Navigate to Group Monitor Page  ${GroupName}
    ${clientCountFromMonitorPage}  Get Client Count From Group Monitor Table
    Should Be Equal As Strings  ${clientCountFromMonitorPage}  ${clientCountFromGroupListPage}

Client count and charts on the AP List Table
    [Documentation]  Verifying the Client count and charts on the AP List Table.
    ...    Here Getting the test data from 'ClientMonitoring' sheet - "Verify Client count on the Group Level" Test case column name. 
    [Tags]  smokeTest
    ClientMonitoring Data Setup  Verify Client count on the Group Level
    # ClientMonitoring Test Setup
    Navigate To Device Page
    Navigate To Device List Page
    ${clientCountFromDeviceListPage}  Get Client Count From Devices List Page
    ${clientCountFromDeviceChart}  Get Client Count From Devices List Page Graph Info
    Should Be Equal As Strings  ${clientCountFromDeviceListPage}  ${clientCountFromDeviceChart}
    
Usage data and charts on the AP List Table
    [Documentation]  Verifying the Client Usage data and charts on the AP List Table.
    ...    Here Getting the test data from 'ClientMonitoring' sheet - "Verify Client count on the Group Level" Test case column name. 
    [Tags]  smokeTest
    ClientMonitoring Data Setup  Verify Client count on the Group Level
    Navigate To Device Page
    Navigate To Device List Page
    ${clientUsageFromDeviceListPage}  Get Client Usage From Devices List Page
    ${clientUsageFromDeviceChart}  Get Client Usage From Devices List Page Graph Info
    ${status}  Verify the Client Usage Details  ${clientUsageFromDeviceListPage}  ${clientUsageFromDeviceChart}
    Should be True  ${status}

Client count and charts on the AP List Table filtered by folder
    [Documentation]  Verifying the Client count and charts on the AP List Table filtered by folder.
    ...    Here Getting the test data from 'ClientMonitoring' sheet - "Verify Client count on the Group Level" Test case column name. 
    [Tags]  smokeTest
    ClientMonitoring Data Setup  Verify Client count on the Group Level
    # ClientMonitoring Test Setup
    Navigate To Device Page
    Navigate To Device List Page
    ${clientCountFromDeviceListPage}  Get Client Count From Devices List Page  ${FolderName}
    ${clientCountFromDeviceChart}  Get Client Count From Devices List Page Graph Info
    Should Be Equal As Strings  ${clientCountFromDeviceListPage}  ${clientCountFromDeviceChart}
    
Usage data and charts on the AP List Table filtered by folder
    [Documentation]  Verifying the Client Usage data and charts on the AP List Table filtered by folder.
    ...    Here Getting the test data from 'ClientMonitoring' sheet - "Verify Client count on the Group Level" Test case column name. 
    [Tags]  smokeTest
    ClientMonitoring Data Setup  Verify Client count on the Group Level
    Navigate To Device Page
    Navigate To Device List Page
    ${clientUsageFromDeviceListPage}  Get Client Usage From Devices List Page  ${FolderName}
    ${clientUsageFromDeviceChart}  Get Client Usage From Devices List Page Graph Info
    ${status}  Verify the Client Usage Details  ${clientUsageFromDeviceListPage}  ${clientUsageFromDeviceChart}    
    Should be True  ${status}
    
Client count and charts on AP Monitoring Page
    [Documentation]  Verifying the Client count and charts on AP Monitoring Page.
    ...    Here Getting the test data from 'ClientMonitoring' sheet - "Verify Client count on the Group Level" Test case column name. 
    [Tags]  smokeTest
    ClientMonitoring Data Setup  Verify Client count on the Group Level
    Navigate To Device Page
    Navigate To Device List Page
    Navigate To Controller Moniter Page  ${DeviceName}
    ${clientCountStatus}  Verify Client Count In AP Monitor Page
    Should be True  ${clientCountStatus}

Usage data on AP Monitor Page
    [Documentation]  Verifying the Client Usage data on AP Monitor Page.
    ...    Here Getting the test data from 'ClientMonitoring' sheet - "Verify Client count on the Group Level" Test case column name. 
    [Tags]  smokeTest
    ClientMonitoring Data Setup  Verify Client count on the Group Level
    Navigate To Device Page
    Navigate To Device List Page
    Navigate To Controller Moniter Page  ${DeviceName}
    ${clientUsageStatus}  Verify Client Usage In AP Monitor Page
    Should be True  ${clientUsageStatus}
    
Client List data on AP Monitor page
    [Documentation]  Verifying the Client Usage data on AP Monitor Page.
    ...    Here Getting the test data from 'ClientMonitoring' sheet - "Verify Client count on the Group Level" Test case column name. 
    [Tags]  smokeTest
    #ClientMonitoring Data Setup  Verify Client count on the Group Level
    Navigate To Device Page
    Navigate To Device List Page
    Navigate To Controller Moniter Page  Aruba7240_43_100
    Navigate To Controller-AP Page
    @{client_DetailsFromAPPage}  Get Client Details From AP Page
    
Client count and charts on Controller Monitoring Page
    [Tags]  smokeTest
    Navigate To Device Page
    Navigate To Device List Page
    Navigate To TOP Folder page
    Navigate To Controller Moniter Page  Aruba7240_43_100
    ${clientFromControllerMoniterPage}  Get Client Details From Controller Monitor Page
    ${clientFromAPListPage}  Get Client Details From Controllers AP List
    Should Be Equal As Strings  ${clientFromControllerMoniterPage}  ${clientFromAPListPage}
    
Client Trend chart in Clients Overview
    [Tags]  smokeTest
    Navigate To Home Page
    Navigate To Home Overview Page
    ${clientCountStatus}  Verify Client Count on Home Overview Page
    Should be True  ${clientCountStatus}
    
Usage Trend chart in Clients Overview
    [Tags]  smokeTest
    Navigate To Home Page
    Navigate To Home Overview Page
    ${clientUsageStatus}  Verify Client Usage on Home Overview Page
    Should be True  ${clientUsageStatus}
    
Clients Overview Pie Chart - By Operating System
    [Tags]  smokeTest1
    Navigate To Home Page
    Navigate To Clients Page
    Navigate To Clients Overview Page
    ${clientCountStatus}  Verify Client counts on Clients Overview Page  By Operating System
    Should be True  ${clientCountStatus}
    
Clients Overview Pie Chart - By Device Type
    [Tags]  smokeTest1
    Navigate To Home Page
    Navigate To Clients Page
    Navigate To Clients Overview Page
    ${clientCountStatus}  Verify Client counts on Clients Overview Page  By Device Type
    Should be True  ${clientCountStatus}
    
Clients Overview Pie Chart - By SSID
    [Tags]  smokeTest1
    Navigate To Home Page
    Navigate To Clients Page
    Navigate To Clients Overview Page
    ${clientCountStatus}  Verify Client counts on Clients Overview Page  By SSID
    Should be True  ${clientCountStatus}
    
Clients Overview Pie Chart - By WLAN vendor
    [Tags]  smokeTest1
    Navigate To Home Page
    Navigate To Clients Page
    Navigate To Clients Overview Page
    ${clientCountStatus}  Verify Client counts on Clients Overview Page  By WLAN vendor
    Should be True  ${clientCountStatus}

Search for a client by Username
    [Tags]  smokeTest1
    Navigate To Home Page
    Navigate To Clients Page
    Navigate To Clients Connected Page
    Go To Folder  Top
    ${username}  Get First ROW Username
    ${searchStatus}  Verify the search value  ${username}
    Should be True  ${searchStatus}
    
Search for a client by MAC Address
    [Tags]  smokeTest1
    Navigate To Home Page
    Navigate To Clients Page
    Navigate To Clients Connected Page
    Go To Folder  Top
    ${MACAddress}  Get First ROW MAC Address
    ${searchStatus}  Verify the search value  ${MACAddress}
    Should be True  ${searchStatus}

Verify client count on Connected Clients page
   [Tags]  smokeTest1
   Navigate To Home Page    
   Navigate To Clients Page 
   Navigate To Clients Connected Page
   ${status}  Verify the client counts on client Connected page
   Should be True  ${status}    

Verify usage data on Connected Clients page
   [Tags]  smokeTest1
   Navigate To Home Page    
   Navigate To Clients Page 
   Navigate To Clients Connected Page
   ${status}  Verify the client usage on client Connected page
   Should be True  ${status}
   
Verify the Client table data on Connected Clients page
   [Tags]  smokeTest1
   Navigate To Home Page
   Navigate To Clients Page 
   Navigate To Clients Connected Page
   
    

# Test Call
    # [tags]  smokeTest1
    # @{host_IP}  Split String  ${host}  //
    # ${count}  Get Client Count  @{host_IP}[-1]  ${aw10_cli_supportuser}  ${aw10_cli_supportpassword}
    # Log  ${count}  console=true    



*** Keywords ***
ClientMonitoring Data Setup
  [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${GroupNameList} =  Data_Provider.GetDataProviderColumnValue  Data_GroupName
  ${GroupName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GroupNameList}  1
  Set Suite Variable  ${GroupName}
  ${FolderNameList} =  Data_Provider.GetDataProviderColumnValue  Data_FolderName
  ${FolderName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FolderNameList}  1
  Set Suite Variable  ${FolderName}
  ${ParentFolderNameList} =  Data_Provider.GetDataProviderColumnValue  Data_ParentFolderName
  ${ParentFolderName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ParentFolderNameList}  1
  Set Suite Variable  ${ParentFolderName}
  ${DeviceTypeList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceType
  ${DeviceType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceTypeList}  1
  Set Suite Variable  ${DeviceType}
  ${DeviceNameList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceName
  ${DeviceName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceNameList}  1
  Set Suite Variable  ${DeviceName}
  ${DeviceIPAddressList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceIPAddress
  ${DeviceIPAddress} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceIPAddressList}  1
  Set Suite Variable  ${DeviceIPAddress}
  ${DeviceCommunityStringList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceCommunityString
  ${DeviceCommunityString} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceCommunityStringList}  1
  Set Suite Variable  ${DeviceCommunityString}
  ${TelnetSSHUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_TelnetSSHUsername
  ${TelnetSSHUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TelnetSSHUsernameList}  1
  Set Suite Variable  ${TelnetSSHUsername}
  ${TelnetSSHPasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_TelnetSSHPassword
  ${TelnetSSHPassword} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TelnetSSHPasswordList}  1
  Set Suite Variable  ${TelnetSSHPassword}
  ${RoleNameList} =  Data_Provider.GetDataProviderColumnValue  Data_RoleName
  ${RoleName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RoleNameList}  1
  Set Suite Variable  ${RoleName}
  ${UsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_Username
  ${Username} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UsernameList}  1
  Set Suite Variable  ${Username}
  ${PasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_Password
  ${Password} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  1
  Set Suite Variable  ${Password}
  ${NameList} =  Data_Provider.GetDataProviderColumnValue  Data_Name
  ${Name} =  Data_Provider.DataProviderSplitterForMultipleValues  ${NameList}  1
  Set Suite Variable  ${Name}
  ${EmailList} =  Data_Provider.GetDataProviderColumnValue  Data_Email
  ${Email} =  Data_Provider.DataProviderSplitterForMultipleValues  ${EmailList}  1
  Set Suite Variable  ${Email}
  ${AccessLevelList} =  Data_Provider.GetDataProviderColumnValue  Data_AccessLevel
  ${AccessLevel} =  Data_Provider.DataProviderSplitterForMultipleValues  ${AccessLevelList}  1
  Set Suite Variable  ${AccessLevel}
  ${DeviceAccessLevelList} =  Data_Provider.GetDataProviderColumnValue  Data_DeviceAccessLevel
  ${DeviceAccessLevel} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeviceAccessLevelList}  1
  Set Suite Variable  ${DeviceAccessLevel}
  ${RAPIDLevelAccessList} =  Data_Provider.GetDataProviderColumnValue  Data_RAPIDLevelAccess
  ${RAPIDLevelAccess} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RAPIDLevelAccessList}  1
  Set Suite Variable  ${RAPIDLevelAccess}
  ${VRFLevelList} =  Data_Provider.GetDataProviderColumnValue  Data_VRFLevel
  ${VRFLevel} =  Data_Provider.DataProviderSplitterForMultipleValues  ${VRFLevelList}  1
  Set Suite Variable  ${VRFLevel}
  ${PhoneNoList} =  Data_Provider.GetDataProviderColumnValue  Data_PhoneNo
  ${PhoneNo} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PhoneNoList}  1
  Set Suite Variable  ${PhoneNo}
  ${NotesList} =  Data_Provider.GetDataProviderColumnValue  Data_Notes
  ${Notes} =  Data_Provider.DataProviderSplitterForMultipleValues  ${NotesList}  1
  Set Suite Variable  ${Notes}
  ${RAPIDSExportThresholdList} =  Data_Provider.GetDataProviderColumnValue  Data_RAPIDSExportThreshold
  ${RAPIDSExportThresholdType} =  Data_Provider.DataProviderSplitterForMultipleValues  ${RAPIDSExportThresholdList}  1
  Set Suite Variable  ${RAPIDSExportThresholdType}
  
ClientMonitoring Test Setup
    [Documentation]  Test setup for ClientMonitoring Setup Test cases
    Create a New Group  ${GroupName}
    Create a New Folder  ${FolderName}
    #Arguments  DeviceName, GroupName & FolderName
    Add a New Device  ${DeviceName}  ${GroupName}  ${FolderName}
    Navigate To Devices - Monitor Page
    #Polling the device
    Click Polling Button
    Wait for Polling
    Move the devices from new page to group and folder  ${DeviceName}  ${GroupName}  ${FolderName}
    
    
        