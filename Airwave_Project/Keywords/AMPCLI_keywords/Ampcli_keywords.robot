*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Library           ../../Utilities/Common/WebdriverHelper.py
Resource          ../../Utilities/Data_Provider.robot
Resource          ../../Locators/Ampcli.robot



*** Keywords ***
Verify Login menu
    @{Menu}  create List  ${loginmenu1}  ${loginmenu2}  ${loginmenu3}  ${loginmenu4}  ${loginmenu5}  ${loginmenu6}  ${loginmenu7}  ${loginmenu8}  ${loginmenu9} 
    Log Many  @{Menu}
    Get CLI login credential  CLIdetails
    @{options}  Get Login Options  ${CLIhost}  ${CLIUsername}  ${CLIpassword}
    Log Many  @{options}
    Lists should be equal  ${Menu}  ${options}
    Log  CLI options verified  console=True
    
    
Verify termination option
    Get CLI login credential  CLIdetails
    ${status1}  run keyword and return status  Quitoption  ${CLIhost}  ${CLIUsername}  ${CLIpassword}
    ${status2}  run keyword and return status  Controlquitoption  ${CLIhost}  ${CLIUsername}  ${CLIpassword}
    Should be true  "${status1}"=="False"
    Log  Session termination by quit option verified!  console=True
    Should be true  "${status2}"=="False"
    Log  Session termination by Cntrl+Z option verified!  console=True
    
Verify back - Navigation option
    Get CLI login credential  CLIdetails
    @{options}  Get Login Options  ${CLIhost}  ${CLIUsername}  ${CLIpassword}
    ${login_len}  get length  ${options}
    @{backmenu}  getselectedbackmenuoptions  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  b
    @{afterback}  get slice from list  ${backmenu}  -${login_len}
    Lists should be equal  ${options}  ${afterback}
    log  Back option verified  console=True
    

Verify the pre-populated file visibility
    Get CLI login credential  CLIdetails
    ${result1}  Check Prepopulated Files 1  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  2
    ${result2}  Check Prepopulated Files 2  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  2
    Run keyword if  "${result1}"!="0" and "${result2}"!="0"  Log  Pre-populated file visibility verified!  console=True
    ...  ELSE  Fail  Pre-populated file visibility not verified!

Verify Cancel - Navigation option
    Get CLI login credential  CLIdetails
    ${optioncount}  Get Canceloptions  ${CLIhost}  ${CLIUsername}  ${CLIpassword}
    Should be true  "${optioncount}"=="2"
    Log  Cancel option verified!  console=True

Verify 0 - Navigation option
    Get CLI login credential  CLIdetails
    ${optioncount}  Get 0 Canceloptions  ${CLIhost}  ${CLIUsername}  ${CLIpassword}
    Should be true  "${optioncount}"=="2"
    Log  0 Cancel option verified!  console=True

Verify succesful output and return code
    Get CLI login credential  CLIdetails
    @{code}  Get Success Code  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  4  6
    ${output}  Set Variable  @{code}[0]
    ${returncode}  Set Variable  @{code}[1]
    Log  Output: ${output} and Return code: ${returncode}  console=True
    Should be true  "${output}"=="0" and "${returncode}"=="Success!"
    
Verify error output and return code
    Get CLI login credential  CLIdetails
    @{code}  Get Error Code  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6  1
    ${output}  Set Variable  @{code}[0]
    ${returncode}  Set Variable  @{code}[1]
    Log  Output: ${output} and Return code: ${returncode}  console=True
    Should be true  "${output}"=="999" and "${returncode}"=="Error"
   
Verify Cntrl C navigation option
    Get CLI login credential  CLIdetails
    ${optioncount}  Get Cntrl Coptions  ${CLIhost}  ${CLIUsername}  ${CLIpassword}
    Should be true  "${optioncount}"=="2"
    Log  Cntrl C option navigation to main menu verified!  console=True
    
Verify Show module key
    Get CLI login credential  CLIdetails
    ${result}  Check Module Key  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  4  7  1
    Run keyword if  ${result}!=0  Log  Show Module Key verified!  console=True
    ...  ELSE  Fail  No module key!
    
Save module key from system
    Get CLI login credential  CLIdetails
    ${key}  Get Module Key  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  4  7  2 
    Run keyword if  "${key}"!="0"  Log  Module key: ${key}  console=True
    ...  ELSE  Fail  Module key not saved!
    [return]  ${key}
   
Check module key in downloads
    [Arguments]  ${key}
    Get CLI login credential  CLIdetails
    ${output}  Verify Saved Module Key  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  2  ${key}
    Run keyword if  ${output}!=0  Log  Module Key: ${key} verified in Downloads!  console=True
    ...  ELSE  Fail  Saved Module Key not found in Downloads!

Verify Reset UI admin Access
    Get CLI login credential  CLIdetails
    ${number}  get Admin  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  5  1  admin
    Log  Serial num: ${number}  console=True
    ${output}  Reset UI Access  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  5  1  ${number}  n
    Run keyword if  "${output}"!="0"  Log  New Password for admin(UI): ${output} if resetted!  console=True
    ...  ELSE  Fail  Unable to reset UI admin Access!
    Log  Reset UI admin access verified!  console=True
    
Verify Reset CLI ampadmin Access
    Get CLI login credential  CLIdetails
    ${number}  get Admin  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  5  2  ampadmin
    Log  Serial num: ${number}  console=True
    ${output}  Reset CLI Access  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  5  2  ${number}
    Run keyword if  "${output}"!="0"  Log  CLI Ampadmin Access can be resetted!  console=True
    ...  ELSE  Fail  Unable to reset CLI Ampadmin Access!
    Log  Reset CLI ampadmin access verified!  console=True
    
Verify restart amp option
    Get CLI login credential  CLIdetails
    ${output}  Restart AMP  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  4  3  n
    Run keyword if  "${output}"!="0"  Log  AMP can be restarted!  console=True
    ...  ELSE  Fail  Unable to restart AMP!
    Log  Restart amp option verified!  console=True
    
Verify reboot amp option
    Get CLI login credential  CLIdetails
    ${output}  Reboot AMP  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  4  4  n
    Run keyword if  "${output}"!="0"  Log  AMP can be rebooted!  console=True
    ...  ELSE  Fail  Unable to reboot AMP!
    Log  Reboot amp option verified!  console=True
    
