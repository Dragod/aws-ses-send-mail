
# SMTP config

$env:smtpServer = ''

$env:smtpServerport = 587

$env:emailSmtpUser = ''

$env:emailSmtpPass = ''

# Amazon AWS SES configSet

$env:configSet = ''

# Email config

$env:from = ''

$env:to = ''

$env:subject = 'Amazon SES test (SMTP interface accessed using Powershell)'

$env:body = "<h1>Amazon SES Test</h1>" +
"<p>This email was sent through the " +
"<a href='https://aws.amazon.com/ses'>Amazon SES</a> SMTP interface " +
"using the .NET System.Net.Mail library.</p>"

$env:isHtml = $true

$env:attachments = "$PSScriptRoot\test.txt"