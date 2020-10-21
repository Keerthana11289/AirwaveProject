from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
from selenium.webdriver.firefox.webdriver import WebDriver
from selenium.webdriver.chrome.webdriver import WebDriver
from selenium.webdriver.ie.webdriver import WebDriver
from selenium.webdriver.remote.webelement import WebElement
from selenium.webdriver.support.ui import Select
from selenium.webdriver import ActionChains
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.alert import Alert
from selenium.common.exceptions import StaleElementReferenceException,\
    NoSuchElementException
import collections
import time
import random
from appium.webdriver import webelement
import datetime
from datetime import datetime
from datetime import datetime, timedelta

import pytz
import re
import ast
import paramiko
import json
import os
from numpy.distutils.fcompiler import none


class WebdriverHelper():
    """Library with keywords related to webdriver actions which cannot be done or are too cumbersome to be done using SeleniumLibrary keywords.
    """
    
    WebDriver = None
    seleniumlib = None
    row_class = "row"
    class_attribute = "class"
    div_tag = "div"
    error_tag = "error"
    span_tag = "span"
    cmd = 'sudo -s'
    clientCountQuery = 'db -c "select count(*) from client ;"'
    clientUsageQuery = 'db -c "select count(*) from client ;"'

    
    def _init_seleniumlib(self):
        self.seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')

    def _get_webdriver_instance(self):
        driver = self.seleniumlib.driver
        return driver 

    def _element_find(self , locator, first_only, required):
        return self.seleniumlib._element_find(locator, first_only, required)

    def webdriverlib_helper_init(self):
        """ Initializes the WebdriverHelper
        """
        
        self._init_seleniumlib()
        self.WebDriver = self._get_webdriver_instance()
        
    def get_css_property(self , webelement , css_property):
        """ Gets the CSS property of given webelement.
        """
        #element = self._element_find(css_locator, True, True)
        css_property_value = webelement.value_of_css_property(css_property)
        print "Property '%s' for '%s' is %s" % (css_property, webelement, css_property_value)
        return css_property_value
    
    def get_element_children_by_css_selector(self, webelement, child_locator ):
        """ Returns webelement children for specified locator
        """
        return webelement.find_elements_by_css_selector(child_locator)
    
    def get_element_children_by_class_name(self, webelement, child_locator ):
        """ Returns webelement children for specified locator
        """
        return webelement.find_elements_by_class_name(child_locator)
    
    def get_element_children_by_tag(self, webelement, tag ):
        """ Returns webelement children for specified locator
        """
        return webelement.find_elements_by_tag_name(tag)
 
    def hover_over_element(self, element):
        """ Simulates Mouse over ( hover) over a webelement
        """
        hov = ActionChains(self.WebDriver).move_to_element(element)
        hov.perform()   
        
    def click_element_by_javascript(self, element_to_click):
        """ Javascript click of a webelement using javascript click
        """
        try:
            self.WebDriver.execute_script("return arguments[0].click();", element_to_click)
            time.sleep(1)
        except (StaleElementReferenceException): 
                    print "got the StaleElementReferenceException after clicking using Javascript. Ignoring"
                    pass
        
    def simulate_keyup_event(self, element, text ):
        """Try-out Method for search widget failures on Firefox, not intended to use by any other tests - WIP
        """
        #ActionChains(self.WebDriver).key_down(Keys.SHIFT, element).send_keys( ")", element).key_up(Keys.SHIFT, element).perform()
        ActionChains(self.WebDriver).key_down(Keys.SHIFT, element).send_keys_to_element(element, text).perform()
        time.sleep(1)
        ActionChains(self.WebDriver).key_up(Keys.SHIFT, element).perform()
        
    def __init__get_Channel(self, hostname, username, password):
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        self.channel = ssh.invoke_shell()
        print('Channel Invoked')
        # print(self.cmd)
        self.channel.send(self.cmd + '\n')
        time.sleep(3)
        out = self.channel.recv(9999)
        run_status = out.decode("ascii")

 #   def get_client_count(self, hostname, username, password):
 #       self.__init__get_Channel(hostname, username, password)
 #       time.sleep(1)
 #       self.channel.send(self.clientCountQuery + '\n')
 #       time.sleep(3)
 #       out = self.channel.recv(9999)
 #       row_Count = out.split('\n')[-4].strip()
 #       return [str(row_Count)]
        
    def get_client_count(self, hostname, username, password,condition):
        self.__init__get_Channel(hostname, username, password)
        time.sleep(1)
        if 'condition'=='By Operating System':
        	self.channel.send(self.clientCountQuery + '\n')
        	time.sleep(3)
        elif 'condition'=='By Device Type':
        	self.channel.send(self.clientCountQuery + '\n')
        	time.sleep(3)
        elif 'condition'=='By SSID':
        	self.channel.send(self.clientCountQuery + '\n')
        	time.sleep(3)
        elif 'condition'=='By WLAN vendor':
        	self.channel.send(self.clientCountQuery + '\n')
        	time.sleep(3)
        else:
        	self.channel.send(self.clientCountQuery + '\n')
        	time.sleep(3)				
        self.channel.send(self.clientCountQuery + '\n')
        time.sleep(3)
        out = self.channel.recv(9999)
        row_Count = out.split('\n')[-4].strip()
        return [str(row_Count)]    
        
    def get_client_usage(self, hostname, username, password):
        self.__init__get_Channel(hostname, username, password)
        time.sleep(1)
        self.channel.send(self.clientUsageQuery + '\n')
        time.sleep(3)
        out = self.channel.recv(9999)
        row_Count = out.split('\n')[-4].strip()
        return [str(row_Count)]    

    def scroll_by_javascript(self, element_to_scroll):
        """ Scroll to webelement using javascript
        """
        try:
            self.WebDriver.execute_script("return arguments[0].scrollIntoView(true);", element_to_scroll)
            time.sleep(1)
        except (StaleElementReferenceException): 
                    print "got the StaleElementReferenceException "
                    pass
    
    
    
    
    
    def getcountfromCLI(self,hostname, username, password,DB,cmd):
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        channel.send('8' + '\n')
        time.sleep(3)
        channel.send('1' + '\n')
        time.sleep(3)
        channel.send('2' + '\n')
        time.sleep(3)
        channel.send(DB + '\n')
        time.sleep(3)
        channel.send(cmd + '\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            for line in run_status.split('\n'):
                if str(line).find("rows")!=-1:
                    val=str(line).strip()
                    row=val.split()
                    rowcount=row[0].strip('(')
                    return(rowcount)
            return(1)      
    
    
    def GetCurrentLoginInfo(self,hostname, username, password):
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        for line in run_status.split('\n'):
            if str(line).find("still logged in")!=-1:
                val=str(line).split()
                Month=val[4].strip()
                day=val[5].strip()
                t=val[6].strip()
                return(Month,day,t)
        return(1)      
    
    def GetLastLoginInfo(self,hostname, username, password):
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        for line in run_status.split('\n'):
            if str(line).find("Last login:")!=-1:
                print(str(line))
                val=str(line).split()
                Month=val[3].strip()
                Day=val[4].strip()
                year=val[6].strip()
                fullt= val[5].split(":")
                t=fullt[0].strip()
                return(Month,Day,year,t)
        return(1)
                
                
            
        
    
    def EnableClientTraps(self,hostname, username, password,enablepwd,communitycmd,serverhostname):
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send('en' + '\n')
        time.sleep(3)
        channel.send(enablepwd + '\n')
        time.sleep(3)
        channel.send(communitycmd + '\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            val=0
            result=0
            l=[]
            for line in run_status.split('\n'):
                print(str(line))
                val=val+1
                l.append(str(line))
                
            list=[]    
            
            for i in range(val):
                if str(l[i]).find("COMMUNITY")!=-1:
                    print(str(l[i+2]))
                    value=str(l[i+2]).split()
                    comm=value[0].strip()
                    print(str(comm))
                
            cmd1 = "configure t"   
            print(str(cmd1))     
            channel.send(cmd1 + '\n')  
            time.sleep(3)
            cmd2 = "snmp-server host " + serverhostname + " version 2c " + comm + " udp-port 162"
            print(str(cmd2))
            channel.send(cmd2 + '\n') 
            time.sleep(3)
            result=comm
            
            return(result)
        
    
            
        
        
    def Getfirmwaredetails(self,hostname, username, password,imagecmd):
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send(imagecmd + '\n')
        time.sleep(3)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            firmware=0
            Bnum=0
            for line in run_status.split('\n'):
                if str(line).find("Software Version")!=-1:
                    print(str(line))
                    val=str(line).split()
                    firmware=val[4].strip()
                    break
                    
            for line in run_status.split('\n'):
                if str(line).find("Build number")!=-1:
                    print(str(line))
                    val=str(line).split(':')
                    Bnum=val[1].strip() 
                    break  
            str1=[firmware,Bnum] 
            result="_".join(str1) 
            return(result)
        
    def GetControllerType(self,hostname, username, password,typecmd):
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send(typecmd + '\n')
        time.sleep(10)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            model1 = 0 
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("MODEL:")!=-1:
                    print(str(line))
                    val=str(line).split()
                    model=val[2].strip(',')
                    model1=model.strip(')')
                    break
            return(model1)
            
                
    def GetvlanInfofromCLI(self,hostname, username, password,enablepwd,VLANcmd,VLANname):
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send('en' + '\n')
        time.sleep(3)
        channel.send(enablepwd + '\n')
        time.sleep(3)
        channel.send(VLANcmd + '\n')
        time.sleep(5)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        for line in run_status.split('\n'):
            if str(l[i]).find(VLANname)!=-1:
                print(str(line))
                val=str(line).split()
                result=val[1].strip()
                return(result)
        return(1)
                
                
    def GetLicenseInfo(self,hostname, username, password):
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send("show license" + '\n')
        time.sleep(3)
        channel.send('\x20')
        time.sleep(3)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        for line in run_status.split('\n'):
            print(str(line))
            if str(line).find("License Entries:")!=-1:
                print(str(line))
                val=str(line).split(':')                                   
                LicVal=val[1].strip()
                return(LicVal)
        return(1)      
                
            
    def GetLoginOptions(self,hostname, username, password):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            user=[]
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find(">")!=-1:
                    val=str(line).replace('>',"")
                    val=val.strip()
                    val1=val.split()
                   # print(val1)
                   # option=val[1].rsplit('>',1)
                    opt=val1[1].strip()
                    print(opt)
                    user.append(opt)
            return(user)
        
    def Quitoption(self,hostname, username, password):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send("q" + '\n')
        time.sleep(10)
        channel.send('1'+'\n')
        time.sleep(3)
        
        
    def Controlquitoption(self,hostname, username, password):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send("\x1A")
        time.sleep(10)
        channel.send('1'+'\n')
        time.sleep(3)
        
    def getselectedbackmenuoptions(self,hostname, username, password,opt):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send('1'+'\n')
        time.sleep(3)
        channel.send(opt+'\n')
        time.sleep(3)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            user=[]
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find(">")!=-1:
                    val=str(line).replace('>',"")
                    val=val.strip()
                    val1=val.split()
                   # print(val1)
                    opt=val1[1].strip()
                    print(opt)
                    user.append(opt)
            return(user)
                 
    def GetCanceloptions(self,hostname, username, password):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send('4'+'\n')
        time.sleep(3)
        channel.send('7'+'\n')
        time.sleep(3)
        channel.send('c'+'\n')
        time.sleep(3)
        channel.send('\x0D')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            user=[]
            c=0
            for line in run_status.split('\n'):
                print(str(line))
            c=run_status.count('7  Module Key')
            print(c)
                
            return(c)
                
        
    def Get0Canceloptions(self,hostname, username, password):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send('3'+'\n')
        time.sleep(3)
        channel.send('1'+'\n')
        time.sleep(3)
        channel.send('0'+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            c=0
            for line in run_status.split('\n'):
                print(str(line))
            c=run_status.count('1  Configure Network Settings')
            print(c)
            return(c)
            
    def GetSuccessCode(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)
        channel.send('s'+'\n')
        time.sleep(3)
        channel.send('r'+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=1
            returncode=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('Return code:')!=-1:
                    print(str(line))
                    val=str(line).split(':')
                    output=val[1].strip()
                    
                if str(line).find('return code:')!=-1:
                    print(str(line))
                    val=str(line).split()
                    returncode=val[0].strip()
            list=[output,returncode]
            return(list)
        
    def GetErrorCode(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(2)
        channel.send("\x03")
        time.sleep(2)
        channel.send('s'+'\n')
        time.sleep(3)
        channel.send('r'+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=1
            returncode=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('Return code:')!=-1:
                    print(str(line))
                    val=str(line).split(':')
                    output=val[1].strip()
                    
                if str(line).find('return code:')!=-1:
                    print(str(line))
                    val=str(line).split()
                    returncode=val[0].strip(',')
                    
            list=[output,returncode]
            return(list)

    def GetCntrlCoptions(self,hostname, username, password):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send('5'+'\n')
        time.sleep(3)
        channel.send('5'+'\n')
        time.sleep(3)
        channel.send("\x03")
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            c=0
            for line in run_status.split('\n'):
                print(str(line))
            c=run_status.count('AirWave Management Platform')
            print(c)
            return(c)
        
    def CheckModuleKey(self,hostname, username, password,opt1,opt2,opt3):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(2)
        channel.send(opt3+'\n')
        time.sleep(20)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('END PGP PUBLIC KEY BLOCK')!=-1:
                    print(str(line))
                    return(1)
                    
            return(output)
                    
    def GetModuleKey(self,hostname, username, password,opt1,opt2,opt3):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(2)
        channel.send(opt3+'\n')
        time.sleep(10)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('Module key written to')!=-1:
                    print(str(line))
                    result=str(line).split()
                    key=result[-1].strip()
                    return(key)
            return(output)
                    
    def VerifySavedModuleKey(self,hostname, username, password,opt1,opt2,key):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find(key)!=-1:
                    print(str(line))
                    return(1)
            return(output)
        
    def ResetUIAccess(self,hostname, username, password,opt1,opt2,opt3,confirmation):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(2)
        channel.send(opt3+'\n')
        time.sleep(5)
        channel.send(confirmation+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('Resetting the password')!=-1:
                    print(str(line))
                    result=str(line).split()
                    output=result[-1].strip('"')
            return(output)
                
    def ResetCLIAccess(self,hostname, username, password,opt1,opt2,opt3):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(2)
        channel.send(opt3+'\n')
        time.sleep(5)
        channel.send("\x03")
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('Changing password')!=-1:
                    print(str(line))
                    output=1
            return(output)
        
    def RestartAMP(self,hostname, username, password,opt1,opt2,confirmation):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(2)
        channel.send(confirmation+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('Running Restart AMP')!=-1:
                    print(str(line))
                    output=1
            return(output)
                    
    def RebootAMP(self,hostname, username, password,opt1,opt2,confirmation):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(2)
        channel.send(confirmation+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('Running Reboot System')!=-1:
                    print(str(line))
                    output=1
            return(output)
        
    def ShutdownAMP(self,hostname, username, password,opt1,opt2,confirmation):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(2)
        channel.send(confirmation+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('Running Shutdown System')!=-1:
                    print(str(line))
                    output=1
            return(output)
        
    def ModifyNetwork(self,hostname, username, password,opt1,opt2,opt3,dupserver):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(10)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        output=0
        dnsserver=0
        for line in run_status.split('\n'):
            print(str(line))
            if str(line).find('Secondary DNS Server')!=-1:
                print(str(line))
                val= str(line).split(":")
                dnsserver=val[1].strip()
        channel.send(opt3+'\n')
        time.sleep(3) 
        channel.send(dupserver+'\n')
        time.sleep(3) 
        channel.send('9'+'\n')
        time.sleep(10)
        channel.send('y'+'\n')
        time.sleep(20)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        for line in run_status.split('\n'):
            print(str(line))
            if str(line).find('Restarting network (via systemctl):  [  OK  ]')!=-1:
                print(str(line))
                print('Dns server changed')

        channel.send(opt2+'\n')
        time.sleep(5)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        search = 'Secondary DNS Server      : ' + dupserver
        print(search)
        for line in run_status.split('\n'):
            print(str(line))
            if str(line).find(search)!=-1:
                    print(str(line))
                    output = 1
        
        return(output,dnsserver)
             
    def InternalNetwork(self,hostname, username, password,opt1):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('Configure Network Settings')!=-1:
                    print(str(line))
                    output=1
            return(output)
        
    def CustomNetwork(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('eth0')!=-1:
                    print(str(line))
                    output=1
            return(output)
        
    def UpdateTime(self,hostname, username, password,opt1,opt2,opt3,opt4,opt5):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(opt3+'\n')
        time.sleep(3)
        channel.send(opt4+'\n')
        time.sleep(3)
        channel.send(opt5+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('Timezone successfully changed')!=-1:
                    print(str(line))
                    output=1
            return(output)
        
    def ShowTechSupport(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(300)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('Performance Profile')!=-1:
                    print(str(line))
                    output=output+1
                if str(line).find('SERVER PROFILE')!=-1:
                    print(str(line))
                    output=output+1
                if str(line).find('AMP CONFIG SUMMARY')!=-1:
                    print(str(line))
                    output=output+1
                if str(line).find('DEVICE SUMMARY')!=-1:
                    print(str(line))
                    output=output+1
            return(output)
                
    def CreateBackup(self,hostname, username, password,opt1,opt2,opt3,confirmation):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(opt3+'\n')
        time.sleep(5)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        backup=0
        for line in run_status.split('\n'):
            print(str(line))
            if str(line).find('backup file will be named')!=-1:
                print(str(line))
                val=str(line).split()
                backup=val[-1].strip('.')
        channel.send(confirmation+'\n')
        time.sleep(300)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('Hit enter')!=-1:
                    print(str(line))
                    return(backup)
            
    
    def VerifyBackup(self,hostname, username, password,opt1,opt2,backup):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find(backup)!=-1:
                    print(str(line))
                    output=1
            return(output)
                    
    def VerifyRestore(self,hostname, username, password,opt1,opt2,opt3,backup):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(opt3+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find(backup)!=-1:
                    print(str(line))
                    
                    output=1
            return(output)
        
    def GetDeleteBackup(self,hostname, username, password,opt1,opt2,backup):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(5)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        sno=0
        for line in run_status.split('\n'):
            print(str(line))
            if str(line).find(backup)!=-1:
                print(str(line))
                val=str(line).strip()
                val1=val.split()
                sno=val1[0].strip()
        
        return(sno)
    
    def getAdmin(self,hostname, username, password,opt1,opt2,backup):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(5)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        sno=0
        list=run_status.split('\n')
        for line in list[::-1]:
            print(str(line))
            if str(line).find(backup)!=-1:
                print(str(line))
                val=str(line).strip()
                val1=val.split()
                sno=val1[0].strip()
                break
        
        return(sno)
    
    
    def GetCertificateno(self,hostname, username, password,opt1,opt2,opt3,file):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(5)
        channel.send(opt3 +'\n')
        time.sleep(5)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        sno=0
        for line in run_status.split('\n'):
            print(str(line))
            if str(line).find(file)!=-1:
                print(str(line))
                val=str(line).strip()
                val1=val.split()
                sno=val1[0].strip()
        return(sno)
        
    def DeleteBackup(self,hostname, username, password,opt1,opt2,number,cnfrm):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(10)
        channel.send(number +'\n')
        time.sleep(5)
        channel.send(cnfrm + '\n')
        time.sleep(10) 
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        output=1
        for line in run_status.split('\n'):
            print(str(line))
        return(output)
             
    def VerifyDeleteBackup(self,hostname, username, password,opt1,opt2,Backup):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(10)   
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=1
            for line in run_status.split('\n'):
                print(str(line))
            output=run_status.count(Backup)
            return(output)
        
    def Nightlyrecentdate(self,hostname, username, password,opt1,opt2,opt3,file):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(3)
        channel.send(opt3 +'\n')
        time.sleep(10)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            timestamps=[]
            output=0
            sno=0
            x=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find(file)!=-1:
                    print(str(line))
                    val=str(line).strip()
                    val1=val.split()
                    timestamps.append(val1[4])
            x=len(timestamps)
            if x==0:
                output=0
            elif x==1:
                output=timestamps[0].strip()
            else:
                dates=[datetime.strptime(ts, "%Y-%m-%d") for ts in timestamps]
                dates.sort(reverse=True)
                sorteddates = [datetime.strftime(ts, "%Y-%m-%d") for ts in dates]
                print('Descending:',sorteddates)
                output=sorteddates[0].strip()
            return(output)   
         
    def VerifyNightlyRestore(self,hostname, username, password,opt1,opt2,opt3,backup,date1):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(opt3+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            sno=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find(backup)!=-1 and str(line).find(date1)!=-1:
                    print(str(line))
                    val=str(line).strip()
                    val1=val.split()
                    sno=val1[0].strip()
            return(sno)
    
    def RestoreNightlydata(self,hostname, username, password,opt1,opt2,opt3,sno,cnfrm):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(opt3+'\n')
        time.sleep(5)
        channel.send(sno+'\n')
        time.sleep(5)
        channel.send(cnfrm+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                
            return(output)
        
    def Nightlyoldestdate(self,hostname, username, password,opt1,opt2,file):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(10)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            timestamps=[]
            output=0
            sno=0
            x=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find(file)!=-1:
                    print(str(line))
                    val=str(line).strip()
                    val1=val.split()
                    timestamps.append(val1[4])
            x=len(timestamps)
            if x==0:
                output=0
            elif x==1:
                output=timestamps[0].strip()
            else:
                dates=[datetime.strptime(ts, "%Y-%m-%d") for ts in timestamps]
                dates.sort()
                sorteddates = [datetime.strftime(ts, "%Y-%m-%d") for ts in dates]
                print('Ascending:',sorteddates)
                output=sorteddates[0].strip()
            return(output)   
         
    def VerifyNightlyDelete(self,hostname, username, password,opt1,opt2,backup,date1):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            sno=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find(backup)!=-1 and str(line).find(date1)!=-1:
                    print(str(line))
                    val=str(line).strip()
                    val1=val.split()
                    sno=val1[0].strip()
                    
            return(sno)
        
    def CheckforUser(self,hostname, username, password,opt1):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send(opt1+'\n')
        time.sleep(3)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("Add Support User")!=-1:
                    print(str(line))
                    output=1
            return(output)
        
    def AddUser(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send('\x0D')
        time.sleep(10)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("END PGP MESSAGE")!=-1:
                    print(str(line))
                    output=1
            return(output)
        
    def DeleteUser(self,hostname, username, password,opt1,opt2,cnfrm):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(cnfrm +'\n')
        time.sleep(3)
        channel.send('\x0D')
        time.sleep(10)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("Add Support User")!=-1:
                    print(str(line))
                    output=1
            return(output)
        
    def ShowsupportafterDeletion(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("There is no awsupport.gpg file")!=-1:
                    print(str(line))
                    output=1
            return(output)
        
    def Startconnection(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("Running Start Support Connection")!=-1:
                    print(str(line))
                    output=1
            return(output)
        
    def ShowsupportwithUser(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("END PGP MESSAGE")!=-1:
                    print(str(line))
                    output=1
            return(output)
        
    def GetHelpCmnds(self,hostname, username, password,opt1,opt2,cmd,list):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)
        channel.send(cmd +'\n')
        time.sleep(10)
        channel.send('q' +'\n')
        time.sleep(3)
        while(1):
            out = channel.recv(100000)
            run_status = out.decode("ascii")
            print(list)
            cmndlist=[]
            for line in run_status.split('\n'):
                str(line).strip()
                print(str(line))
                for x in list:
                  #  cmnd = x + ' -'
                    if str(line).find(x)!=-1:
                        print(str(line))
                        val=str(line).strip()
                        cmndlist.append(val)
            return(cmndlist)
        
    def VerifyUnixcommands(self,hostname, username, password,opt1,opt2,list):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)
        print(list)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            todaydate = '0'
            amphostname='0'
            length=0
            l=[]
            for line in run_status.split('\n'):
               # print(str(line))
                length=length+1
                l.append(str(line))  
            print("len",length) 
            for i in range(length):
                if str(l[i]).find("still logged in")!=-1:
                    print(str(l[i]))
                    val=str(l[i]).split(None,3)
                    val1=val[3].rsplit(None,4)
                   # print("val:",val1)
                    todaydate =str(val1[0])
                if str(l[i]).find("AirWave Management Platform")!=-1:
                    print(str(l[i]))
                    val=str(l[i]).split()
                    amphostname = val[-1].strip()
            print("hostname:" ,amphostname)
            print("today date:",todaydate)
            
            output=0
            for x in list:
                x=str(x)
                print(x)
                if x == 'date':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    l=[]
                    len=0
                    for line in run_status.split('\n'):
                        print(str(line))
                        len=len+1
                        l.append(str(line))  
                        
                    for i in range(len):
                        if str(l[i]).find("date")!=-1 and str(l[i+1]).find(todaydate)!=-1:
                            print(str(l[i+1]))
                            output = output+1
                            
                if x == 'ls':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("bytes")!=-1:
                            print(str(line))
                            output = output+1
                            break
                
                if x == 'top':
                    channel.send(x + '\n')
                    time.sleep(5)
                    channel.send("\x03")
                    time.sleep(3)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("PID USER")!=-1:
                            print(str(line))
                            output = output+1
                    
                if x == 'df -h':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("Filesystem")!=-1:
                            print(str(line))
                            output = output+1
                
                if x == 'hostname':
                    channel.send(x + '\n')
                    time.sleep(10)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    
                    len=0
                    l=[]
                    for line in run_status.split('\n'):
                        print(str(line))
                        len=len+1
                        l.append(str(line))   
                    
                    for i in range(len):
                        if str(l[i]).find("hostname")!=-1 and str(l[i+1]).find(amphostname)!=-1:
                            print(str(l[i+1]))
                            output = output+1
                
                if x == 'rm':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("'rm' is not allowed")!=-1:
                            print(str(line))
                            output = output+1
                            
                if x == 'iptables':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("'iptables' is not allowed")!=-1:
                            print(str(line))
                            output = output+1
                    
            return(output)
                        
                
    def VerifyAmpAliascommands(self,hostname, username, password,opt1,opt2,list):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)
        print(list)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            ampversion = '0'
            for line in run_status.split('\n'):
                if str(line).find("AirWave Management Platform")!=-1:
                    print(str(line))
                    val=str(line).split()
                    ampversion =val[-3].strip()
            print("ampversion:", ampversion)
            output=0
            for x in list:
                x=str(x)
                print(x)
                if x == 'daemons':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("PID")!=-1:
                            print(str(line))
                            output = output+1
                            
                if x == 'wd':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    co=0
                    for line in run_status.split('\n'):
                        print(str(line).strip())
                        if str(line).find("Every 1.0s")!=-1:
                            print("Daemon every 1.0s found: ",str(line).strip())
                            co=1
                            output = output+1
                            break
                    if co==1:
                        channel.send("\x03")
                        time.sleep(3)
                        print("Cntrl+C sent!")
                        
                if x == 'psg':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("'psg' is not allowed")!=-1:
                            print(str(line))
                            output = output+1
                            
                if x == 'pss':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("'pss' is not allowed")!=-1:
                            print(str(line))
                            output = output+1
                    
                if x == 'show_tech_support':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    channel.send('q' + '\n')
                    time.sleep(20)
                    c=0
                    while(c==0):
                        out = channel.recv(9999)
                        run_status = out.decode("ascii")
                        for line in run_status.split('\n'):
                            print(str(line))
                            if str(line).find("Performance Profile")!=-1:
                                print(str(line))
                                output = output+1
                                c=1
                
                if x == 'dbsize':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("KiB")!=-1:
                            print(str(line))
                            output = output+1
                            break
                
                if x == 'crr':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("release")!=-1:
                            print(str(line))
                            output = output+1
                
                if x == 'amp_version':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    len=0
                    l=[]
                    for line in run_status.split('\n'):
                        print(str(line))
                        len=len+1
                        l.append(str(line))   
                    for i in range(len):
                        if str(l[i]).find("amp_version")!=-1 and str(l[i+1]).find(ampversion)!=-1:
                            print(str(l[i+1]))
                            output = output+1
                            
                if x == 'git diff':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    len=0
                    l=[]
                    for line in run_status.split('\n'):
                      #  print(str(line))
                        len=len+1
                        l.append(str(line))   
                    for i in range(len):
                        if str(l[i]).find("Patches that are present:")!=-1 and str(l[i+1]).find("$")==-1:
                            print(str(l[i+1]))
                            channel.send('q' + '\n')
                            time.sleep(5)
                            print("Q sent")
                    for i in range(len):
                        if str(l[i]).find("git diff")!=-1 and str(l[i+1])!= " ":
                            print(str(l[i+1]))
                            output = output+1
                            break
                            
                    
                            
                if x =='remove_visualrf_cache':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("Cache removed")!=-1:
                            print(str(line))
                            output = output+1
                
                
                            
            return(output)
            
    def VerifyUpgrade(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)
        channel.send("\x03")
        time.sleep(2)
        channel.send('\x0D')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("Which version?")!=-1 and str(line).find("Fatal Error:")!=-1:
                    print(str(line))
                    output=1
            return(output)
                    
    def VerifyAmpBackupCommand(self,hostname, username, password,opt1,opt2,cmd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)  
        channel.send(cmd+'\n')
        time.sleep(350)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find('finished tar')!=-1:
                    print(str(line))
                    return(1)
            
    def flexiblitycmd(self,hostname, username, password,opt1,opt2,cmd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)  
        channel.send(cmd+'\n')
        time.sleep(5)
        while(1):
            len=0
            l=[]
            output=0
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            for line in run_status.split('\n'):
                print(str(line))
                len=len+1
                l.append(str(line))   
                    
            for i in range(len):
                if str(l[i]).find("(END)")!=-1 and str(l[i-1]).find(cmd)!=-1:
                    print(str(l[i-1]))
                    output = 1
            return(output)
                            
    def Networkcmd(self,hostname, username, password,opt1,opt2,cmd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)  
        channel.send(cmd+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("IPv4 Address")!=-1:
                    print(str(line))
                    val=str(line).split(':')
                    output = val[1].strip()
            return(output)
        
    def escapeTorootcmd(self,hostname, username, password,opt1,opt2,cmd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)  
        channel.send(cmd+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("is not allowed")!=-1:
                    print(str(line))
                    output =1
            return(output)

    def Stigcmd(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(40)  
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("Hit return")!=-1:
                    print(str(line))
                    output =1
            return(output)
    
    def ShellTimeout(self,hostname, username, password):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(700)
        channel.send('1' +'\n')
        time.sleep(3)
            
    def CntrlZtimeout(self,hostname, username, password,opt1, opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)
        channel.send("\x1A")
        time.sleep(3)
        channel.send("\x1A")
        time.sleep(10)
        channel.send('1' +'\n')
        time.sleep(3)
        
    def GetCntrlcOptionsCommand(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(3)
        channel.send("\x03")
        time.sleep(5)
        channel.send("\x0D")
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            c=0
            for line in run_status.split('\n'):
                print(str(line))
            c=run_status.count('Custom Commands')
            print(c)
            return(c)
            
    def MenuNetwork(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)  
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("IPv4 Address")!=-1:
                    print(str(line))
                    val=str(line).split(':')
                    output = val[1].strip()
            return(output)
               
    def Enableqlog(self,hostname, username, password,opt1,opt2,cmd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)  
        cmd1 = 'qlog enable ' + cmd
        channel.send(cmd1 + '\n')
        time.sleep(5)
        channel.send('qlog' + '\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find(cmd)!=-1 and str(line).find('Enabled')!=-1:
                    print(str(line))
                    output = 1
            return(output)
            
    def Disableqlog(self,hostname, username, password,opt1,opt2,cmd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)  
        cmd1 = 'qlog disable ' + cmd
        channel.send(cmd1 + '\n')
        time.sleep(5)
        channel.send('qlog' + '\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find(cmd)!=-1 and str(line).find('-')!=-1:
                    print(str(line))
                    output = 1
            return(output)
            
    def Enablesnoop(self,hostname, username, password,opt1,opt2,cmd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)  
        cmd1 = 'snoop enable ' + cmd
        channel.send(cmd1 +'\n')
        time.sleep(5)
        channel.send('snoop active' + '\n')
        time.sleep(5)
        while(1):
            len=0
            l=[]
            output=0
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            for line in run_status.split('\n'):
                print(str(line))
                len=len+1
                l.append(str(line))   
                    
            for i in range(len):
                if str(l[i]).find("snoop active")!=-1 and str(l[i+1]).find(cmd)!=-1:
                    print(str(l[i+1]))
                    output = 1
            return(output)
            
            
    def Disablesnoop(self,hostname, username, password,opt1,opt2,cmd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(5)  
        cmd1 = 'snoop stop ' + cmd
        channel.send(cmd1 +'\n')
        time.sleep(5)
        channel.send('snoop active' + '\n')
        time.sleep(5)
        while(1):
            len=0
            l=[]
            output=0
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            for line in run_status.split('\n'):
                print(str(line))
                len=len+1
                l.append(str(line))   
                    
            for i in range(len):
                if str(l[i]).find("snoop active")!=-1 and str(l[i+1]).find('No work queue')!=-1:
                    print(str(l[i+1]))
                    output = 1
            return(output)
                    
    def FileTransferSftpFtp(self,hostname, username, password,opt1,opt2,opt3,serverhost,serveruser,serverpwd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3) 
        channel.send(opt3+'\n')
        time.sleep(3)    
        sftpcmd = 'sftp ' + serveruser
        ftpcmd = 'ftp ' + serverhost
        channel.send(sftpcmd +'\n')
        time.sleep(3)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        for line in run_status.split('\n'):
            print(str(line))
            if str(line).find('Are you sure you want')!=-1:
                    print(str(line))
                    channel.send('yes' + '\n')
                    time.sleep(5)
        channel.send(serverpwd + '\n')
        time.sleep(5)
        channel.send('exit' + '\n')
        time.sleep(3)
        channel.send(ftpcmd +'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            cmdout = 'Connected to ' + serverhost
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find(cmdout)!=-1:
                    print(str(line))
                    output = output + 1
                if str(line).find('command not found')!=-1:
                    print(str(line))
                    output = output + 1
            
                    
            return(output)
        
    def ReduceBackup(self,hostname, username, password,opt1,opt2,file):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            list=[]
            c=0
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find(file)!=-1:
                    print(str(line))
                    val=str(line).strip()
                    val1=val.split()
                    res=val1[4].split('-')
                    list.append(int(res[1]))
                
            month=sorted(list,reverse=True)
            print(month)
            t=month[0]-2
            print(t)
            if month[-1]>t:
                output=1
            c=run_status.count(file)
            print('backup count: ',c)
            return(c,output)
        
    def VerifyAdditionalcommands(self,hostname, username, password,opt1,opt2,opt3,list,server):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(opt3+'\n')
        time.sleep(5)
        print(list)
        while(1):
            output=0
            for x in list:
                x=str(x)
                print(x)
                if x == 'help':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    co=0
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("history")!=-1:
                            print(str(line))
                            co=co+1
                        if str(line).find("pwd")!=-1:
                            print(str(line))
                            co=co+1
                    if co ==2:
                        output=output+1
                        
                if x == 'man snmpwalk':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    co=0
                    for line in run_status.split('\n'):
                        print(str(line).strip())
                        if str(line).find("NAME")!=-1:
                            print(str(line).strip())
                            co=co+1
                        if str(line).find("SYNOPSIS")!=-1:
                            print(str(line).strip())
                            co=co+1
                            
                    if co==2:
                        channel.send("q" + '\n')
                        time.sleep(3)
                        print("q sent")
                        output = output+1
                    
                if x== 'ping':
                    cmd= x + ' ' + server
                    channel.send(cmd + '\n')
                    time.sleep(5)
                    channel.send('\x03' + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("ping statistics")!=-1:
                            print(str(line))
                            output = output+1
                            
                if x =='nslookup':
                    cmd= x + ' ' + server
                    channel.send(cmd + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("Server:")!=-1:
                            print(str(line))
                            output = output+1
                            
                if x == 'traceroute':
                    cmd= x + ' ' + server
                    channel.send(cmd + '\n')
                    time.sleep(10)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("traceroute to")!=-1:
                            print(str(line))
                            output = output+1
                            
                if x == 'free':
                    cmd= x + ' ' + server
                    channel.send(cmd + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("Mem:")!=-1:
                            print(str(line))
                            output = output+1
                    
                if x == 'dbsize | tail -10':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    for line in run_status.split('\n'):
                        print(str(line))
                        if str(line).find("KiB")!=-1:
                            print(str(line))
                            output = output+1
                            break
                            
                if x == 'wd':
                    channel.send(x + '\n')
                    time.sleep(5)
                    print("executing:",str(x))
                    out = channel.recv(9999)
                    run_status = out.decode("ascii")
                    co=0
                    for line in run_status.split('\n'):
                        print(str(line).strip())
                        if str(line).find("Every 1.0s")!=-1:
                            print("Daemon every 1.0s found: ",str(line).strip())
                            co=1
                            output = output+1
                            break
                    if co==1:
                        channel.send("\x03")
                        time.sleep(3)
                        print("Cntrl+C sent!")
            
            return(output)       
            
                        
    def GetDownloadFile(self,hostname, username, password,opt1,opt2,backup):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(5)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        sno=0
        for line in run_status.split('\n'):
            print(str(line))
            if str(line).find(backup)!=-1:
                print(str(line))
                val=str(line).strip()
                val1=val.split()
                sno=val1[0].strip()

        return(sno)
       
    def DownloadFile(self,hostname, username, password,opt1,opt2,number,path,pswd,file):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(20)
        print('sent:',opt2)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        for line in run_status.split('\n'):
            print(str(line))
        channel.send(number +'\n')
        time.sleep(5)
        print('sent:',number)
        channel.send(path + '\n')
        time.sleep(10) 
        print('sent:',path)
        channel.send(pswd + '\n')
        time.sleep(10)       
        print('sent:',pswd) 
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        for line in run_status.split('\n'):
            print(str(line))
            if str(line).find(file)!=-1 and str(line).find('%')!=-1:
                print(str(line))
                values = str(line).split()
                opt=values[1].strip()
                return(opt)
        return(1)      
           
           
                   
    def GetUploadfile(self,hostname, username, password,opt1,opt2,path,pswd,file):
            line_count = 0
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
            ssh.connect(hostname=hostname, username=username, password=password, port='22')
            channel = ssh.invoke_shell()
            time.sleep(5)
            channel.send(opt1 +'\n')
            time.sleep(3)
            channel.send(opt2 +'\n')
            time.sleep(10)
            channel.send(path +'\n')
            time.sleep(5)      
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            for line in run_status.split('\n'):
                print(str(line).strip())
                if str(line).find("existing file with the same name")!=-1:
                    channel.send("y" +'\n')
                    time.sleep(5)
            channel.send(pswd + '\n')
            time.sleep(5)
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=1
            for line in run_status.split('\n'):
                print(str(line).strip())
                if str(line).find(file)!=-1 and str(line).find('%')!=-1:
                    print(str(line))
                    values = str(line).split()
                    opt=values[1].strip()
                    return(opt)
            return(1)      

                
    def ServiceStatus(self,hostname, username, password,opt1,opt2,opt3,cmd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(opt3+'\n')
        time.sleep(3)
        channel.send(cmd+'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line).strip())
                if str(line).find("Main PID:")!=-1:
                    print(str(line))
                    output = 1
            return(output)    
                
                
    def VerifySanitizeOutput(self,hostname, username, password,opt1,opt2,opt3,cmd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(10)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        ampversion = '0'
        for line in run_status.split('\n'):
            print(str(line))
            if str(line).find("AirWave Management Platform")!=-1:
                print(str(line))
                val=str(line).split()
                ampversion =val[-3].strip()
        print("ampversion:", ampversion)
        output=0
        channel.send(opt3+'\n')
        time.sleep(3)
        channel.send(cmd+'\n')
        time.sleep(5)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        len=0
        l=[]
        for line in run_status.split('\n'):
            print(str(line))
            len=len+1
            l.append(str(line))   
        for i in range(len):
            if str(l[i]).find("amp_version")!=-1 and str(l[i+1]).find(ampversion)!=-1:
                    print(str(l[i+1]))
                    output = output+1
        return(output)
            
            
    def GetRequiredFile(self,hostname, username, password,opt1,opt2,file):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(5)
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        sno1=0
        for line in run_status.split('\n'):
            print(str(line))
            if str(line).find(file)!=-1:
                print(str(line))
                val=str(line).strip()
                val1=val.split()
                sno1=val1[0].strip()
        channel.send("\x03" +'\n')            
        time.sleep(3)            
        channel.send("\x0D" +'\n')            
        time.sleep(3)            
        channel.send("3" +'\n')
        time.sleep(5)                    
        out = channel.recv(9999)
        run_status = out.decode("ascii")
        sno2=0
        for line in run_status.split('\n'):
            print(str(line))
            if str(line).find(file)!=-1:
                print(str(line))
                val=str(line).strip()
                val1=val.split()
                sno2=val1[0].strip()
        return(sno1,sno2)
            
        
    def CheckPrepopulatedFiles1(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line).strip())
                if str(line).find("nightly")!=-1:
                    print(str(line))
                    output = output +1
                    break
                
                
            return(output)    
        
    def CheckPrepopulatedFiles2(self,hostname, username, password,opt1,opt2):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(20)
        while(1):
            out = channel.recv(100000)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line).strip())
                if str(line).find("visualrf_backup")!=-1:
                    print(str(line))
                    output = output +1
                
            return(output)    
        
           
    def AddSSL(self,hostname, username, password,opt1,opt2,opt3,no,pwd,cnfm):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1 +'\n')
        time.sleep(3)
        channel.send(opt2 +'\n')
        time.sleep(3)
        channel.send(opt3 +'\n')
        time.sleep(3)
        channel.send(no +'\n')
        time.sleep(5)
        channel.send(pwd +'\n')
        time.sleep(5)
        channel.send(cnfm +'\n')
        time.sleep(30)
        while(1):
            out = channel.recv(100000)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line).strip())
                if str(line).find("Done.")!=-1:
                    print(str(line))
                    output = 1
                    return(output)
                
    def GetCertificatefile(self,hostname, username, password,opt1,opt2,path,pswd,file):
            line_count = 0
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
            ssh.connect(hostname=hostname, username=username, password=password, port='22')
            channel = ssh.invoke_shell()
            time.sleep(5)
            channel.send(opt1 +'\n')
            time.sleep(3)
            channel.send(opt2 +'\n')
            time.sleep(10)
            channel.send(path +'\n')
            time.sleep(5)      
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            for line in run_status.split('\n'):
                print(str(line).strip())
                if str(line).find("existing file with the same name")!=-1:
                    channel.send("y" +'\n')
                    time.sleep(5)
            channel.send(pswd + '\n')
            time.sleep(20)
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=1
            for line in run_status.split('\n'):
                print(str(line).strip())
                if str(line).find(file)!=-1 and str(line).find('100%')!=-1:
                    print(str(line))
                    return('100%')
            return(1)      
        
    def ChangeToUnresolvableHost(self,hostname, username, password,opt1,opt2,host,cnfrm):
            line_count = 0
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
            ssh.connect(hostname=hostname, username=username, password=password, port='22')
            channel = ssh.invoke_shell()
            time.sleep(5)
            channel.send(opt1 +'\n')
            time.sleep(3)
            channel.send(opt2 +'\n')
            time.sleep(3)
            channel.send(host +'\n')
            time.sleep(3)
            channel.send(cnfrm +'\n')
            time.sleep(10)
            channel.send('\x0D')
            time.sleep(5)
            channel.send(opt2 +'\n')
            time.sleep(3)
            while(1):
                out = channel.recv(100000)
                run_status = out.decode("ascii")
                output=0
                for line in run_status.split('\n'):
                    print(str(line).strip())
                    if str(line).find("Current hostname:")!=-1 and str(line).find(host)!=-1:
                        print(str(line))
                        output = 1
                return(output)
            
    def AttemptToCLI(self,hostname, username, password,opt1,opt2,host,cnfrm):
            line_count = 0
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
            ssh.connect(hostname=hostname, username=username, password=password, port='22')
            channel = ssh.invoke_shell()
            time.sleep(5)
            channel.send(opt1 +'\n')
            time.sleep(3)
            channel.send(opt2 +'\n')
            time.sleep(3)
            channel.send(host +'\n')
            time.sleep(3)
            channel.send(cnfrm +'\n')
            time.sleep(10)
            while(1):
                out = channel.recv(100000)
                run_status = out.decode("ascii")
                output=0
                for line in run_status.split('\n'):
                    print(str(line).strip())
                output = run_status.count('Configure Network Settings')
                return(output)
            
    def ShortHostname(self,hostname, username, password,opt1,opt2,name):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(name +'\n')
        time.sleep(3)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("Please enter a fully qualified hostname")!=-1:
                    print(str(line))
                    output=1
            return(output)            
           
           
    def InvalidHostname(self,hostname, username, password,opt1,opt2,name):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(name +'\n')
        time.sleep(3)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("Please enter a fully qualified hostname")!=-1:
                    print(str(line))
                    output=1
            return(output)           
            
    def SetDestination(self,hostname, username, password,opt1,opt2,opt3,opt4,destination,pwd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(opt3+'\n')
        time.sleep(3)
        channel.send(opt4+'\n')
        time.sleep(3)
        channel.send(destination+'\n')
        time.sleep(3)
        channel.send(pwd +'\n')
        time.sleep(5)
        channel.send('\x0D')
        time.sleep(3)
        channel.send(opt3+'\n')
        time.sleep(3)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("Current Backup Destination:")!=-1 and str(line).find(destination)!=-1:
                    print(str(line))
                    output=1
            return(output)     
        
    def ClearDestination(self,hostname, username, password,opt1,opt2,opt3,opt4):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(opt3+'\n')
        time.sleep(3)
        channel.send(opt4+'\n')
        time.sleep(3)
        channel.send(opt3+'\n')
        time.sleep(3)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("Current Backup Destination:")!=-1 and str(line).find('None')!=-1:
                    print(str(line))
                    output=1
            return(output)     
                    
        
    def SetAmpToDCI(self,hostname, username, password,opt1,opt2,cmd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(cmd +'\n')
        time.sleep(5)
        while(1):
            out = channel.recv(9999)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("current device communication interface")!=-1:
                    print(str(line))
                    output=1
            return(output)   
        
    def VerifyTcpdump(self,hostname, username, password,opt1,opt2,opt3,cmd):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(opt3+'\n')
        time.sleep(3)
        channel.send(cmd +'\n')
        time.sleep(1)
        channel.send('\x03')
        time.sleep(5)
        while(1):
            out = channel.recv(100000)
            run_status = out.decode("ascii")
            output=0
            for line in run_status.split('\n'):
                print(str(line))
                if str(line).find("packets captured")!=-1:
                    print(str(line))
                    output=output+1
                if str(line).find("packets received")!=-1:
                    print(str(line))
                    output=output+1 
                if str(line).find("packets dropped")!=-1:
                    print(str(line))
                    output=output+1
            return(output)   
        
    def SnmpwalkMonitorID(self,hostname, username, password,opt1,opt2,opt3,id):
        line_count = 0
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)  # --> to add public key, if not added already
        ssh.connect(hostname=hostname, username=username, password=password, port='22')
        channel = ssh.invoke_shell()
        time.sleep(5)
        channel.send(opt1+'\n')
        time.sleep(3)
        channel.send(opt2+'\n')
        time.sleep(3)
        channel.send(opt3+'\n')
        time.sleep(3)
        cmd1 = 'sw ' + id
        cmd2 = 'sw2 ' + id
        cmd3 = 'sw3 ' + id
        list=[cmd1,cmd2,cmd3]
        output=0
        while(1):
            for id in list:
                print('Executing: ', id)
                channel.send(id +'\n')
                time.sleep(20)
                out = channel.recv(100000)
                run_status = out.decode("ascii")
                
                len=0
                l=[]
                for line in run_status.split('\n'):
                    print(str(line))
                    len=len+1
                    l.append(str(line))   
                for i in range(len):
                    if str(l[i]).find(id)!=-1 and str(l[i+1]).find("command not found")==-1:
                        print(str(l[i+1]))
                        return(id)
            return(output)
        
        
                    
            
        
        
        
                    
                    
                    
            
            
        
        
        
                
                    
                
        
        
                    
            
        
            
            
                    
                    
                    
                
        
        
        

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    