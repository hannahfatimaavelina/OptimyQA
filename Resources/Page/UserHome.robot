*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${content_page} =   css:div[class='page-main__content-wrapper']
${submit_new_application_button} =  css:a[href='project/new/']

*** Keywords ***

Click Submit a new application Button
    click element  ${content_page}
    wait until element is visible  ${submit_new_application_button}
    scroll element into view    ${submit_new_application_button}
    sleep  30s
    click link   ${submit_new_application_button}
    ## insert verification
