## File stuff

### Tail (live) a file
Get-Content -Wait <filename>
### Show the first X lines of a file
Get-Content -Head <x> <filename>
### Show the last X lines of a file
Get-Content -Tail <x> <filename>
### Write to a file
Set-Content <filename> <contents>

“<contents>” | Set-Content <filename>
### Append to a file
Add-Content <filename> <contents>

“<contents>” | Add-Content <filename>
### Find text in a file
Select-String <pattern> -Path <filename>
### Find text recursively in a directory
Get-ChildItem -Recurse <directory> | Select-String <pattern>

## Network stuff
Download something
Invoke-WebRequest -UseBasicParsing -Uri http://url/of/file.ext -OutFile filename.ext

### Download something faster (by turning off the progress bar)
$progressPreference = 'SilentlyContinue'
Invoke-WebRequest ...
$progressPreference = 'Continue'
Test connection to remote address (TCP, ping)
Test-NetConnection -ComputerName <IP or hostname> -Port <port>
### See listening and established TCP connections
Get-NetTCPConnection
### Show firewall rules
### Get-NetFirewallRule
Filter firewall rules by port, address, application, etc.
The command to show firewall rules (Get-NetFirewallRule) doesn’t show everything about the rule such as addresses, ports, etc. There are separate commands to get that information (e.g. Get-NetFirewallAddressFilter, Get-NetFirewallPortFilter) but they don’t show you the full rule, just the filterable information. You must combine the commands if you want to find a rule based on a filter. For example, to find firewall rules that have a local port of 80:
Get-NetFirewallPortFilter | where { $_.LocalPort -eq 80 } | Get-NetFirewallRule

See the Microsoft docs for more types of filters.
### Show default inbound/outbound actions for public/private/guest networks
Get-NetFirewallProfile

## Process stuff
### Show all processes
Get-Process
Kill process(es) by name
Get-Process -Name <name> | Stop-Process

Event log stuff
There are many event logs, the ones you are likely interested in are Application, System, and Security. The Application log includes events from Windows and user-provided apps such as the bosh-agent. The System log has more OS-level and driver logs.
Get all events
Get-EventLog -LogName <LogName>
Get latest X events
(Get-EventLog -LogName <LogName>)[0..<X>]
Show full messages (and some other useful fields) for events
Get-EventLog -LogName <LogName> | fl EventID, EntryType, Message, Source, TimeGenerated
Show reboots
Get-EventLog -LogName System | where { $_.EventID -eq 6005 }

Random stuff
`watch`
while ($true) { clear; date; <Command>; Start-Sleep 1 }
Run until it fails
while (<Command>) { echo "Succeeded, sleeping for 1 second"; Start-Sleep 1 }
Formatting output
Running a powershell command and not seeing all of the columns you expect? Try piping it to Format-List * (or fl *) to see all of the available columns. You can also show specific columns by piping to Format-List column-name, other-column-name, ...
Aliases
Common unix commands such as cd, ls, cat, and rm will Do The Right Thing™ in powershell. See full list here
Setting the PATH
Setting $env:PATH only affects your current shell session:
$env:path += ";<PathToThing>”
To set the PATH globally, you can do the following:
$oldPath = [Environment]::GetEnvironmentVariable("Path",[System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("Path", $oldPath + "<PathToThing>", [EnvironmentVariableTarget]::Machine)

### Running installers
To install MSIs, use msiexec:
Start-Process -FilePath msiexec -ArgumentList "/i <MSIPath> /passive /norestart" -Wait -NoNewWindow
Installing EXEs is similar, but each installer will have its own arguments:
Start-Process -FilePath <EXEPath> -ArgumentList "/<InstallerArg1> /<InstallerArg2> ..." -Wait -NoNewWindow
