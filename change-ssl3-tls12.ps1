$ProfileFile = "${PsHome}\Profile.ps1"

if (! (Test-Path $ProfileFile)) {
New-Item -Path $ProfileFile -Type file -Force
}
''                                                                                | Out-File -FilePath $ProfileFile -Encoding ascii -Append
'[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12' | Out-File -FilePath $ProfileFile -Encoding ascii -Append

notepad $ProfileFile