Verify shutdown amp option
    Get CLI login credential  CLIdetails
    ${output}  Shutdown AMP  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  4  5  n
    Run keyword if  "${output}"!="0"  Log  AMP can be shutdowned!  console=True
    ...  ELSE  Fail  Unable to shutdown AMP!
    Log  Shutdown amp option verified!  console=True
    
Modify network settings and verify
    Get CLI login credential  CLIdetails
    @{networkoutput}  Modify Network  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  3  1  7  ${DNSserverTmp}
    ${result}  Set variable  @{networkoutput}[0]
    ${originalserver}  Set variable  @{networkoutput}[1]
    Log  Original DNS server: ${originalserver}  console=True
    Run keyword if  "${result}"!="0"  Log  DNS server modified from ${originalserver} to ${DNSserverTmp}!  console=True
    ...  ELSE  Fail  Network not modified successfully! 
    [return]  ${originalserver} 
    
Revert Back To Original settings
    [Arguments]  ${originalserver}
    Get CLI login credential  CLIdetails
    @{networkoutput}  Modify Network  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  3  1  7  ${originalserver}
    ${result}  Set variable  @{networkoutput}[0]
    ${dupserver}  Set variable  @{networkoutput}[1]
    Log  duplicate DNS server: ${dupserver}  console=True
    Run keyword if  "${result}"!="0"  Log  DNS server modified from ${dupserver} to ${originalserver}!  console=True
    ...  ELSE  Fail  Network setting changes not reverted successfully! 

Verify Internal network setting
    Get CLI login credential  CLIdetails
    ${output}  Internal Network  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  3
    Run keyword if  "${output}"!="0"  Log  Internal network setting verified!  console=True
    ...  ELSE  Fail  Internal network setting not verified!

Verify Custom network setting
    Get CLI login credential  CLIdetails
    ${output}  Custom Network  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  3  1
    Run keyword if  "${output}"!="0"  Log  Custom network setting verified!  console=True
    ...  ELSE  Fail  Custom network setting not verified!
        
Verify Time update option
    Get CLI login credential  CLIdetails
    ${output}  Update Time  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  3  3  5  14  1
    Run keyword if  "${output}"!="0"  Log  Time update setting verified!  console=True
    ...  ELSE  Fail  Time update setting not verified!

Verify Show tech support option
    Get CLI login credential  CLIdetails
    ${output}  Show Tech Support  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6  1  
    Run keyword if  "${output}"=="4"  Log  Show tech support verified!  console=True
    ...  ELSE  Fail  Show tech support not verified!
    
Create CLI Backup
    Get CLI login credential  CLIdetails
    ${Backup}  Create Backup  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  2  1  1  y
    Run keyword if  "${Backup}"!="0"  Log  Backup File: ${Backup} created!  console=True
    ...  ELSE  Fail  Backup not created!
    Set Global Variable  ${Backupfile}  ${Backup}
    [Return]  ${Backup}
    
Verify CLI Backup
    [Arguments]  ${Backup}
    Get CLI login credential  CLIdetails
    ${Backupoutput}  Verify Backup  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  2  ${Backup}
    Run keyword if  "${Backupoutput}"!="0"  Log  Backup File: ${Backup} verified!  console=True
    ...  ELSE  Fail  Backup not Found!
    
Verify Restore option
    [Arguments]  ${Backup}
    Get CLI login credential  CLIdetails
    ${Restoreoutput}  Verify Restore  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  2  2  1  ${Backup}
    Run keyword if  "${Restoreoutput}"!="0"  Log  Restore File: ${Backup} verified!  console=True
    ...  ELSE  Fail  Backup file not found in restore!
    
Delete the Backup created
    [Arguments]   ${Backupfile}
    Get CLI login credential  CLIdetails
    ${number}  Get Delete Backup  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  3  ${Backupfile}
    Log  Serial num: ${number}  console=True
    ${Doutput}  Delete Backup  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  3  ${number}  y
    ${Deleteoutput}  Verify Delete Backup  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  3  ${Backupfile}
    Run keyword if  "${Deleteoutput}"=="0"  Log  Backup File: ${Backupfile} deleted!  console=True
    ...  ELSE  Fail  Backup file not deleted!
    
Verify add SSL Certificate
    Get CLI login credential  CLIdetails
    Get Certificate Details  Certificate
    Upload certificate   ${UploadPath}   ${Password}  ${UploadFile}
    ${number}  Get Certificateno  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  3  4  1  ${UploadFile}
    Log  Serial num: ${number}  console=True
    ${Coutput}  Add SSL  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  3  4  1  ${number}  ${Passwordcert}  y
    Run keyword if  "${Coutput}"=="1"  Log  Certificate File: ${UploadFile} added!  console=True
    ...  ELSE  Fail  Certificate not added!
      

Verify unresolvable hostname
    Get CLI login credential  CLIdetails
    Get Hostname  Hostname
    ${result}  Change To Unresolvable Host  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  3  2  ${UnresolvableHost}  y
    Run keyword if  "${result}"=="1"  Log  Hostname changed to ${UnresolvableHost}!  console=True
    ...  ELSE  Fail  Hostname not changed!
    ${result1}  Change To Unresolvable Host  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  3  2  ${Hostname}  y
    Run keyword if  "${result}"=="1"  Log  Hostname reverted to ${Hostname}!  console=True
    ...  ELSE  Fail  Hostname not changed!


Set short Hostname
    [Arguments]   ${ShortName}    
    Get CLI login credential  CLIdetails
    Short Hostname  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  3  2  ${ShortName}
   
Set Invalid Hostname
    [Arguments]   ${BadInput}    
    Get CLI login credential  CLIdetails
    Invalid Hostname  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  3  2  ${BadInput}


Verify Attempt to escape CLI
    Get CLI login credential  CLIdetails
    Get Hostname  Hostname
    ${result}  Attempt To CLI  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  3  2  ${UnresolvableHost}  n
    Run keyword if  "${result}"=="2"  Log  Attempt to escape CLI verified!  console=True
    ...  ELSE  Fail  Attempt to escape CLI not verified!

Get recent date with nightly data for restore
    Get CLI login credential  CLIdetails
    Get Nightly Backup/Restore data  NightlyData
    ${Recentdate}  Nightlyrecentdate  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  2  2  1  ${FiletoBackup}   
    Run keyword if  "${Recentdate}"!="0"  Log  Nightly restore file dated ${Recentdate} found!  console=True
    ...  ELSE  Fail  No nightly file found for restoring!
    [return]  ${Recentdate}
    
   
