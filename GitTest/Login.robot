*** Settings ***
Library           SeleniumLibrary
Library           String

*** Test Cases ***
Login To Chrome
    Open browser  http://www.google.com  gc
    Go To  https://github.com/
    close browser
    Log  Browser Launch Successful!  console=True