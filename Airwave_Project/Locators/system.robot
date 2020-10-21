*** Variables ***
${system_CPU}  //div[@class="system_perf_page"]//h3[contains(text(),'CPU')]
${system_memory}  //div[@class="system_perf_page"]//h3[contains(text(),'Memory')]
${diskspace_xpath}  //*[@class="panel rounded white"]/*
${sys_mem_usageheading}  //*[@class="title_heading" and contains(text(),'System Memory Usage')]
${sys_mem_usagegraph}  //*[contains(text(),'System Memory Usage')]/parent::*//*/*
${sys_swap_usageheading}  //*[@class="title_heading" and contains(text(),'System Swap Usage')]
${sys_swap_usagegraph}  //*[contains(text(),'System Swap Usage')]/parent::*//*/*
${sys_network_usageheading}  //*[@class="title_heading" and contains(text(),'System Network Usage')]
${sys_network_usagegraph}  //*[contains(text(),'System Network Usage')]/parent::*//*/*
${protocol_usageheading}  //*[@class="title_heading" and contains(text(),'Usage by Protocol')]
${protocol_usagegraph}  //*[contains(text(),'Usage by Protocol')]/parent::*//*/*
${tot_disk_usageheading}  //*[@class="title_heading" and contains(text(),'Total Disk Usage')]
${tot_disk_usagegraph}  //*[contains(text(),'Total Disk Usage')]/parent::*//*/*
${AMON_stat_heading}  //*[contains(@id,'AMON')]/h2
${AMON_graph}  //*[contains(@id,'AMON')]//*[@class="columns small-6"]
${RabbitMQ_stat_heading}  //*[contains(@id,'RabbitMQ')]/h2
${RabbitMQ_graph}  //*[contains(@id,'RabbitMQ')]//*[@class="columns small-6"]
${Redis_stat_heading}  //*[contains(@id,'Redis')]/h2
${Redis_graph}  //*[contains(@id,'Redis')]//*[@class="columns small-6"]
${Database_stat_heading}  //*[contains(text(),'Database Statistics')]
${Database_table_head}  //*[@id="fragment_div_System__Performance__RowCount"]//*[@class="title_heading"]
${Database_table}  //*[@id="fragment_div_System__Performance__RowCount"]//tr
${Database_graph_head}  //*[@class="title_heading" and contains(text(),'Database')]
${Database_graph}  //*[@class="title_heading" and contains(text(),'Database')]/parent::*//*/*