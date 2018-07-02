### Example of downloading a file using Invoke-WebRequest on Powershell

Currently on our stemcells, we have TLS 1.0 enabled. Until then, we would need to run the below command before using Invoke-WebRequest to download a file from websites that require TLS 1.2 minimum (like Github)
```
- [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
- Invoke-WebRequest -Uri "https://github.com/cloudfoundry-incubator/bosh-windows-stemc
ell-builder/releases/download/1709.8/agent.zip" -OutFile ".\bosh-agent.zip"
```

### Example of copying files recursively

The below small powershell script is to copy files/folders recursively between locations. 

```$from = 'c:\sources'
$to = 'c:\build'
Get-ChildItem -Path $from | % { 
  Copy-Item $_.fullname "$to" -Recurse -Force
}
```
