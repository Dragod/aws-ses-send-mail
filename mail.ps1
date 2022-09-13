(Join-Path $PSScriptRoot 'config.ps1')

# Set up the mail message

$email = New-Object System.Net.Mail.MailMessage

$email.Headers.Add("X-SES-CONFIGURATION-SET", $env:configSet)

$email.From = $env:from

$to = @($env:to).split(",").trim()

foreach ($addr in $to)
{
    $email.To.Add($addr)
}

$email.Subject = $env:subject

$email.IsBodyHtml = $env:isHtml

$email.Body =  $env:body

$attachments = @($env:attachments)

foreach ($attachment in $attachments)
{
    $email.Attachments.Add($attachment)
}