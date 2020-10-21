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
Resource          ../../Keywords/AMPCLI_keywords/Ampcli_keywords.robot

*** Test Cases ***

Test
    Login and Verify
    DOMReadyByWaitTime  10
    @{BeforeSortList}  Get User Names
    Click  //*[@class="username"]/*
    DOMReadyByWaitTime  5
    @{AfterSortList}  Get User Names
    ${status}  Run keyword and return status  Lists Should be equal  ${BeforeSortList}  ${AfterSortList}
    Should be true  "${status}"=="False"
    
*** Keywords ***
Get User Names
    Navigate To AMP Setup Page
    Navigate To AMP Setup Users page
    DOMReadyByWaitTime  10
    @{List}  Create list
    @{ele}  Get WebElements  //*[@class="edit_link pencil"]/parent::*/following-sibling::td[1]
    :FOR  ${i}  IN  @{ele}
    \    ${name}  Get Text  ${i}
    \    Append To List  ${List}  ${name}
    Log Many  @{List}
    [return]  @{List}
 



*** comments ***


    


Verify options in AMPCLI
    [Documentation]  Get the menu options in cli
    ...    
    [Tags]  Case_AIR293
    Verify Login menu

Verify Exit options 
    [Documentation]  Verify exit option by clicking quit and control+Z
    ...    
    [Tags]  Case_AIR294
    Verify termination option
   
Verify Consistent navigation options
    [Documentation]  Verify navigation option like back,cancel and '0'
    ...    
    [Tags]  Case_AIR295
    Verify back - Navigation option
    Verify Cancel - Navigation option
    Verify 0 - Navigation option
  
    
Verify Post operation menu in AMPCLI
    [Documentation]  Verify output and return code by clicking s and r
    ...    
    [Tags]  Case_AIR296
    Verify succesful output and return code
    Verify error output and return code
    
Verify Upload option
    [Documentation]  Verify Upload in cli
    [Tags]  Case_AIR297
    Get Upload File Details  UploadFile
    Upload a File   ${UploadPath}   ${Password}  ${UploadFile}
 
Verify Download option
    [Documentation]  Verify Download in cli
    [Tags]  Case_AIR300
    Get Download File Details  DownloadFile
    Download a File  ${DownloadFile}  ${Password}  ${DownloadPath}

Verify Delete option
    [Documentation]  Verify Delete in cli
    [Tags]  Case_AIR304
    Get Delete File Details  DeleteFile
    Delete a File   ${DeleteFile}

File Visibility
    [Documentation]  Check the visibility of a file
    [Tags]  Case_AIR305
    Get Download File Details  DownloadFile
    Verify the file visibility  ${DownloadFile}

Verify Pre-populated files for visiblity
    [Documentation]  Check the visibility of a file
    [Tags]  Case_AIR306
    Verify the pre-populated file visibility  
    
    
Deleting a backup should delete the backup
    [Documentation]  Delete backup - nightly with oldest date
    ...    
    [Tags]  Case_AIR307
    ${Oldestdate}  Get oldest date with nightly data for Backup delete
    ${number}  Verify Nightly backup delete  ${Oldestdate}
    ### Delete Nightly backup data with oldest date 
    # Delete Nightly backup with old date  ${number} 
    

Verify Delete runaway log
    [Documentation]  Delete backup - nightly with oldest date
    ...    
    [Tags]  Case_AIR308
    ${Oldestdate}  Get oldest date with nightly data for Backup delete
    ${number}  Verify Nightly backup delete  ${Oldestdate}
    ### Delete Nightly backup data with oldest date 
    # Delete Nightly backup with old date  ${number} 



Verify Backup option
    [Documentation]  Verify backup in cli 
    ...    
    [Tags]  Case_AIR309
    ${Backup}  Create CLI Backup
    Verify CLI Backup  ${Backup}
    
Verify Restore Option
    [Documentation]  Verify backup in cli 
    ...    
    [Tags]  Case_AIR310
    Verify Restore option  ${Backupfile}
    
Cleanup for Backup created
    [Documentation]  Cleanup for backup
    Delete the Backup created   ${Backupfile}
    
Verify Restore option - nightly
    [Documentation]  Restore option - nightly with recent date
    ...    
    [Tags]  Case_AIR311
    ${Recentdate}  Get recent date with nightly data for restore
    ${Restoreoutput}  Verify Nightly restore option  ${Recentdate}
    ### Restore Nightly data commented . Uncomment to restore nightly data with recent date
  #  Restore Nightly data with recent date  ${Restoreoutput}
    
    
Verify Support option - Show tech Support
    [Documentation]  Get Show tech Support in cli
    ...    
    [Tags]  Case_AIR313
    Verify Show tech support option
    
Verify Upgrade AMP option - auto 
    [Documentation]  Upgrade AMP option
    ...    
    [Tags]  Case_AIR317
    Verify Upgrade AMP option

Verify Restart AMP
    [Documentation]  Check If AMP can be restarted
    ...    
    [Tags]  Case_AIR322
    Verify restart amp option

Verify Reboot AMP
    [Documentation]  Check If AMP can be rebooted
    ...    
    [Tags]  Case_AIR323
    Verify reboot amp option
    
