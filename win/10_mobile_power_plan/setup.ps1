# Get's the GUID of your current Balanced Power Plan and duplicates it:
powercfg /DUPLICATESCHEME $(powercfg /L | Select-String -Pattern 'Balanced' | ForEach-Object {$_ -replace "Power Scheme GUID: ", ""} | ForEach-Object {$_.substring(0,36)})
#powercfg /L
#list power plan's with name and GUID
#powercfg /DUPLICATESCHEME GUID#
#POWERCFG /CHANGENAME NEWGUID# "MOBILE"
powercfg /CHANGENAME $(powercfg /L | Select-String -Pattern 'Balanced' | ForEach-Object {$_ -replace "Power Scheme GUID: ", ""} | ForEach-Object {$_.substring(0,36)} | Select-Object -Last 1) "Buzzed"
#POWERCFG /LIST
#Throttle ECORES
POWERCFG /SETDCVALUEINDEX $(powercfg /L | Select-String -Pattern 'Buzzed' | ForEach-Object {$_ -replace "Power Scheme GUID: ",""} | ForEach-Object {$_.substring(0,36)} | Select-Object -Last 1) SUB_PROCESSOR PROCTHROTTLEMAX 60
#Throttle PCORES
POWERCFG /SETDCVALUEINDEX $(powercfg /L | Select-String -Pattern 'Buzzed' | ForEach-Object {$_ -replace "Power Scheme GUID: ",""} | ForEach-Object {$_.substring(0,36)} | Select-Object -Last 1) SUB_PROCESSOR PROCTHROTTLEMAX1 50