Verify Nightly restore option
    [Arguments]  ${Recentdate}
    Get CLI login credential  CLIdetails
    Get Nightly Backup/Restore data  NightlyData
    ${Recentdate}  convert to string  ${Recentdate}
    ${Restoreoutput}  Verify Nightly Restore  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  2  2  1  ${FiletoBackup}  ${Recentdate}
    Run keyword if  "${Restoreoutput}"!="0"  Log  Restore File found with serial no: ${Restoreoutput}  console=True
    ...  ELSE  Fail  Backup file not found in restore!
    [Return]  ${Restoreoutput}
    
Restore Nightly data with recent date
    [Arguments]  ${Restoreoutput}
    Get CLI login credential  CLIdetails
    ${result}  Restore Nightlydata  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  2  2  1  ${Restoreoutput}  y
    
Get oldest date with nightly data for Backup delete
    Get CLI login credential  CLIdetails
    Get Nightly Backup/Restore data  NightlyData
    ${Oldestdate}  Nightlyoldestdate  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  3  ${FiletoBackup}
    Run keyword if  "${Oldestdate}"!="0"  Log  Nightly backup file dated ${Oldestdate} found!  console=True
    ...  ELSE  Fail  No nightly file found for deleting!
    [return]  ${Oldestdate}

Verify Nightly backup delete
    [Arguments]  ${Oldestdate}
    Get CLI login credential  CLIdetails
    Get Nightly Backup/Restore data  NightlyData
    ${Oldestdate}  convert to string  ${Oldestdate}
    ${number}  Verify Nightly Delete  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  3  ${FiletoBackup}  ${Oldestdate}
    Run keyword if  "${number}"!="0"  Log  Nightly backup File found with serial no: ${number}  console=True
    ...  ELSE  Fail  Backup file not found in delete!
    [return]  ${number}
    
Delete Nightly backup with old date
    [Arguments]  ${number}
    Get CLI login credential  CLIdetails
    ${Doutput}  Delete Backup  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  3  ${number}  y
    
Delete support user
    Get CLI login credential  CLIdetails
    ${userstatus}  Checkfor User  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6
    Run keyword if  "${userstatus}"=="1"  Add user and delete
    ...  ELSE  Delete User and verify
    
Add user and delete
    Get CLI login credential  CLIdetails
    ${addstatus}  Add User  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6  5
    Run keyword if  "${addstatus}"=="1"  Log  awsupport user added successfully!  console=True
    ...  ELSE  Fail  User not added and unable to delete!
    Delete User and verify    

Delete User and verify
    Get CLI login credential  CLIdetails
    ${deletestatus}  Delete User  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6  5  y
    Run keyword if  "${deletestatus}"=="1"  Log  awsupport user deleted successfully  console=True
    ...  ELSE  Fail  User not deleted!

Check show awsupport user after deletion
    Get CLI login credential  CLIdetails
    ${userstatus}  Showsupportafter Deletion  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6  6
    Run keyword if  "${userstatus}"=="1"  Log  Contents of awsupport user is blank after deletion and verified!  console=True
    ...  ELSE  Fail  Contents of awsupport user present!

Check start support connection without user
    Start support connection
    

Check start support connection with user
    Get CLI login credential  CLIdetails
    ${userstatus}  Checkfor User  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6
    Run keyword if  "${userstatus}"=="1"  Add user and Start connection
    ...  ELSE  Start support connection
        
        
Add user and Start connection
    Get CLI login credential  CLIdetails
    ${addstatus}  Add User  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6  5
    Run keyword if  "${addstatus}"=="1"  Log  awsupport user added successfully!  console=True
    ...  ELSE  Fail  User not added and unable to start connection!
    Start support connection
    

Start support connection
    Get CLI login credential  CLIdetails
    ${connectionstatus}  Startconnection  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6  4
    Run keyword if  "${connectionstatus}"=="1"  Log  awsupport connection verified successfully!  console=True
    ...  ELSE  Fail  awsupport connection not verified!


Check show content of awsupport user
    Get CLI login credential  CLIdetails
    ${userstatus}  Showsupportwith User  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6  6
    Run keyword if  "${userstatus}"=="1"  Log  Contents of awsupport user verified!  console=True
    ...  ELSE  Fail  Contents of awsupport user not present!

Verify Remove new menu option
    Get CLI login credential  CLIdetails
    ${userstatus}  Checkfor User  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6
    Run keyword if  "${userstatus}"=="1"  Add user and delete
    ...  ELSE  Delete User and verify
    ${userstatus1}  Checkfor User  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6
    Run keyword if  "${userstatus1}"=="1"  Log  Remove option verified!  console=True
    ...  ELSE  Fail  Remove option not verified!
    
Verify Add new menu option
    Get CLI login credential  CLIdetails
    ${userstatus}  Checkfor User  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6
    Run keyword if  "${userstatus}"=="1"  Add user and verify
    ...  ELSE  Delete user and add

Add user and verify
    Get CLI login credential  CLIdetails
    ${addstatus}  Add User  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6  5
    Run keyword if  "${addstatus}"=="1"  Log  awsupport user added successfully!  console=True
    ...  ELSE  Fail  User not added and unable to delete!
    ${userstatus}  Checkfor User  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6
    Run keyword if  "${userstatus}"!="1"  Log  Add menu option verified!  console=True
    ...  ELSE  Fail  Add menu option not verified!
    
Delete user and add
    Delete User and verify
    Add user and verify
    
Verify Use new menu option
    Get CLI login credential  CLIdetails
    ${userstatus}  Checkfor User  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  6
    Run keyword if  "${userstatus}"=="1"  Check show awsupport user after deletion
    ...  ELSE  Check show content of awsupport user
    Log  Use new menu option verified successfully!  console=True
    
Verify Upgrade AMP option
    Get CLI login credential  CLIdetails
    ${upgradeoutput}  Verify Upgrade  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  4  1
    Run keyword if  "${upgradeoutput}"=="1"  Log  Upgrade AMP option verified successfully!  console=True
    ...  ELSE  Fail  Upgrade AMP option not verified!

Verify Sanitize outputs
    Get AMP aliases commands  AMPaliases
    Get CLI login credential  CLIdetails
    ${upgradeoutput}  Verify Sanitize Output  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  1  2  ${versioncmd}
    Run keyword if  "${upgradeoutput}"=="1"  Log  Sanitize outputs verified successfully!  console=True
    ...  ELSE  Fail  Sanitize outputs not verified!

### AMPCLI cmnd menu ###

