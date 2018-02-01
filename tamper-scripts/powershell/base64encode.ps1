# Author:       Abdullah AlJaber | @AL_JABER
# Description:  A PowerShell Template to build on your tamper, copy and build on me.
# Requirements: None
# Example:      .\base64encode.ps1 '{"payload": "Hello World", "kwargs": {"headers": {}}}'
#

param(
    [string] $jsoninput
)
[System.Reflection.Assembly]::LoadWithPartialName("System.Web.Extensions") | Out-Null
$serializer = New-Object System.Web.Script.Serialization.JavaScriptSerializer
$json = $serializer.DeserializeObject($jsoninput)

$payload = $json.item("payload")
$Bytes = [System.Text.Encoding]::Unicode.GetBytes($payload)
$Encodedpayload =[Convert]::ToBase64String($Bytes)

#Print out the payload and encoded payload
#Write-Output "The payload is: $payload"
#Write-Output "This is the encoded payload $encodedpayload"
Write-Output $encodedpayload
