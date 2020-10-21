*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Keywords/Database/Database_keywords.robot
Resource          ../../Keywords/AMPSetup/AMPSetupFeature.robot
Resource          ../../Utilities/Data_Provider.robot
Library           ../../Utilities/Common/WebdriverHelper.py

*** Test Cases ***

Check the Events Log page
    [Documentation]   Make sure that all the Events are available in system page
    ...    
    [Tags]  Test
   # Login And Verify
    Navigate To Systems Page
    Navigate To Systems Event Log Page
    Check on events log
    Get CLI data for event  Check the Events Log page
    Check last event in CLI and AMP  ${Hostname}  ${Username}  ${Password}

Verify Login to AMP DB
    [tags]  case39
    Get CLI data  Verify Rogue count in DB
    ${cli_roguecount}  getcountfromCLI  ${Hostname}  ${Username}  ${Password}  ${DBcmd}  ${cmd}
    log  Login to AMP DB: Sucess  console=True

Verify Rogue count in DB
    [tags]  case42
    Get CLI data  Verify Rogue count in DB
    ${cli_roguecount}  getcountfromCLI  ${Hostname}  ${Username}  ${Password}  ${DBcmd}  ${cmd}
    Rogue count in DB  ${cli_roguecount}

Verify Aggregate session count in DB
    [tags]  case41
    Get CLI data  Verify Aggregate session count in DB
    ${cli_sessioncount}  getcountfromCLI  ${Hostname}  ${Username}  ${Password}  ${DBcmd}  ${cmd}
    Aggregate session count in DB  ${cli_sessioncount}
    
    
Verify User and AP count in DB
    [tags]  case40
    Get CLI data for user and AP  Verify User and AP count in DB
    ${cli_usercount}  getcountfromCLI  ${Hostname}  ${Username}  ${Password}  ${DBcmd}  ${cmd1}
    User count in DB  ${cli_usercount}
    
    ${cli_APcount}  getcountfromCLI  ${Hostname}  ${Username}  ${Password}  ${DBcmd}  ${cmd2}
    AP count in DB  ${cli_APcount}
  
    

    


*** Keywords ***
Get CLI data
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${HostnameList} =  Data_Provider.GetDataProviderColumnValue  Data_Hostname
  ${Hostname} =  Data_Provider.DataProviderSplitterForMultipleValues  ${HostnameList}  1
  Set Suite Variable  ${Hostname}
  ${UsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_Username
  ${Username} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UsernameList}  1
  Set Suite Variable  ${Username}
  ${PasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_Password
  ${Password} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  1
  Set Suite Variable  ${Password}
  #${Option1List} =  Data_Provider.GetDataProviderColumnValue  Data_Option1
  #${Option1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${Option1List}  1
  # Set Suite Variable  ${Option1}
  # ${Option2List} =  Data_Provider.GetDataProviderColumnValue  Data_Option2
  # ${Option2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${Option2List}  1
  # Set Suite Variable  ${Option2}
  # ${Option3List} =  Data_Provider.GetDataProviderColumnValue  Data_Option3
  # ${Option3} =  Data_Provider.DataProviderSplitterForMultipleValues  ${Option3List}  1
  # Set Suite Variable  ${Option3}
  ${DBcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_DBcmd
  ${DBcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DBcmdList}  1
  Set Suite Variable  ${DBcmd}
  ${cmdList} =  Data_Provider.GetDataProviderColumnValue  Data_cmd
  ${cmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${cmdList}  1
  Set Suite Variable  ${cmd}
  
Get CLI data for user and AP
   [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${cmd1List} =  Data_Provider.GetDataProviderColumnValue  Data_cmd
  ${cmd1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${cmd1List}  1
  Set Suite Variable  ${cmd1}
  ${cmd2List} =  Data_Provider.GetDataProviderColumnValue  Data_cmd
  ${cmd2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${cmd2List}  2
  

  Set Suite Variable  ${cmd2}
  

Get CLI data for event 
    [Arguments]    ${TestcaseName}
  ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
  Set Suite Variable  ${This_DataProvider}
  Set Suite Variable  ${SheetName}
  Log  ${This_DataProvider}
  ${HostnameList} =  Data_Provider.GetDataProviderColumnValue  Data_Hostname
  ${Hostname} =  Data_Provider.DataProviderSplitterForMultipleValues  ${HostnameList}  1
  Set Suite Variable  ${Hostname}
  ${UsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_Username
  ${Username} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UsernameList}  1
  Set Suite Variable  ${Username}
  ${PasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_Password
  ${Password} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  1
  Set Suite Variable  ${Password}


*** Variables ***
${SheetName}  Database
${Hostname}
${Username}
${Password}
#${Option1}
#${Option2}
#${Option3}
${DBcmd}
${cmd}
${cmd1}
${cmd2}


  