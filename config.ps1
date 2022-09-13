
# SMTP config

$env:smtpServer = 'smtp_server_here'

$env:smtpServerport = 587

$env:emailSmtpUser = 'user_here'

$env:emailSmtpPass = 'password_here'

# Amazon AWS SES configSet

$env:configSet = 'config_set_here'

# Email config

$env:from = 'yourEmail.com'

$env:to = 'myFriend@gmail.com,myOtherFriend@hisDomain.net'

$env:subject = 'Amazon SES test (SMTP interface accessed using Powershell)'

$env:body = "<h1>Amazon SES Test</h1>" +
"<p>This email was sent through the " +
"<a href='https://aws.amazon.com/ses'>Amazon SES</a> SMTP interface " +
"using the .NET System.Net.Mail library.</p>"

$env:isHtml = $true

$env:attachments = "$PSScriptRoot\test.txt"