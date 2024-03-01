*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${email_field} =    css:input[id='login-email']
${password_field} =     css:input[id='login-password']
${login_button} =  css:button[class='btn btn-lg btn-primary col-12 mt-1 mt-md-2']


*** Keywords ***

Enter Valid Credentials
    wait until element is visible   ${email_field}
    input text  ${email_field}  ${EMAIL}
    wait until element is visible   ${password_field}
    input text  ${password_field}    ${PASSWORD}

Click Login Button
    click button  ${login_button}