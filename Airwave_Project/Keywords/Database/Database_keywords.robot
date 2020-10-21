*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../../Locators/database.robot
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Locators/RAPIDSPage.robot
Resource          ../../Locators/APMonitoringPage.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Keywords/AMPSetup/AMPSetupFeature.robot
Resource          ../../Utilities/Data_Provider.robot
Library           ../../Utilities/Common/WebdriverHelper.py

*** Keywords ***
Rogue count in DB
    [Arguments]  ${cli_roguecount}
    Set Global Variable  ${cli_roguecount}
    log  CLI rogue count: ${cli_roguecount}  console=True
 
Aggregate session count in DB
    [Arguments]  ${cli_sessioncount}
    Set Global Variable  ${cli_sessioncount}
    log  CLI session count: ${cli_sessioncount}  console=True
    
User count in DB
    [Arguments]  ${cli_usercount}
    Set Global Variable  ${cli_usercount}
    log  CLI User count: ${cli_usercount}  console=True
    
AP count in DB
    [Arguments]  ${cli_APcount}
    Set Global Variable  ${cli_APcount}
    log  CLI AP count: ${cli_APcount}  console=True
    

Rogue data in AMP
    Login And Verify
    click  ${header_rogue_xpath}
    DOMreadyByWaitTime  10
    WaitForElementPresent  ${roguecount_xpath}
    ${text}  Get Element Text  ${roguecount_xpath}
    ${fst}  ${lst}  split string  ${text}  :
    ${count}  remove string  ${lst}  ]
    ${count}  strip string  ${count}
    LogoutAW
    log  AMP rogue count: ${count}  console=True
    [return]  ${count}
  
AP data in AMP  
    Login And Verify
    WaitForElementPresent  ${AP_upcount_xpath}
    ${up_count}  get element text  ${AP_upcount_xpath}
    ${up_count}  convert to integer  ${up_count}
    ${down_count}  get element text  ${AP_downcount_xpath}
    ${down_count}  convert to integer  ${down_count}
    ${AP_count}  evaluate  ${up_count}+${down_count}
    LogoutAW
    log  AMP AP count: ${AP_count}  console=True
    [return]  ${AP_count}
    
Check on events log
    AssertForElementPresent  ${Loc_SystemEventLog}
    Log  EventsLog verified!  console=True


    
Check last event in CLI and AMP
    [Arguments]  ${host}  ${user}  ${pwd}
    @{loginInfo}  Get Current Login Info  ${host}  ${user}  ${pwd}
    ${CLImonth}  Set variable  @{loginInfo}[0]
    ${CLIday}  Set variable  @{loginInfo}[1]
    ${CLItime}  Set variable  @{loginInfo}[2]
    ${CLIlogin}  Catenate  ${CLImonth}  ${CLIday}
   # Log  CLI Login: ${CLIlogin}  console=True
    ${AMPlogin}  Catenate  SEPARATOR=  //td[contains(text(),'${CLItime}')]  ${Loc_Eventlogin}  [contains(normalize-space(.),'${CLIlogin}')]
    Navigate To Systems Page
    Navigate To Systems Event Log Page
    AssertForElementPresent  ${AMPlogin}
    Set Global Variable  ${AMPlogin}
    ${AMP}  get element text  ${AMPlogin}
    Set Global variable  ${AMP}
    Log  AMP Login: ${AMP}  console=True
    Log  Last event login info verified  console=True
    
*** Variables ***
${AMP}
${AMPlogin}
#${cli_roguecount}
#${cli_sessioncount}
#${cli_usercount}
#${cli_APcount}


