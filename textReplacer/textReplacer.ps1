#
# Quick replace server IP in zabbix agent configuration file.
#
$path = "C:\zabbix\zabbix_agentd.conf"
$inputFile = Get-Content $path
$inputFile.Replace("192.168.1.10","192.168.1.5") | sc C:\zabbix\zabbix_agentd.conf