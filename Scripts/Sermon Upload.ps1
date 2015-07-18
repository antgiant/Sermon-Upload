#$url = "http://www.springmeadows.org/article/400";
#$stuff = invoke-RestMethod -Uri $url -Method Get;
#$stuff[0].title;
 
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles();
$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Sample Form"
$Icon = New-Object system.drawing.icon ($PSScriptRoot + "\SpringMeadows.ico")
$Form.Icon = $Icon
$Form.AutoSize = $True
$Form.AutoSizeMode = "GrowAndShrink"
    # or GrowOnly
$Form.MinimizeBox = $False
$Form.MaximizeBox = $False
$Form.SizeGripStyle = "Hide"
    # Auto, Hide, Show
$Form.StartPosition = "CenterScreen"
    # CenterScreen, Manual, WindowsDefaultLocation, WindowsDefaultBounds, CenterParent 
$Font = New-Object System.Drawing.Font("Times New Roman",24,[System.Drawing.FontStyle]::Italic)
    # Font styles are: Regular, Bold, Italic, Underline, Strikeout
$Form.Font = $Font
$Label = New-Object System.Windows.Forms.Label
$Label.Text = "This form is very simple."
$Label.AutoSize = $True
$Form.Controls.Add($Label)
$Label2 = New-Object System.Windows.Forms.Label
$Label2.Text = "Really it is very simple."
$Label2.AutoSize = $True
$Form.Controls.Add($Label2)
$Form.ShowDialog()
# SIG # Begin signature block
# MIIJgAYJKoZIhvcNAQcCoIIJcTCCCW0CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUm3QZLrTRImS5u/pcttPU12fV
# j2KgggbAMIIGvDCCBaSgAwIBAgITFQAAGai1UlHDBJsJ2gABAAAZqDANBgkqhkiG
# 9w0BAQUFADBxMRMwEQYKCZImiZPyLGQBGRYDRURVMRMwEQYKCZImiZPyLGQBGRYD
# QURVMRIwEAYKCZImiZPyLGQBGRYCRFMxMTAvBgNVBAMTKEFkdmVudGlzdHktVW5p
# dmVyc2l0eS1vZi1IZWFsdGgtU2NpZW5jZXMwHhcNMTUwMzI3MTg0NTA5WhcNMTYw
# MzI2MTg0NTA5WjCB3DETMBEGCgmSJomT8ixkARkWA0VEVTETMBEGCgmSJomT8ixk
# ARkWA0FEVTESMBAGCgmSJomT8ixkARkWAkRTMQwwCgYDVQQLEwNBRFUxJjAkBgNV
# BAsTHUluZm9ybWF0aW9uIFRlY2hub2xvZ3kgQWRtaW5zMSUwIwYDVQQLExxJbmZv
# cm1hdGlvbiBUZWNobm9sb2d5IFVzZXJzMRYwFAYDVQQDEw1UcmF2aXMgV29vbGV5
# MScwJQYJKoZIhvcNAQkBFhhUcmF2aXMuV29vbGV5QG15LmFkdS5lZHUwggEiMA0G
# CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDVbx8W2J3Bq4fxwRyH4Qon7QjoLcc0
# 6s6Br/DiH9trYwnXVCkzzm1pw1HwqlFsea1RM8uApExJ8IKFUX+cblnwlnGyd6JL
# hZJMEABbBoQKMW1fyQtFkTz5h3e9uyuS0DcVwJpQltRFnQHj3qhszxGBxBrHtKXo
# o+FK1DZMNn6HEWcuLorr2a2fPzsOiyXIgtzY/nX0SBhs5PKZRhREV1C4k/GeRxjh
# VaAz08gDb0H91du7V4rHbpSXsg+HQAYZ52n9jkxMQsVHZ+xFxfj9WfsumoMGc5l1
# wWhi6oW6DuiyEnbrJHOvC23NWz7EIfJRiTqsvYRPmBumRReSlrwKyuDNAgMBAAGj
# ggLfMIIC2zA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3FQiE/9B9gafwIoaJlSmD
# 39BrhOrsYxGF9uJ7s7ZhAgFlAgEDMBMGA1UdJQQMMAoGCCsGAQUFBwMDMAsGA1Ud
# DwQEAwIHgDAbBgkrBgEEAYI3FQoEDjAMMAoGCCsGAQUFBwMDMB0GA1UdDgQWBBQC
# NhznULa69WZjMaTTThwbljoPmDAfBgNVHSMEGDAWgBTlr5vH8x4q/pRiF4TFmgiv
# r+hC7zCB7QYDVR0fBIHlMIHiMIHfoIHcoIHZhoHWbGRhcDovLy9DTj1BZHZlbnRp
# c3R5LVVuaXZlcnNpdHktb2YtSGVhbHRoLVNjaWVuY2VzKDEpLENOPWFkdXZtY2Ew
# MSxDTj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMs
# Q049Q29uZmlndXJhdGlvbixEQz1EUyxEQz1BRFUsREM9RURVP2NlcnRpZmljYXRl
# UmV2b2NhdGlvbkxpc3Q/YmFzZT9vYmplY3RDbGFzcz1jUkxEaXN0cmlidXRpb25Q
# b2ludDCB3AYIKwYBBQUHAQEEgc8wgcwwgckGCCsGAQUFBzAChoG8bGRhcDovLy9D
# Tj1BZHZlbnRpc3R5LVVuaXZlcnNpdHktb2YtSGVhbHRoLVNjaWVuY2VzLENOPUFJ
# QSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25m
# aWd1cmF0aW9uLERDPURTLERDPUFEVSxEQz1FRFU/Y0FDZXJ0aWZpY2F0ZT9iYXNl
# P29iamVjdENsYXNzPWNlcnRpZmljYXRpb25BdXRob3JpdHkwTQYDVR0RBEYwRKAo
# BgorBgEEAYI3FAIDoBoMGFRyYXZpcy5Xb29sZXlAbXkuYWR1LmVkdYEYVHJhdmlz
# Lldvb2xleUBteS5hZHUuZWR1MA0GCSqGSIb3DQEBBQUAA4IBAQCdIu6PvuPGM6ls
# mOUeaUFSR4Lk1gJ2hIYhUxXhtVPgDOMw8NKCYNrP8eSsntgSuVzLDdCio2+9akKk
# 6lDtD8NWqv2BMMCjiAfgJbDH1tCFv1juzvQztCp2vJuQKGsUuvQZI6M9zE3s7gEO
# 1wF+lXys4KPcEca6Rwonj0LWPELt3A5mRdtfeWt9ps6CsqpCwgz1DYlAyhFjEyWi
# mJi/Qs0wuxavqxxCj6cc6ZbKuDR4zS7vsCpEWqCR5cygAz2lqZTUUGNlQkJ38fls
# ITAGJTNOjaLOJ0gtc9brxwRKgkv0DA29DCsIA5LVRoo0xkkL1B5bGrK299kRoCUt
# xO8cCLoIMYICKjCCAiYCAQEwgYgwcTETMBEGCgmSJomT8ixkARkWA0VEVTETMBEG
# CgmSJomT8ixkARkWA0FEVTESMBAGCgmSJomT8ixkARkWAkRTMTEwLwYDVQQDEyhB
# ZHZlbnRpc3R5LVVuaXZlcnNpdHktb2YtSGVhbHRoLVNjaWVuY2VzAhMVAAAZqLVS
# UcMEmwnaAAEAABmoMAkGBSsOAwIaBQCgeDAYBgorBgEEAYI3AgEMMQowCKACgACh
# AoAAMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAM
# BgorBgEEAYI3AgEVMCMGCSqGSIb3DQEJBDEWBBSRhnTyfA8ESK3IRjqNHDzAZwE2
# /jANBgkqhkiG9w0BAQEFAASCAQBF04Hse/pE+YFZg1dw2HcOPXLaEWnq5CRZINq2
# so0RXg8+Dm44OfzqrnWTDSxr3je45QJe77iXLVlxPgY37mo9SLcsGzB/oW1VqMaw
# GX38jXb8oty1QcQ3zszGHLRFFBQCUBSkD8HxNHQESQkc85yJ/vUX2mcUQV2S5OXS
# cj6BwNzq3D1cmiydy7AGPTp+BRAg2ZcZ5gvKq3o2i1w1q3MOhycrS4GGoiuZ8wFB
# rhsi6Sc2P/IVV+uekOU1GK+z5xbb6l/me6Kk6SLhEzx4MDYHKXqGXqnI9g47MsWj
# 5jcqIxP6qDtr/2nIv48UbK4j0cUWse51QS6pq4fRMehCXnTC
# SIG # End signature block
