*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          ../../Utilities/CommonFunctions.robot
Resource          ../../Keywords/HomePage.robot
Resource          ../../Keywords/Login/LoginFeature.robot
Resource          ../../Locators/system.robot

*** Keywords ***
Check for CPU data
    #${CPU_ele}  Get WebElement  ${system_CPU}
    #${title}=  Get Element Attribute  ${CPU_ele}  innerHTML
    AssertForElementPresent  ${system_CPU}
    ${title}  Get Element Text  ${system_CPU}
    log  ${title}  console=true
    
Check for Memory
    AssertForElementPresent  ${system_memory}
    ${title}  Get Element Text  ${system_memory}
    log  ${title}  console=true
    
Check for Disk
    WaitForElementPresent  ${diskspace_xpath}
    Scroll element into View  ${diskspace_xpath}
    ${count}  Get Elements Count  ${diskspace_xpath}
    Should be true  '${count}'!='0'
    Log  Disk data verified!  console=True
    
Check for I/O Usage
    #Check System memory usage
    Check usage  ${sys_mem_usageheading}  ${sys_mem_usagegraph}
    #Check System swap usage
    Check usage  ${sys_swap_usageheading}  ${sys_swap_usagegraph}
    #Check System network usage
    Check usage  ${sys_network_usageheading}  ${sys_network_usagegraph}
    #Check usage by protocol
    Check usage  ${protocol_usageheading}  ${protocol_usagegraph}
    #Check total disk usage 
    Check usage  ${tot_disk_usageheading}  ${tot_disk_usagegraph}
    

Check usage
    [Arguments]  ${heading}  ${graph}
    WaitForElementPresent  ${heading}
    ${title}  Get Element Text  ${heading}
    WaitForElementPresent  ${graph}
    scroll element into view  ${graph}
    ${count}  Get Elements Count  ${graph}
    Should be true  '${count}'!='0'
    Log  ${title} data verified!  console=True
    
Check AMON RabbitMq and Redis Statistics
    #AMON Statistics
    Check statistics graph  ${AMON_stat_heading}  ${AMON_graph}
    #RabbitMQ Statistics
    Check statistics graph  ${RabbitMQ_stat_heading}  ${RabbitMQ_graph}
    #Redis Statistics
    Check statistics graph  ${Redis_stat_heading}  ${Redis_graph}
       
Check statistics graph
    [Arguments]  ${heading}  ${graph_xpath}
    WaitForElementPresent  ${heading}
    ${Stat_title}  Get Element Text  ${heading}
    ${graphcount}  Get Elements Count  ${graph_xpath}
    :FOR  ${i}  IN RANGE  1  ${graphcount}+1
    \    ${graph_title}  Get Element Text  (${graph_xpath})[${i}]//*[@class="title_heading"]
    \    scroll element into view  (${graph_xpath})[${i}]//a/*
    \    ${count}  Get Elements Count  (${graph_xpath})[${i}]//a/*
    \    Should be true  '${count}'!='0'
    \    log  ${graph_title}  console=True
    Log  ${Stat_title} verified!  console=True
    
Check Database Statistics
    ### Database Table verification ###
    ${Stat_title}  Get Element Text  ${Database_stat_heading}
    WaitForElementPresent  ${Database_table_head}
    ${table_title}  Get Element Text  ${Database_table_head}
    Scroll element into View  ${Database_table}
    ${table_count}  Get Elements Count  ${Database_table}
    Should be true  '${table_count}'!='0'
    Log  ${table_title}  console=True
    ### Database Graph verification ###
    ${graphcount}  Get Elements Count  ${Database_graph_head}
    :FOR  ${i}  IN RANGE  1  ${graphcount}+1
    \    ${graph_title}  Get Element Text  (${Database_graph_head})[${i}]
    \    scroll element into view  (${Database_graph})[${i}]
    \    ${count}  Get Elements Count  (${Database_graph})[${i}]
    \    Should be true  '${count}'!='0'
    \    log  ${graph_title}  console=True
    Log  ${Stat_title} verified!  console=True
    
    
    
*** Comments ***
Check System memory usage
    WaitForElementPresent  ${sys_mem_usageheading}
    ${title}  Get Element Text  ${sys_mem_usageheading}
    WaitForElementPresent  ${sys_mem_usagegraph}
    scroll element into view  ${sys_mem_usagegraph}
    ${count}  Get Elements Count  ${sys_mem_usagegraph}
    Should be true  '${count}'!='0'
    Log  ${title} data verified!  console=True
    
Check System swap usage
    WaitForElementPresent  ${sys_swap_usageheading}
    ${title}  Get Element Text  ${sys_swap_usageheading}
    WaitForElementPresent  ${sys_swap_usagegraph}
    scroll element into view  ${sys_swap_usagegraph}
    ${count}  Get Elements Count  ${sys_swap_usagegraph}
    Should be true  '${count}'!='0'
    Log  ${title} data verified!  console=True
    
Check System network usage
    WaitForElementPresent  ${sys_network_usageheading}
    ${title}  Get Element Text  ${sys_network_usageheading}
    WaitForElementPresent  ${sys_network_usagegraph}
    scroll element into view  ${sys_network_usagegraph}
    ${count}  Get Elements Count  ${sys_network_usagegraph}
    Should be true  '${count}'!='0'
    Log  ${title} data verified!  console=True
    
Check usage by protocol
    WaitForElementPresent  ${protocol_usageheading}
    ${title}  Get Element Text  ${protocol_usageheading}
    WaitForElementPresent  ${protocol_usagegraph}
    scroll element into view  ${protocol_usagegraph}
    ${count}  Get Elements Count  ${protocol_usagegraph}
    Should be true  '${count}'!='0'
    Log  ${title} data verified!  console=True
    
Check total disk usage
    WaitForElementPresent  ${tot_disk__usageheading}
    ${title}  Get Element Text  ${tot_disk__usageheading}
    WaitForElementPresent  ${tot_disk__usagegraph}
    scroll element into view  ${tot_disk__usagegraph}
    ${count}  Get Elements Count  ${tot_disk__usagegraph}
    Should be true  '${count}'!='0'
    Log  ${title} data verified!  console=True
    
       