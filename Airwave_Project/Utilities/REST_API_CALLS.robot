*** Settings ***
Library  Collections
Library  String
Library  RequestsLibrary
Library  OperatingSystem
Library  JSONLibrary

Resource          ../Utilities/CommonFunctions.robot

*** Variables ***
${host}  http://
${geturl1}  /api/rrd_xport.json?start=-7200&stop=now&type=amp_client_count&group_by=Max&url=%2Froot&ds=cc

*** Keywords ***
Get Session1
    ${auth}=  Create List  admin  ampadmin
    Create Session  aw_Session  ${host}  debug=3  verify=false    disable_warnings=1
    ${headers}    Create Dictionary    Accept  */*  Content-Type  */*
    # ${data}=   Create Dictionary   destination=/  credential_0=admin     credential_1=ampadmin  login=Log In
    Set Test Variable  ${data}  destination=%2F&next_action=&credential_0=admin&credential_1=ampadmin&login=Log+In
	Log	 ${host}
    ${resp}=  Post Request  aw_Session  /LOGIN   headers=${headers}  data=${data}
    Log  ${resp.content}
    Should Be Equal As Strings  ${resp.status_code}  302 
    
    

Get Session
    ${auth}=  Create List  admin  ampadmin
    Create Session  aw_Session  ${host}  verify=false  disable_warnings=1
    ${cookie}  Get Cookie From Site  MercuryAuthHandlerCookie_AMPAuth
    ${coolieValue}  Catenate  SEPARATOR==  ${cookie.name}  ${cookie.value}
    ${headers}    Create Dictionary    Accept  */*  Content-Type  application/json
    Set To Dictionary  ${headers}  Cookie  ${coolieValue}
	Log	 ${host}
    ${resp}=  Get Request  aw_Session  ${geturl1}   headers=${headers}
    Should Be Equal As Strings  ${resp.status_code}  200 
    Log  ${resp.content}
    