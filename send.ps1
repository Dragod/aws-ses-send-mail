. (Join-Path $PSScriptRoot 'config.ps1')

. (Join-Path $PSScriptRoot 'mail.ps1')

$smtpClient = New-Object System.Net.Mail.SmtpClient($env:smtpServer , $env:smtpServerport)

$smtpClient.EnableSsl = $true

$smtpClient.Credentials = New-Object System.Net.NetworkCredential($env:emailSmtpUser , $env:emailSmtpPass)

try {

    Write-Host("Attempting to send email...")

    $smtpClient.Send($email)

    Write-Host("Email sent!")

}
catch {

    Write-Host("The email was not sent.")

    Write-Host("Error sending email: $_")

}