Verify Help context cmnd
    Get Help Commands  HelpCommands
    @{Commands}  create list  ${Quit}  ${Date}  ${Topcmd}  ${Exit}  ${Clear}  
    Sort List  ${Commands}      
    @{shrtcommands}  Create list  
    Log many  @{Commands}
    :FOR  ${val}  IN  @{Commands}
    \    ${fst}  ${lst}  split string  ${val}  -
    \    ${fst}  Strip string  ${fst}
    \    ${fst}  Catenate  ${fst}  -
    \    append to list  ${shrtcommands}  ${fst}
    Log many  @{shrtcommands}
    Get CLI login credential  CLIdetails
    @{HelpexecCommands}  Get Help Cmnds  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${Helpcmd}  ${shrtcommands}
    Sort List  ${HelpexecCommands}
    log many  @{HelpexecCommands}
    Lists Should be equal  ${Commands}  ${HelpexecCommands}
    Log  verified Help text commands in CLI  console=True
    
Check Base unix commands
    Get Base Unix commands  Unixframe
    @{Commands}  Create list  ${Date}  ${lscmd}  ${Topcmd}  ${dfcmd}  ${hostnamecmd}  ${iptablescmd}
    Log many  @{Commands}
    ${len}  Get length  ${Commands}
    Get CLI login credential  CLIdetails
    ${Commandoutput}  Verify Unixcommands  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${Commands}
    Should be true  "${len}"=="${Commandoutput}"
    Log  Verified Base unix commands!  console=True


Verify amp aliases commands
    Get AMP aliases commands  AMPaliases
    @{Commands}  Create list  ${Daemons}  ${wdcmd}  ${psgcmd}  ${psscmd}  ${techsupport}  ${dbsize}  ${crrcmd}  ${versioncmd}  ${gitdiffcmd}  ${visualrfcache}
    Log many  @{Commands}
    ${len}  Get length  ${Commands}
    Get CLI login credential  CLIdetails
    ${Commandoutput}  Verify Amp Aliascommands  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${Commands}
    Should be true  "${len}"=="${Commandoutput}"
    Log  Verified AMP alias commands!  console=True
    
Verify Backup command
    Get commands  Commands
    Get CLI login credential  CLIdetails
    ${backupoutput}  Verify Amp Backup Command  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${ampbackup}
    Run keyword if  "${backupoutput}"=="1"  Log  AMP backup command verified successfully!  console=True
    ...  ELSE  Fail  AMP backup command not verified!

Verify Enter commands flexiblity - History
    Get commands  Commands
    Get CLI login credential  CLIdetails
    ${cmdoutput}  flexiblitycmd  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${historycmd}
    Run keyword if  "${cmdoutput}"=="1"  Log  Enter command flexiblity verified successfully!  console=True
    ...  ELSE  Fail  Enter command flexiblity not verified!

Check network command
    Get commands  Commands
    Get CLI login credential  CLIdetails
    ${cmdoutput}  Networkcmd  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${networkcmd}
    Run keyword if  "${cmdoutput}"=="${CLIhost}"  Log  Network command verified -Network:${cmdoutput} successfully!  console=True
    ...  ELSE  Fail  Network command not verified!

Check escape into root shell -sudo
    Get commands  Commands
    Get CLI login credential  CLIdetails
    ${cmdoutput}  escape Torootcmd  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${sudocmd}
    Run keyword if  "${cmdoutput}"=="1"  Log  Escape into root shell command verified successfully!  console=True
    ...  ELSE  Fail  Escape into root shell command not verified!

Check Stig - disables enter cmnds
    Get CLI login credential  CLIdetails
    ${cmdoutput}  Stigcmd  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  7  1  
    Run keyword if  "${cmdoutput}"=="1"  Log  Stig - disables enter cmnds verified successfully!  console=True
    ...  ELSE  Fail  Stig - disables enter cmnds not verified!

Check ampcli shell timeout
    Get CLI login credential  CLIdetails
    ${status}  run keyword and return status  Shell Timeout  ${CLIhost}  ${CLIUsername}  ${CLIpassword}
    Should be true  "${status}"=="False"
    Log  Auto Session termination after 10 mins verified!  console=True
    
Check Cntrl c and cntrl Z in commands
    Get CLI login credential  CLIdetails
    ${status}  run keyword and return status  Cntrl Ztimeout  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2
    Should be true  "${status}"=="False"
    Log  Shell timeout using contrl Z in command verified!  console=True
    ${optioncount}  Get Cntrlc Options Command  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2
    Should be true  "${optioncount}"=="2"
    Log  Cntrl C option navigation to main menu verified!  console=True
    
Enter commands should be same as ampcli menu items
    Get CLI login credential  CLIdetails
    Get commands  Commands
    ${cmdoutput}  Networkcmd  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${networkcmd}
    ${menuoutput}  Menu Network  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  3  1
    Run keyword if  "${cmdoutput}"=="${menuoutput}"  Log  Network command verified with ampcli menu-Network:${cmdoutput} successfully!  console=True
    ...  ELSE  Fail  Network command not verified!
    
Verify qlog and snoop
    Enable and Verify qlog and disable
    Enable and Verify snoop and disable
  
Enable and Verify qlog and disable
    Enable qlog and verify
    Disable qlog and verify
  #  ${outputcmd}  CheckEnabled  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${qlog}
  #  Run keyword if  "${outputcmd}"=="1"  Disable qlog and enable
  #  ...  ELSE  Enable qlog CLI

Disable qlog and verify
    Get CLI login credential  CLIdetails
    Get commands  Commands
    ${result1}  Disableqlog  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${qlog}
    Run keyword if  "${result1}"=="1"  Log  Qlog - ${qlog} disabled and verified successfully!  console=True
    ...  ELSE  Fail  Qlog - ${qlog} not disabled!

Enable qlog and verify
    Get CLI login credential  CLIdetails
    Get commands  Commands
    ${result1}  Enableqlog  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${qlog}
    Run keyword if  "${result1}"=="1"  Log  Qlog - ${qlog} enabled and verified successfully!  console=True
    ...  ELSE  Fail  Qlog - ${qlog} not enabled!
    
Enable and Verify snoop and disable
    Enable snoop and verify
    Disable snoop and verify

Enable snoop and verify
    Get CLI login credential  CLIdetails
    Get commands  Commands
    ${result1}  Enablesnoop  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${snoop}
    Run keyword if  "${result1}"=="1"  Log  Snoop - ${snoop} enabled and verified successfully!  console=True
    ...  ELSE  Fail  Snoop - ${snoop} not enabled!

