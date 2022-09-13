. (Join-Path $PSScriptRoot 'mail.ps1')

$config = Get-Content -Path "$PSScriptRoot\config.json" | ConvertFrom-Json

$smtpClient = New-Object System.Net.Mail.SmtpClient($config.smtp.server , $config.smtp.port)

$smtpClient.EnableSsl = $true

$smtpClient.Credentials = New-Object System.Net.NetworkCredential($config.smtp.user , $config.smtp.password)

try {

    Write-Host("`nAttempting to send email...") -ForegroundColor Yellow

    $smtpClient.Send($email)

    Write-Host("`nEmail sent!`n") -ForegroundColor Green

}
catch {

    Write-Host("`nThe email was not sent.")

    Write-Host("`nError sending email: $_")

}

