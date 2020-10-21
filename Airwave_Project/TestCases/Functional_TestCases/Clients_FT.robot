*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/FunctionalTC_keywords/ClientsFT_keywords.robot
Resource          ../../Locators/ClientsFT.robot
Resource          ../../Keywords/FunctionalTC_keywords/DevicesFT_keywords.robot
Resource          ../../Keywords/FunctionalTC_keywords/CleanupFT_keywords.robot


*** Test Cases ***
Verify the network diagram for Client, network, AP, Controller
    [Documentation]  Verify the network diagram for Client, network, AP, Controller->Client Diagnostic Page
    ...    
    [Tags]  Case 25
    Navigate To Clients Page
    Navigate To Clients Connected Page  
    Click MAC address of Connected Client
    ${Wireless}  ${AP}  ${controller}  Get Client, AP, controller name in Client Detail Page
    Verify the network diagram in Client Diagnostic Page  ${Wireless}  ${AP}  ${controller}
    

Verify Client data on Clients Diagnostic Page
    [Documentation]  Client data on Clients->Diagnostic Page
    ...    
    [Tags]  Case 26
    Navigate To Clients Page
    Navigate To Clients Connected Page  
    Click MAC address of Connected Client
    Get Device Info on Clients Diagnostic Page
    Get current association on Clients Diagnostic Page
    Verify Quality Data
    
Verify Visual RF image in Clients Diagnostic Page
    [Documentation]  Visual RF image on Clients connected->Client Diagnostic Page
    ...    
    [Tags]  Case 27
    Enable Visual RF engine
    DOMReadyByWaitTime  60
    Navigate To Clients Page
    Navigate To Clients Connected Page  
    Click MAC address of Connected Client
    Check Visual RF Data in Client Diagnostic Page
    
Verify Usage, Signal, SNR and Noise graphs in Clients Diagnostic Page
    [Documentation]  Check graphs Usage, Signal and Noise and SNR are displayed
    ...    
    [Tags]  Case 28
    Navigate To Clients Page
    Navigate To Clients Connected Page  
    Click MAC address of Connected Client
    Check Usage, Signal and Noise and SNR graphs in Clients Diagnostic Page
    

Verify Client data on Clients Detail Page
    [Documentation]  Client data on Clients -> Client Detail Page
    ...    
    [Tags]  Case 30
    Navigate To Clients Page
    Navigate To Clients Connected Page  
    Click MAC address of Connected Client
    Get Device Info on Clients Detail Page
    Get current association on Clients Detail Page
    


Verify Usage Chart in Client Detail Page
    [Documentation]  Usage chart on Clients -> Client Detail Page
    ...    
    [Tags]  Case 31
    Navigate To Clients Page
    Navigate To Clients Connected Page  
    Click MAC address of Connected Client
    Get the values from Usage chart for 2h,1d,1w
    
Verify Signal and Noise Chart in Client Detail Page
    [Documentation]  Signal and Noise chart on Clients -> Client Detail Page
    ...    
    [Tags]  Case 32
    Navigate To Clients Page
    Navigate To Clients Connected Page  
    Click MAC address of Connected Client
    Get the values from Signal and Noise chart for 2h,1d,1w
    
Verify Visual RF image in Clients Detail Page
    [Documentation]  Visual RF image on Clients connected->Client Details Page
    ...    
    [Tags]  Case 33
    Navigate To Clients Page
    Navigate To Clients Connected Page  
    Click MAC address of Connected Client
    Check Visual RF Data in Client Detail Page
    Disable RF engine

   
Goodput charts in Client Details Page
    [Documentation]  Get the values from Goodput charts and compare with DB
    ...    
    [Tags]  Case 90
    Navigate To Clients Page
    Navigate To Clients Connected Page
    Click MAC address of Connected Client
    Get the values from Goodput chart
    
Speed charts in Client Details Page
    [Documentation]  Get the values from Speed charts and compare with DB
    ...    
    [Tags]  Case 91
    Navigate To Clients Page
    Navigate To Clients Connected Page
    Click MAC address of Connected Client
    Get the values from Speed chart
    
Health charts in Client Details Page 
    [Documentation]  Get the values from Speed charts and compare with DB
    ...    
    [Tags]  Case 92
    Navigate To Clients Page
    Navigate To Clients Connected Page
    Click MAC address of Connected Client
    Get the values from Health chart
    
    


*** Comments ***


    




    
    


