*** Settings ***
Library           SeleniumLibrary  run_on_failure=Failure Log
Library           OperatingSystem
Library           Collections

*** Variables ***
${browser}  gc

*** Keywords ***
OpenBrowser
    [Arguments]    ${url}=http://www.google.com
    SeleniumLibrary.Open Browser    ${url}    ${browser}  options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window


CloseBrowser
    SeleniumLibrary.Close Browser
    
Failure Log  
  ${Location} =  Get Location
  Capture Page Screenshot
  Log   ${Location}