Disable snoop and verify
    Get CLI login credential  CLIdetails
    Get commands  Commands
    ${result1}  Disablesnoop  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${snoop}
    Run keyword if  "${result1}"=="1"  Log  Snoop - ${snoop} Disabled and verified successfully!  console=True
    ...  ELSE  Fail  Snoop - ${snoop} not Disabled!


Verify Service status
    Get CLI login credential  CLIdetails
    Get commands  Commands
    ${result1}  Service Status  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  1  2  ${Service}
    Run keyword if  "${result1}"=="1"  Log  Service Status verified successfully!  console=True
    ...  ELSE  Fail  Service Status not verified!


### File Transfer ###
CLI file transfer via sftp and ftp
    Get CLI login credential  CLIdetails
    Get File server  Server
    ${result1}  File Transfer Sftp Ftp  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  1  2  ${CLIhost1}  ${CLIUsername1}  ${CLIpassword1}
    Run keyword if  "${result1}"=="2"  Log  File transfer via SFTP and FTP verified successfully!  console=True
    ...  ELSE  Fail  File transfer via SFTP and FTP not verified!

### CLI recovery ###
Check Amprecovery user password reset
    Get CLI login credential  CLIdetails
    ${number}  get Admin  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  5  2  amprecovery
    Log  Serial num: ${number}  console=True
    ${useroutput}  Reset CLI Access  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  5  2  ${number}
    Run keyword if  "${useroutput}"!="0"  Log  CLI Amprecovery user password can be resetted!  console=True
    ...  ELSE  Fail  Unable to reset CLI Amprecovery user password!
    Log  Reset CLI Amprecovery user password verified!  console=True

Reduce local backup - nightly
    Get CLI login credential  CLIdetails
    Get Nightly Backup/Restore data  NightlyData
    @{backupoutput}  Reduce Backup  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  2  ${FiletoBackup}
    ${Backupcount}  Set Variable  @{backupoutput}[0]
    ${MonthOutput}  Set Variable  @{backupoutput}[1]
    Run keyword if  ${Backupcount}<=4 and "${MonthOutput}"=="1"  Log  local backup count is less than 4 and old backups not found!  console=True
    ...  ELSE  Fail  local backup count exceeds and old backups found!

### Additional Enter commands ###
Verify additional enter commands - root shell
    Get Additional enter commands  Additionalcmnds
   # @{Commands}  Create list  ${Helpcmd}  ${snmpwalk}  ${pingcmd}  ${nslookup}  ${traceroute}  ${freecmd}  ${dbsize}  ${wdcmd}
    @{Commands}  Create list  ${Helpcmd}  ${snmpwalk}  ${pingcmd}  ${freecmd}  ${dbsize}  ${wdcmd}
    Log many  @{Commands}
    ${len}  Get length  ${Commands}
    Get CLI login credential  CLIdetails
    ${Commandoutput}  Verify Additionalcommands  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  1  2  ${Commands}  ${CLIhost2}
    Should be true  "${len}"=="${Commandoutput}"
    Log  Verified Additional commands!  console=True

Verify tcpdump - root shell
    Get CLI login credential  CLIdetails
    Get commands  Commands
    ${result1}  VerifyTcpdump  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  1  2  ${tcpdump}  
    Run keyword if  "${result1}"=="3"  Log  Tcpdump command verified successfully!  console=True
    ...  ELSE  Fail  Tcpdump command not verified!
    

### Functional 
Upload a File
    [Arguments]   ${UploadPath}  ${pswd}  ${UploadFile}
    Get CLI login credential  CLIdetails
    ${val}  Get Uploadfile  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  1  ${UploadPath}  ${pswd}  ${UploadFile}
    Should be true  '${val}'=='${percent}'
    log  file - ${UploadFile} uploaded successfully  console=True
   
Upload certificate
    [Arguments]   ${UploadPath}  ${pswd}  ${UploadFile}
    Get CLI login credential  CLIdetails
    ${val}  Get Certificatefile  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  1  ${UploadPath}  ${pswd}  ${UploadFile}
    Should be true  '${val}'=='${percent}'
    log  file - ${UploadFile} uploaded successfully  console=True
    

Download a File
    [Arguments]   ${Downloadfile}  ${pswd}  ${path}
    Get CLI login credential  CLIdetails
    ${number}  Get Download File  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  2  ${Downloadfile}
    Log  Serial num: ${number}  console=True
    ${Doutput}  Download File  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  2  ${number}  ${path}  ${pswd}  ${Downloadfile}
    Should be true  '${Doutput}'=='${percent}'
    log  file - ${Downloadfile} downloaded successfully  console=True

Delete a File
    [Arguments]   ${Deletefile}
    Get CLI login credential  CLIdetails
    ${number}  Get Delete Backup  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  3  ${Deletefile}
    Log  Serial num: ${number}  console=True
    ${Doutput}  Delete Backup  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  3  ${number}  y
    ${Deleteoutput}  Verify Delete Backup  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  3  ${Deletefile}
    Run keyword if  "${Deleteoutput}"=="0"  Log   File: ${Deletefile} deleted!  console=True
    ...  ELSE  Fail   file not deleted!    
   

Verify the file visibility
    [Arguments]   ${Downloadfile}
    Get CLI login credential  CLIdetails
     @{Resultfile}  Get Required File  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  1  2  ${Downloadfile}
    ${result1}  Set variable  @{Resultfile}[0]
    ${result2}  Set variable  @{Resultfile}[1]
    Should be true  "${result1}"=="${result2}"

Login and Verify For License
    [Arguments]  ${host}  ${aw10_username}  ${aw10_password}
    OpenBrowser
    Go To    ${host}
    Wait Until Element Is Visible    ${login_username_id}    20s
    Login.Enter Username    ${aw10_username}
    Login.Enter Password    ${aw10_password}
    Login.Click Submit Button
    Sleep  5s
    Login.Verify Successful Login   
    
Add License
    [Arguments]  ${MCLicense}  ${Product}
    Navigate To Home Page
    Navigate To Home License Page
    Sleep  10s
    Click  ${Loc_AddLic}
    Sleep  10s
    Type  ${Loc_LicTextBox}  ${MCLicense}
    Sleep  5s
    Click  ${Loc_LicAdd}
    Sleep  10s
    Click  ${Loc_Accept}
    Sleep  10s
    Wait Until Element Is Not Visible  ${loader}  30s
    DOMReadyByWaitTime  5
    AssertForElementPresent  //*[text()='${Product}']/parent::*//*[@type="checkbox"]
    Log  License - ${MCLicense} added successfully  console=True
    


