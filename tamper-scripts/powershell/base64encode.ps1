#
# Author:             Abdullah AlJaber | @AL_JABER
# Description:        A PowerShell Template to build on your tamper, copy and build on me.
# Requirements:       None
# Usage Example:      Invoke-TamperAPI '{"payload": "Hello World", "kwargs": {"headers": {}}}'
#


function Invoke-TamperAPI{ 
    param(
        [string] $jsoninput
    )
    
    $serializer = New-Object System.Web.Script.Serialization.JavaScriptSerializer
    $json = $serializer.DeserializeObject($jsoninput)
    
    $payload = $json.item("payload")
    $Bytes = [System.Text.Encoding]::Unicode.GetBytes($payload)
    $Encodedpayload =[Convert]::ToBase64String($Bytes)
    
    #Print out the payload and encoded payload
    Write-Output $encodedpayload
      
}
