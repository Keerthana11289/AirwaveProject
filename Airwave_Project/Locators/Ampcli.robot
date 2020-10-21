*** Variables ***
${loginmenu1}  Files
${loginmenu2}  Backups
${loginmenu3}  Configuration
${loginmenu4}  System
${loginmenu5}  Users
${loginmenu6}  Support
${loginmenu7}  Security
${loginmenu8}  Advanced
${loginmenu9}  Quit
${DNSserverTmp}  10.20.50.20

${Loc_AddLic}  //*[text()='Add']
${Loc_LicTextBox}  //*[@class="license_text_entry"]
${Loc_LicAdd}  //*[@name="add" and text()='Add']
${Loc_Accept}  //*[@name="accept"]
${Loc_DeleteButtonCLI}  //*[text()='Delete']
${Loc_CnfrmDeleteLic}  //*[@name="ok"]

${Loc_DevCount}  //*[@class="read_state"]/*[contains(@href,'ap_monitoring')]