Verify Login menu options after license
    @{Menu}  create List  ${loginmenu1}  ${loginmenu2}  ${loginmenu3}  ${loginmenu4}  ${loginmenu5}  ${loginmenu6}  ${loginmenu7}  ${loginmenu8}  ${loginmenu9} 
    Log Many  @{Menu}
    Get CLI login credential  License
    @{options}  Get Login Options  ${CLIhost}  ${CLIUsername}  ${CLIpassword}
    Log Many  @{options}
    Lists should be equal  ${Menu}  ${options}
    Log  CLI options verified after adding License  console=True
    
Delete License Added
    [Arguments]  ${MCLicense}  ${Product}
    Navigate To Home Page
    Navigate To Home License Page
    Sleep  10s
    Click  //*[text()='${Product}']/parent::*//*[@type="checkbox"]
    Click  ${Loc_DeleteButtonCLI}
    DOMReadyByWaitTime  5
    Click  ${Loc_CnfrmDeleteLic}
    DOMReadyByWaitTime  5
    AssertForElementNotPresent  //*[text()='${Product}']/parent::*//*[@type="checkbox"]
    Log  License - ${MCLicense} Deleted successfully  console=True
    LogoutAW
    
Verify automatic transfer destination
    Get CLI login credential  CLIdetails
    Get Destination  FileTransfer
    ${useroutput}  Set Destination  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  2  1  2  1  ${Destination}  ${Password}  
    Run keyword if  "${useroutput}"=="1"  Log  Destination set to ${Destination}!  console=True
    ...  ELSE  Fail  File transfer destination not set!

Verify clear automatic transfer destination
    Get CLI login credential  CLIdetails
    Get Destination  FileTransfer
    ${useroutput}  Clear Destination  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  2  1  2  2  
    Run keyword if  "${useroutput}"=="1"  Log  Destination - ${Destination} cleared!  console=True
    ...  ELSE  Fail  File transfer destination not cleared!

Verify Setting the amp to DCI
    Get CLI login credential  CLIdetails
    Get commands  Commands
    ${useroutput}  Set Amp To DCI  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  2  ${dcicmd}
    Run keyword if  "${useroutput}"=="1"  Log  Device Communication Interface set!  console=True
    ...  ELSE  Fail  Device Communication Interface not set!

Get Device monitoring id
    [Arguments]  ${GUIHost}  ${Username}  ${Password}
    Login and Verify For License  ${GUIHost}  ${Username}  ${Password}
    DOMReadyByWaitTime  10
    Navigate to device Page
    DOMReadyByWaitTime  30
    ${count}  get element count  ${Loc_DevCount}
    run keyword if  "${count}"!="0"  click  ${Loc_DevCount}
    ...  ELSE  Fail  no device!
    DOMReadyByWaitTime  10
    ${url}  get location  
    Log  Url: ${url}  console=True
    ${url}  ${id}  Split string  ${url}  =
    Log  Id:${id}  console=True
    LogoutAW
    [return]  ${id}
    
Verify snmpwalk - root shell
    [Arguments]  ${id}
    Get CLI login credential  CLIdetails
    ${useroutput1}  Snmpwalk Monitor ID  ${CLIhost}  ${CLIUsername}  ${CLIpassword}  8  1  2  ${id}
    Run keyword if  "${useroutput1}"!="0"  Log  Snmpwalk verified for ${useroutput1}!  console=True
    ...  ELSE  Fail  Snmpwalk not verified for sw,sw2 and sw3!
    

*** Keywords ***
Get CLI login credential
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${CLIhostList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIhost
    ${CLIhost} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIhostList}  1
    Set Suite Variable  ${CLIhost}
    ${CLIUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIUsername
    ${CLIUsername} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIUsernameList}  1
    Set Suite Variable  ${CLIUsername}
    ${CLIpasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIpassword
    ${CLIpassword} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIpasswordList}  1
    Set Suite Variable  ${CLIpassword}
    
Get Nightly Backup/Restore data
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${FiletoBackupList} =  Data_Provider.GetDataProviderColumnValue  Data_FiletoBackup
    ${FiletoBackup} =  Data_Provider.DataProviderSplitterForMultipleValues  ${FiletoBackupList}  1
    Set Suite Variable  ${FiletoBackup}
    
Get Download File Details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${DownloadPathList} =  Data_Provider.GetDataProviderColumnValue  Data_DownloadPath
    ${DownloadPath} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DownloadPathList}  1
    Set Suite Variable  ${DownloadPath}
    ${DownloadFileList} =  Data_Provider.GetDataProviderColumnValue  Data_DownloadFile
    ${DownloadFile} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DownloadFileList}  1
    Set Suite Variable  ${DownloadFile}
    ${PasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_Password
    ${Password} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  1
    Set Suite Variable  ${Password}    

Get Destination
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${DestinationList} =  Data_Provider.GetDataProviderColumnValue  Data_Destination
    ${Destination} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DestinationList}  1
    Set Suite Variable  ${Destination}
    ${PasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_Password
    ${Password} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  1
    Set Suite Variable  ${Password}    

Get Upload File Details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${UploadFileList} =  Data_Provider.GetDataProviderColumnValue  Data_UploadFile
    ${UploadFile} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UploadFileList}  1
    Set Suite Variable  ${UploadFile}
    ${PasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_Password
    ${Password} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  1
    Set Suite Variable  ${Password}
    ${UploadPathList} =  Data_Provider.GetDataProviderColumnValue  Data_UploadPath
    ${UploadPath} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UploadPathList}  1
    Set Suite Variable  ${UploadPath}
    
Get Certificate Details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${UploadFileList} =  Data_Provider.GetDataProviderColumnValue  Data_UploadFile
    ${UploadFile} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UploadFileList}  1
    Set Suite Variable  ${UploadFile}
    ${PasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_Password
    ${Password} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  1
    Set Suite Variable  ${Password}
    ${PasswordCertList} =  Data_Provider.GetDataProviderColumnValue  Data_PasswordCert
    ${PasswordCert} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordCertList}  1
    Set Suite Variable  ${PasswordCert}
    ${UploadPathList} =  Data_Provider.GetDataProviderColumnValue  Data_UploadPath
    ${UploadPath} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UploadPathList}  1
    Set Suite Variable  ${UploadPath}
   
