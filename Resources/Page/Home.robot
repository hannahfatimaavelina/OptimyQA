*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${login_link} =  css:a[class='ml-auto btn btn-outline-primary ']
${cookie_window} =  css:[id='cookie-modal']
${cookie_window_close_button} =    css:[id='cookie-close']

*** Keywords ***

Open Application
    open browser  ${URL}    ${BROWSER}
    maximize browser window
    ${count} =  get element count   ${cookie_window}
    run keyword if  ${count} > 0    click button    ${cookie_window_close_button}
    ##insert verification of elements

Login from Home Page
    wait until element is visible  ${login_link}
    click link  ${login_link}
    ##insert verification of elements
