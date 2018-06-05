### Example of downloading a file using Invoke-WebRequest on Powershell


[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "http://github.com/cloudfoundry-incubator/bosh-windows-stemc
ell-builder/releases/download/1709.8/agent.zip" -OutFile ".\bosh-agent.zip"

### Example of copying files recursively


$from = 'c:\sources'

$to = 'c:\build'

Now it’s a trivial solution:

Get-ChildItem -Path $from | % { 
  Copy-Item $_.fullname "$to" -Recurse -Force
}