Get Delete File Details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${DeleteFileList} =  Data_Provider.GetDataProviderColumnValue  Data_DeleteFile
    ${DeleteFile} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DeleteFileList}  1
    Set Suite Variable  ${DeleteFile}

Get Hostname
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider    ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${UnresolvableHostList} =  Data_Provider.GetDataProviderColumnValue  Data_UnresolvableHost
    ${UnresolvableHost} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UnresolvableHostList}  1
    Set Suite Variable  ${UnresolvableHost}
    ${HostnameList} =  Data_Provider.GetDataProviderColumnValue  Data_Hostname
    ${Hostname} =  Data_Provider.DataProviderSplitterForMultipleValues  ${HostnameList}  1
    Set Suite Variable  ${Hostname}
    ${ShortNameList} =  Data_Provider.GetDataProviderColumnValue  Data_ShortName
    ${ShortName} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ShortNameList}  1
    Set Suite Variable  ${ShortName}
    ${BadInputList} =  Data_Provider.GetDataProviderColumnValue  Data_BadInput
    ${BadInput} =  Data_Provider.DataProviderSplitterForMultipleValues  ${BadInputList}  1
    Set Suite Variable  ${BadInput}

    

### AMPCLI cmnd menu ###
Get Help Commands
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${HelpcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_Helpcmd
    ${Helpcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${HelpcmdList}  1
    Set Suite Variable  ${Helpcmd}
    ${QuitList} =  Data_Provider.GetDataProviderColumnValue  Data_Quit
    ${Quit} =  Data_Provider.DataProviderSplitterForMultipleValues  ${QuitList}  1
    Set Suite Variable  ${Quit}
    ${DateList} =  Data_Provider.GetDataProviderColumnValue  Data_Date
    ${Date} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DateList}  1
    Set Suite Variable  ${Date}
    ${ExitList} =  Data_Provider.GetDataProviderColumnValue  Data_Exit
    ${Exit} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ExitList}  1
    Set Suite Variable  ${Exit}
    ${TopList} =  Data_Provider.GetDataProviderColumnValue  Data_Top
    ${Topcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TopList}  1
    Set Suite Variable  ${Topcmd}
    ${ClearList} =  Data_Provider.GetDataProviderColumnValue  Data_Clear
    ${Clear} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ClearList}  1
    Set Suite Variable  ${Clear}
    