Verify Shutdown AMP
    [Documentation]  Check If AMP can be rebooted
    ...    
    [Tags]  Case_AIR324
    Verify shutdown amp option
    
Verify Remove new menu
    [Documentation]  Remove new menu in cli
    ...    
    [Tags]  Case_AIR325
    Verify Remove new menu option
    
Verify Add new menu
    [Documentation]  Add new menu in cli
    ...    
    [Tags]  Case_AIR326
    Verify Add new menu option

Verify Use a new menu item
    [Documentation]  Use a new menu in cli
    ...    
    [Tags]  Case_AIR327
    Verify Use new menu option
    
Verify Change network settings
    [Documentation]  Change network settings commit changes and check if change is reflected
    ...    
    [Tags]  Case_AIR328
    ${originalserver}  Modify network settings and verify
    Revert Back To Original settings  ${originalserver}

Verify Internal network setting validation
    [Documentation]  Get Internal network setting in cli
    ...    
    [Tags]  Case_AIR329
    Verify Internal network setting

Verify Custom network settings
    [Documentation]  Get Internal network setting in cli
    ...    
    [Tags]  Case_AIR330
    Verify Custom network setting    

Verify Time update settings
    [Documentation]  Modify Time update in cli
    ...    
    [Tags]  Case_AIR331
    Verify Time update option

Security - Reset UI access
    [Documentation]  Get the menu options in cli
    ...    
    [Tags]  Case_AIR333
    Verify Reset UI admin Access    
    
Security - Reset CLI access
    [Documentation]  Get the menu options in cli
    ...    
    [Tags]  Case_AIR334
    Verify Reset CLI ampadmin Access 
    
Verify Security - Add SSL cert
    [Documentation]  Check Add SSL cert
    [Tags]  Case_AIR335
    Verify add SSL Certificate  




Security - Show module key
    [Documentation]  Verify if module key is shown
    ...    
    [Tags]  Case_AIR337
    Verify Show module key 
    
   

Security - Save module key
    [Documentation]  Save module key and check in downloads
    ...    
    [Tags]  Case_AIR339
    ${key}  Save module key from system 
    Check module key in downloads  ${key}
    
Inner menu - c to cancel
    [Documentation]  Verify navigation option cancel
    ...    
    [Tags]  Case_AIR341
    Verify Cancel - Navigation option
    
Verify Cntl c / cntrl d
    [Documentation]  Verify main menu navigation option by clicking Cntrl C
    ...    
    [Tags]  Case_AIR342
    Verify Cntrl C navigation option
    

Verify Sanitize outputs
    [Documentation]  Get Sanitize outputs
    ...    
    [Tags]  Case_AIR343
    Verify Sanitize outputs

Verify Security - add SSL cert with csr
    [Documentation]  Check Add SSL cert with csr
    [Tags]  Case_AIR345
    Verify add SSL Certificate


Support option - delete support user
    [Documentation]  delete support user
    ...    
    [Tags]  Case_AIR347
    Delete support user
    
Support option - show awsupport gpg should be blank after deletion
    [Documentation]  delete support user and check contents of show awsupport
    ...    
    [Tags]  Case_AIR350
    Check show awsupport user after deletion

Support option - start/stop connection toggle behaviour
    [Documentation]  Start support connection
    ...    
    [Tags]  Case_AIR349
    Check start support connection without user
    Check start support connection with user

Support option - show contents of awsupport.gpg
    [Documentation]  show contents of awsupport.gpg
    ...    
    [Tags]  Case_AIR348
    Check show content of awsupport user
    
Check Security - Module key individually
    [Documentation]  Verify if module key is shown
    ...    
    [Tags]  Case_AIR351
    Verify Show module key  
    

    





### AMPCLI Cmnds Menu ###
Verify Help context using command
    [Documentation]  Verify Help context using '?' cmnd in cli
    ...    
    [Tags]  Case_AIR248
    Verify Help context cmnd
    
Check cmnds that come from the base unix
    [Documentation]  Check base unix commands in cli
    ...    
    [Tags]  Case_AIR249
    Check Base unix commands 
    

Check cmnds that come from amp aliases
    [Documentation]  Check cmnds that come from amp aliases in cli
    ...    
    [Tags]  Case_AIR250
    Verify amp aliases commands

Verify Backup and restore cmnds
    [Documentation]  Check Backup and restore commands in cli
    ...    
    [Tags]  Case_AIR251
    Verify Backup command

Verify Service <service> status/start/stop/restart
    [Documentation]  Get Service <service> status/start/stop/restart
    ...    
    [Tags]  Case_AIR252
    Verify Service status    

Validate qlog and wq snoop
    [Documentation]  Get the qlog and wq snoop in cli
    ...    
    [Tags]  Case_AIR253
    Verify qlog and snoop


Verify Enter cmnds flexiblity cmnds
    [Documentation]  Check Enter cmnds flexiblity in cli
    ...    
    [Tags]  Case_AIR254
    Verify Enter commands flexiblity - History
    
Validate network cmnd (network setup script)
    [Documentation]  Check network cmnd in cli
    ...    
    [Tags]  Case_AIR255
    Check network command    

