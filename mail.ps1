$config = Get-Content -Path "$PSScriptRoot\config.json" | ConvertFrom-Json

# Set up the mail message

$email = New-Object System.Net.Mail.MailMessage

Write-Host "`nServer: $($config.smtp.server)" -ForegroundColor Magenta

$email.Headers.Add("X-SES-CONFIGURATION-SET", $config.headers.ses)

Write-Host("`nEmail from: " + $config.email.from) -ForegroundColor Magenta

$email.From = $config.email.from

$to = @($config.email.to).split(",").trim()

Write-Host("`nEmail to: " + $config.email.to) -ForegroundColor Magenta

foreach ($addr in $to)
{
    $email.To.Add($addr)
}

$email.Subject = $config.email.subject

Write-Host("`nSubject: " + $config.email.subject) -ForegroundColor Magenta

$email.IsBodyHtml = $config.email.isHtml

$email.Body =  $config.email.body

foreach ($attachment in $config.email.attachments) {

    Write-Host "`nAttachment:" $attachment.path -ForegroundColor Magenta

    $attachment = New-Object System.Net.Mail.Attachment("$PSScriptRoot\$($attachment.path)", $attachment.mimeType)

    $email.Attachments.Add($attachment)

}
