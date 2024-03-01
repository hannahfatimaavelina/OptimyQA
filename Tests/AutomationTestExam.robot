*** Settings ***

Library  SeleniumLibrary

Resource  ../Resources/Keyword/Home.robot
Resource  ../Resources/Keyword/Login.robot
Resource  ../Resources/Keyword/SubmitNewApplication.robot

*** Variables ***

${BROWSER} =    chrome
${URL} =    https://qrqck8u5t9co.front.staging.optimy.net/en/
${EMAIL} =  optimyautomationtester@gmail.com
${PASSWORD} =   2MsWseoj

${FIRSTNAME} =  Test Fname
${LASTNAME} =   Test Lname
${EXTENSION} =  Jr.
${UNITHOUSENO} =    1234Test
${POSTALCODE} =     1000
@{COUNTRY} =    PH  Philippines
${PHOTOFILEPATH} =  ${EXECDIR}${/}TestData${/}${PHOTOFILE}
${PHOTOFILE} =  photo.jpeg
${GENDER} =     Male
${ROLE} =   Automation tester
${SKILL} =  Cypress
${CAREEROBJECTIVES} =   Loremipsum



*** Test Cases ***

Scenario
    Given User loads QA exam instance
    When User decides to login from home page
    And User logs in using valid credentials
    Then User decides to submit a new application
    And User fills-out form and verifies summary
    And User validates and sends application successfully