Verify Limited access - Cant escape into root shell
    [Documentation]  Check Limited access - Cant escape into root shell
    ...    
    [Tags]  Case_AIR257
    Check escape into root shell -sudo
    
Verify Stig - disables enter cmnds
    [Documentation]  Check Stig - disables enter cmnds
    ...    
    [Tags]  Case_AIR258
    Check Stig - disables enter cmnds

Check Enter commands menu observes the timeouts from ampcli shell
    [Documentation]  Check default timeout after 10 mins
    ...    
    [Tags]  Case_AIR259
    Check ampcli shell timeout

Verify Cntrl c , cntrl z in commands
    [Documentation]  Check Cntrl c and cntrl Z
    ...    
    [Tags]  Case_AIR260
    Check Cntrl c and cntrl Z in commands


Verify Enter commands should be same as ampcli menu items
    [Documentation]  Check Enter commands should be same as ampcli menu items
    ...    
    [Tags]  Case_AIR261
    Enter commands should be same as ampcli menu items



### File Transfer ###

Verify CLI file transfer via sftp/ftp
    [Documentation]  Check CLI file transfer via sftp/ftp in root shell
    ...    
    [Tags]  Case_AIR235
    CLI file transfer via sftp and ftp
    

### CLI Recovery ###
Verify Amprecovery user password reset
    [Documentation]  Check Amprecovery user password reset
    ...    
    [Tags]  Case_AIR364
    Check Amprecovery user password reset
    

    
### Backup ###
Verify Reduce local backup
    [Documentation]  Check Reduce local backup nightly
    ...    
    [Tags]  Case_AIR368
    Reduce local backup - nightly
    
Set automatic transfer destination
    [Documentation]  Check automatic transfer destination
    ...    
    [Tags]  Case_AIR370
    Verify automatic transfer destination
    
Clear automatic transfer destination
    [Documentation]  Check clear automatic transfer destination
    ...    
    [Tags]  Case_AIR371
    Verify clear automatic transfer destination



### Additional Enter cmds ###
Verify snmpwalk in root shell
    [Documentation]  Check snmpwalk in root shell
    ...    
    [Tags]  Case_AIR237
    Get License details  Server
    ${id}  Get Device monitoring id  ${GUIHost}  ${Username}  ${Password}
    Verify snmpwalk - root shell  ${id}


Verify tcpdump in root shell
    [Documentation]  Check tcpdump in root shell
    ...    
    [Tags]  Case_AIR238
    Verify tcpdump - root shell

Verify other additional enter commands in root shell
    [Documentation]  Check Reduce local backup nightly
    ...    
    [Tags]  Case_AIR239
    Verify additional enter commands - root shell
    
### Master Console ###

Verify MC CLI access
    [Documentation]  Add License and check MC CLI access
    [Tags]  Case_AIR286
    Get License details  License
    Login and Verify For License  ${GUIHost}  ${Username}  ${Password}
    Add License  ${MCLicense}  ${Product}
    Verify Login menu options after license
    Delete License Added  ${MCLicense}  ${Product}
  
Verify MC file access
    [Documentation]  Add License and check MC CLI access
    [Tags]  Case_AIR288
    Get License details  License
    Login and Verify For License  ${GUIHost}  ${Username}  ${Password}
    Add License  ${MCLicense}  ${Product}
    Verify Login menu options after license
    Delete License Added  ${MCLicense}  ${Product}
    
### SET Hostname  ###

Set short Hostname
    [Documentation]  Verify Setting up a short Hostname
    [Tags]  Case_AIR352
    Get Hostname  Hostname
    Set short Hostname  ${ShortName}
    
Verify FQDN
    [Documentation]  Check Verify FQDN
    [Tags]  Case_AIR353
    Verify unresolvable hostname

Verify Change from unresolvable hostname
    [Documentation]  Check unresolvable hostname
    [Tags]  Case_AIR354
    Verify unresolvable hostname
    
Set Invalid Hostname
    [Documentation]  Verify Setting up a short Hostname
    [Tags]  Case_AIR355
    Get Hostname  Hostname
    Set Invalid Hostname  ${BadInput}

Verify Attempt to escape CLI hostname
    [Documentation]  Check Attempt to escape CLI
    [Tags]  Case_AIR356
    Verify Attempt to escape CLI
    
### Advanced network config ###

Setting the amp to device communication interface
    [Documentation]  Setting the amp to device communication interface
    ...    
    [Tags]  Case_AIR246
    Verify Setting the amp to DCI
    
*** Comments ***
Click device and get url
    login and verify
    Navigate to device Page
    DOMReadyByWaitTime  30
    ${count}  get element count  //*[@class="read_state"]/*[contains(@href,'ap_monitoring')]
    run keyword if  "${count}"!="0"  click  //*[@class="read_state"]/*[contains(@href,'ap_monitoring')]
    ...  ELSE  Fail  no device!
    DOMReadyByWaitTime  10
    ${url}  get location  
    Log  Url: ${url}  console=True




*** Comments ***



    



*** Variables ***
${SheetName}  AMPCLI