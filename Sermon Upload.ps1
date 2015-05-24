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