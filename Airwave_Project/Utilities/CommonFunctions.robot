*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           Common/WebdriverHelper.py
Resource          ../Locators/Homepage.robot


*** Keywords ***
Click
    [Arguments]    ${Locator}
    Wait Until Element Is Visible  ${Locator}  20s
    Set Focus To Element  ${Locator}
    Click Element  ${Locator}
   

Double Click
    [Arguments]    ${Locator}
    Wait Until Element Is Visible  ${Locator}  20s
    Set Focus To Element  ${Locator}
    Double Click Element  ${Locator}
    
Type Text
    [Arguments]    ${Locator}  ${value}
    Run Keyword If  '${value}' != '' or '${value}' != 'None'  Type  ${Locator}  ${value}
    
Type
    [Arguments]    ${Locator}  ${value}
    Focus Element  ${Locator}
    Clear Element Text  ${Locator}
    DOMreadyByWaitTime  3
    Input Text  ${Locator}  ${value}
    
Select Dropdown LabelValue
    [Arguments]    ${Locator}  ${label}
    Wait Until Element Is Visible  ${Locator}  30s
    Click Element  ${Locator}
    DOMreadyByWaitTime  3
    Select From List By Label  ${Locator}  ${label}
     
Select From Dropdown List
    [Arguments]    ${Locator}  ${label}
    Wait Until Element Is Visible  ${Locator}  30s
    Click Element  ${Locator}
    DOMreadyByWaitTime  3
    ${locatorpath}  Catenate  SEPARATOR=  //option[contains(text(),'  ${label}')]
    ${elements}  Get WebElements  ${locatorpath}
    Click Element  @{elements}[-1]   
     
WaitForElementPresent
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}  30s

WaitForPageLoading
    Wait Until Element Is Not Visible  ${loader}  30s
    
Wait For Element And Click
    [Arguments]  ${Element}
    Wait Until Page Contains Element  ${Element}
    Click Element  ${Element}
    DOMreadyByWaitTime  3
    
DOMreadyByWaitTime	 
	[Arguments]   ${Seconds}
	Sleep  ${Seconds}    
    
AssertForElementPresent
    [Arguments]  ${element}
    DOMreadyByWaitTime  3
    Set Focus To Element  ${element}
    Page Should Contain Element  ${element}
    
AssertForElementNotPresent
    [Arguments]  ${element}
    Sleep  3s
    Page Should Not Contain Element  ${element}
    
AssertForTableElementPresent
    [Arguments]  ${value}
    ${locator}  Catenate  SEPARATOR=  //tbody//*[contains(text(),'  ${value}')]
    Wait Until Element Is Visible  ${locator}  30s
    Page Should Contain Element  ${locator}
    
AssertForTableElementNotPresent
    [Arguments]  ${value}
    ${locator}  Catenate  SEPARATOR=  //tbody//*[contains(text(),'  ${value}')]
    Wait Until Element Is Visible  (//tbody)[2]  30s
    Page Should Not Contain Element  ${locator}
    
AssertSpecificTableElementPresent
    [Arguments]  ${Tablelocator}  ${value}
    ${locator}  Catenate  SEPARATOR=  ${Tablelocator}  //tbody//*[text()='  ${value}']
    Wait Until Element Is Visible  ${locator}  30s
    Page Should Contain Element  ${locator}    
    
AssertForTableElementPresentInTheTextbox
    [Arguments]  ${value}
    ${locator}  Catenate  SEPARATOR=  //tbody//input[@value='  ${value}']
    Wait Until Element Is Visible  ${locator}  30s
    Page Should Contain Element  ${locator}        
    
Focus Element
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}  30s
    Set Focus To Element  ${element}
    
Assert The Elements From List
    [Arguments]  @{List}
    :FOR  ${value}  IN  @{List}
    \    
    \    Focus Element  ${value}
    \    AssertForElementPresent  ${value}
    \    
    
Get Elements Count
   [Arguments]  ${locator}
   ${elements}  Get Element Count  ${locator}
   [return]  ${elements}
   
Get Element Text
   [Arguments]  ${locator}
   Wait Until Element Is Visible  ${locator}
   ${value}  Get Text  ${locator}
   [return]  ${value}
   
Get Device Position From Table
   [Arguments]  ${deviceName}
   # ${locator}  Catenate  SEPARATOR=  //div[@class='read_state']/a[@title='${deviceName}']/ancestor::tr/preceding-sibling::tr
   ${element_Count}  Get Element Count  //div[@class='read_state']/a[@title='${deviceName}']/ancestor::tr/preceding-sibling::tr
   Run Keyword If  ${element_Count}==None  ${element_Count}  Set Variable    ${0}
   [return]  ${element_Count}

AssertForDeviceNotPresentInTheTable
   [Arguments]  ${value}
   # ${locator}  Catenate  SEPARATOR=  //tbody//div/a[contains(text(),'${value}')]
   Wait Until Element Is Visible  (//tbody)[2]  30s
   Page Should Not Contain Element  //tbody//div/a[contains(text(),'${value}')] 
    
Click using Javascript
   ## Locator example css=.fontface.icon_edit
   [Arguments]  ${locator}
   # ${script}=    Catenate  SEPARATOR=  document.querySelector('  ${locator}').click()
   Execute JavaScript    document.querySelector('${locator}').click()
   Sleep  10s
   
Get Cookie From Site
    [Arguments]  ${cookieName}=MercuryAuthHandlerCookie_AMPAuth
    ${cookieValue}  Get Cookie  ${cookieName}
    # Set Suite Variable  ${cookieValue}
    [return]  ${cookieValue}
    


                         