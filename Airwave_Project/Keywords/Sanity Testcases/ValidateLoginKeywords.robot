*** Settings ***
Documentation     Page/feature library for Login
Library           SeleniumLibrary  timeout=90.0	 run_on_failure=Failure Log
Library           String
Resource          ../../Locators/Login.robot
Resource          ../../Utilities/Browser.robot
#Resource          ../../Locators/ValidateLoginpage.txt
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Locators/Homepage.robot


*** Variables ***
${host}  
${aw10_ui_username}  admin
${aw10_ui_password}
${header_value}  xpath=//*[contains(@class,'app-subheader-td-div')]
${expected_output}  AirWave

*** Keywords ***

    
Login To AMP page
    [Documentation]    This can be used as a standalone keyword inside TS.Setup for example
    #Go to the Airwave host
    [Arguments]  ${Username}  ${Password}
    OpenBrowser
    Go To    ${host}
    Sleep  10s
  #  Wait Until Element Is Visible    ${Username}    20s
    Loginpage.Enter Username    ${Username}
    Loginpage.Enter Password    ${Password}
    Loginpage.Click Submit Button
    Loginpage.Verify Login Error  Login failedPlease re-enter username and password
    
  #  Loginpage.Verify Successful Login
   # Sleep  5s
   # Logout from AMP Page
   
Login To AMP page successful for Airwave after cleanup
    [Arguments]  ${UserName2}  ${Password2} 
    OpenBrowser
    Go To    ${host}
    Sleep  10s
  #  Wait Until Element Is Visible    ${Username}    20s
    Loginpage.Enter Username    ${UserName2}
    Loginpage.Enter Password    ${Password2} 
    Loginpage.Click Submit Button
    Loginpage.Verify Successful Login
   
Login To AMP page successful for Airwave
    [Documentation]    This can be used as a standalone keyword inside TS.Setup for example
    #Go to the Airwave host
    [Arguments]  ${UserName2}  ${Password2} 
  #  OpenBrowser
   # Go To    ${host}
    Sleep  10s
  #  Wait Until Element Is Visible    ${Username}    20s
    Loginpage.Enter Username    ${UserName2}
    Loginpage.Enter Password    ${Password2} 
    Loginpage.Click Submit Button
    Loginpage.Verify Successful Login
    
Loginpage.Enter Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${login_username_id}    10s
    Input Text    ${login_username_id}    ${username}

Loginpage.Enter Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${login_password_id}    10s
    Input Text    ${login_password_id}    ${password}

Loginpage.Click Submit Button
    Wait Until Element Is Visible    ${login_button_id}    10s
    Click Element    ${login_button_id}
    
Login As User
    [Documentation]    This can be used as a standalone keyword inside TS.Setup for example
    [Arguments]  ${aw10_username}  ${aw10_password}
    #Go to the Airwave host
    OpenBrowser
    Go To    ${host}
    Wait Until Element Is Visible    ${login_username_id}    20s
    Login.Enter Username    ${aw10_username}
    Login.Enter Password    ${aw10_password}
    Login.Click Submit Button
    Sleep  5s
    Loginpage.Verify Successful Login    
    
LogoutAW
    [Documentation]    This keyword is used as part of TS teardown. Logout will happen for every test suite execution.
    Wait Until Element Is Visible    ${logout_link_id}    10s
    Click Element    ${logout_link_id}
    Handle Alert  action=ACCEPT
    Logout and Close the Browser
    
Logout from AMP Page
    [Documentation]    This keyword is used as part of TS teardown. Logout will happen for every test suite execution.
    Wait Until Element Is Visible    ${logout_link_id}    10s
    Click Element    ${logout_link_id}
    Handle Alert  action=ACCEPT
    Logout and Close the Browser
    

Login.Enter Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${login_username_id}    10s
    Input Text    ${login_username_id}    ${username}

Login.Enter Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${login_password_id}    10s
    Input Text    ${login_password_id}    ${password}

Login.Click Submit Button
    Wait Until Element Is Visible    ${login_button_id}    10s
    Click Element    ${login_button_id}
    #Verify Click went through correctly. Else replace with javascript click

Loginpage.Verify Successful Login
    Wait Until Element Is Visible    ${logout_link_id}    30s
    #Element Should Be Visible    leftnav    message="Could not find the AMP Menu link. FAILING TEST"
    #Add more checks for verifying that login is successful and that the webdriver is on the Glass Home page
    ${header_value}=  Get Text  ${header_value}  
    log  ${header_value}  console=True
    Should Be Equal As Strings    ${header_value}  ${expected_output} 
    Log    !!!Login Successfull!!!    INFO

Login.Verify Successful Logout
    Wait Until Element Is Visible    ${login_button_id}    10s
    Element Should Be Visible    ${login_username_id}    message="Did not find Login fields.Logout not successful. FAILING TEST"
    #Add more checks for verifying that logout is successful and that the webdriver is on the Glass Login page
    Log    !!!Logout Successfull!!!    INFO
    
Logout and Close the Browser
    Wait Until Element Is Visible    ${login_button_id}    30s
    Element Should Be Visible    ${login_username_id}    message="Did not find Login fields.Logout not successful. FAILING TEST"
    #Add more checks for verifying that logout is successful and that the webdriver is on the Glass Login page
    Log    !!!Logout Successfull!!!    INFO
    CloseBrowser

Loginpage.Verify Login Error
    [Arguments]    ${expected_error_message}
    [Documentation]    Verify the error message shown on login page.
    Wait Until Element Is Visible    ${login_error_message_div_id}    10s
    ${error_message}=    Get Text    ${login_error_message_div_id}
    ${error_message}=    Remove String    ${error_message}    \n
    #Verify the error message
    Should Be Equal As Strings    ${expected_error_message}    ${error_message}

Login.Login Invalid Template
    [Arguments]    ${username}    ${password}    ${expected_error_message}
    [Documentation]    This can be used as a standalone keyword inside TS.Setup for example
    #Go to the glass host
    Go To    ${host}
    Wait Until Element Is Visible    ${login_username_id}    20s
    Login.Enter Username    ${username}
    Login.Enter Password    ${password}
    Login.Click Submit Button
    Loginpage.Verify Login Error    ${expected_error_message}
    


Failure Log  
  ${Location} =  Get Location
  Capture Page Screenshot
  Log   ${Location}
  