Get Base Unix commands
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${DateList} =  Data_Provider.GetDataProviderColumnValue  Data_Date
    ${Date} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DateList}  1
    Set Suite Variable  ${Date}
    ${TopList} =  Data_Provider.GetDataProviderColumnValue  Data_Top
    ${Topcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${TopList}  1
    Set Suite Variable  ${Topcmd}
    ${lscmdList} =  Data_Provider.GetDataProviderColumnValue  Data_lscmd
    ${lscmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${lscmdList}  1
    Set Suite Variable  ${lscmd}
    ${rmcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_rmcmd
    ${rmcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${rmcmdList}  1
    Set Suite Variable  ${rmcmd}
    ${dfcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_dfcmd
    ${dfcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${dfcmdList}  1
    Set Suite Variable  ${dfcmd}
    ${hostnamecmdList} =  Data_Provider.GetDataProviderColumnValue  Data_hostnamecmd
    ${hostnamecmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${hostnamecmdList}  1
    Set Suite Variable  ${hostnamecmd}
    ${iptablescmdList} =  Data_Provider.GetDataProviderColumnValue  Data_iptablescmd
    ${iptablescmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${iptablescmdList}  1
    Set Suite Variable  ${iptablescmd}
    
Get AMP aliases commands
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${DaemonsList} =  Data_Provider.GetDataProviderColumnValue  Data_Daemons
    ${Daemons} =  Data_Provider.DataProviderSplitterForMultipleValues  ${DaemonsList}  1
    Set Suite Variable  ${Daemons}
    ${wdcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_wdcmd
    ${wdcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${wdcmdList}  1
    Set Suite Variable  ${wdcmd}
    ${psgcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_psgcmd
    ${psgcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${psgcmdList}  1
    Set Suite Variable  ${psgcmd}
    ${psscmdList} =  Data_Provider.GetDataProviderColumnValue  Data_psscmd
    ${psscmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${psscmdList}  1
    Set Suite Variable  ${psscmd}
    ${techsupportList} =  Data_Provider.GetDataProviderColumnValue  Data_techsupport
    ${techsupport} =  Data_Provider.DataProviderSplitterForMultipleValues  ${techsupportList}  1
    Set Suite Variable  ${techsupport}
    ${dbsizeList} =  Data_Provider.GetDataProviderColumnValue  Data_dbsize
    ${dbsize} =  Data_Provider.DataProviderSplitterForMultipleValues  ${dbsizeList}  1
    Set Suite Variable  ${dbsize}
    ${crrcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_crrcmd
    ${crrcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${crrcmdList}  1
    Set Suite Variable  ${crrcmd}
    ${versioncmdList} =  Data_Provider.GetDataProviderColumnValue  Data_versioncmd
    ${versioncmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${versioncmdList}  1
    Set Suite Variable  ${versioncmd}
    ${gitdiffcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_gitdiffcmd
    ${gitdiffcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${gitdiffcmdList}  1
    Set Suite Variable  ${gitdiffcmd}
    ${visualrfcacheList} =  Data_Provider.GetDataProviderColumnValue  Data_visualrfcache
    ${visualrfcache} =  Data_Provider.DataProviderSplitterForMultipleValues  ${visualrfcacheList}  1
    Set Suite Variable  ${visualrfcache}
    
Get commands 
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${ampbackupList} =  Data_Provider.GetDataProviderColumnValue  Data_ampbackup
    ${ampbackup} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ampbackupList}  1
    Set Suite Variable  ${ampbackup}
    ${historycmdList} =  Data_Provider.GetDataProviderColumnValue  Data_historycmd
    ${historycmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${historycmdList}  1
    Set Suite Variable  ${historycmd}
    ${networkcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_networkcmd
    ${networkcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${networkcmdList}  1
    Set Suite Variable  ${networkcmd}
    ${sudocmdList} =  Data_Provider.GetDataProviderColumnValue  Data_sudocmd
    ${sudocmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${sudocmdList}  1
    Set Suite Variable  ${sudocmd}
    ${qlogList} =  Data_Provider.GetDataProviderColumnValue  Data_qlog
    ${qlog} =  Data_Provider.DataProviderSplitterForMultipleValues  ${qlogList}  1
    Set Suite Variable  ${qlog}
    ${snoopList} =  Data_Provider.GetDataProviderColumnValue  Data_snoop
    ${snoop} =  Data_Provider.DataProviderSplitterForMultipleValues  ${snoopList}  1
    Set Suite Variable  ${snoop}
    ${ServiceList} =  Data_Provider.GetDataProviderColumnValue  Data_Service
    ${Service} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ServiceList}  1
    Set Suite Variable  ${Service}
    ${dcicmdList} =  Data_Provider.GetDataProviderColumnValue  Data_dcicmd
    ${dcicmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${dcicmdList}  1
    Set Suite Variable  ${dcicmd}
    ${tcpdumpList} =  Data_Provider.GetDataProviderColumnValue  Data_tcpdump
    ${tcpdump} =  Data_Provider.DataProviderSplitterForMultipleValues  ${tcpdumpList}  1
    Set Suite Variable  ${tcpdump}
    

### File transfer ###
Get File server
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${CLIhostList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIhost
    ${CLIhost1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIhostList}  1
    Set Suite Variable  ${CLIhost1}
    ${CLIUsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIUsername
    ${CLIUsername1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIUsernameList}  1
    Set Suite Variable  ${CLIUsername1}
    ${CLIpasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIpassword
    ${CLIpassword1} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIpasswordList}  1
    Set Suite Variable  ${CLIpassword1}
    
### Additional Enter Commands ###
Get Additional enter commands
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${HelpcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_Helpcmd
    ${Helpcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${HelpcmdList}  1
    Set Suite Variable  ${Helpcmd}
    ${dbsizeList} =  Data_Provider.GetDataProviderColumnValue  Data_dbsize
    ${dbsize} =  Data_Provider.DataProviderSplitterForMultipleValues  ${dbsizeList}  1
    Set Suite Variable  ${dbsize}
    ${wdcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_wdcmd
    ${wdcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${wdcmdList}  1
    Set Suite Variable  ${wdcmd}
    ${snmpwalkList} =  Data_Provider.GetDataProviderColumnValue  Data_snmpwalk
    ${snmpwalk} =  Data_Provider.DataProviderSplitterForMultipleValues  ${snmpwalkList}  1
    Set Suite Variable  ${snmpwalk}
    ${pingcmdList} =  Data_Provider.GetDataProviderColumnValue  Data_pingcmd
    ${pingcmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${pingcmdList}  1
    Set Suite Variable  ${pingcmd}
    ${nslookupList} =  Data_Provider.GetDataProviderColumnValue  Data_nslookup
    ${nslookup} =  Data_Provider.DataProviderSplitterForMultipleValues  ${nslookupList}  1
    Set Suite Variable  ${nslookup}
    ${tracerouteList} =  Data_Provider.GetDataProviderColumnValue  Data_traceroute
    ${traceroute} =  Data_Provider.DataProviderSplitterForMultipleValues  ${tracerouteList}  1
    Set Suite Variable  ${traceroute}
    ${freecmdList} =  Data_Provider.GetDataProviderColumnValue  Data_freecmd
    ${freecmd} =  Data_Provider.DataProviderSplitterForMultipleValues  ${freecmdList}  1
    Set Suite Variable  ${freecmd}
    ${CLIhostList} =  Data_Provider.GetDataProviderColumnValue  Data_CLIhost
    ${CLIhost2} =  Data_Provider.DataProviderSplitterForMultipleValues  ${CLIhostList}  1
    Set Suite Variable  ${CLIhost2}
    
Get License details
    [Arguments]    ${TestcaseName}
    ${This_DataProvider} =  Data_Provider.DataProvider  ${TestcaseName}
    Set Suite Variable  ${This_DataProvider}
    Set Suite Variable  ${SheetName}
    Log  ${This_DataProvider}
    ${MCLicenseList} =  Data_Provider.GetDataProviderColumnValue  Data_MCLicense
    ${MCLicense} =  Data_Provider.DataProviderSplitterForMultipleValues  ${MCLicenseList}  1
    Set Suite Variable  ${MCLicense}
    ${GUIHostList} =  Data_Provider.GetDataProviderColumnValue  Data_GUIHost
    ${GUIHost} =  Data_Provider.DataProviderSplitterForMultipleValues  ${GUIHostList}  1
    Set Suite Variable  ${GUIHost}
    ${UsernameList} =  Data_Provider.GetDataProviderColumnValue  Data_Username
    ${Username} =  Data_Provider.DataProviderSplitterForMultipleValues  ${UsernameList}  1
    Set Suite Variable  ${Username}
    ${PasswordList} =  Data_Provider.GetDataProviderColumnValue  Data_UIPassword
    ${Password} =  Data_Provider.DataProviderSplitterForMultipleValues  ${PasswordList}  1
    Set Suite Variable  ${Password}
    ${ProductList} =  Data_Provider.GetDataProviderColumnValue  Data_Product
    ${Product} =  Data_Provider.DataProviderSplitterForMultipleValues  ${ProductList}  1
    Set Suite Variable  ${Product}
    
    

*** Variables ***
${CLIhost}
${CLIUsername}
${CLIpassword}
${FiletoBackup}
### Global variable ###
${Backupfile}

${UploadPath}  
${UploadFile}  
${DownloadPath}  
${Password}  
${downloadFile}  
${percent}  100%

### Commands ###
${Clear}
${Topcmd}
${Exit}
${Date}
${Quit}
${Helpcmd}

${lscmd}
${rmcmd}
${dfcmd}
${hostnamecmd}
${iptablescmd}

${Daemons}
${wdcmd}
${psgcmd}
${psscmd}
${techsupport}
${dbsize}
${crrcmd}
${versioncmd}
${gitdiffcmd}
${visualrfcache}

${ampbackup}
${historycmd}
${networkcmd}
${sudocmd}
${qlog}
${snoop}
${Service}

${CLIhost2}
${freecmd}
${traceroute}
${nslookup}
${snmpwalk}
${pingcmd}
${CLIhost1}
${CLIUsername1}
${CLIpassword1}
${DeleteFile}
${PasswordCert}
${UnresolvableHost}
${Hostname}
${ShortName}
${BadInput}
${MCLicense}
${GUIHost}
${Username}
${Password}
${Product}
${Destination}
${dcicmd}
${tcpdump}