*** Settings ***

Library  SeleniumLibrary
Resource  ../../Resources/Page/Login.robot

*** Keywords ***

User logs in using valid credentials
    Login.Enter Valid Credentials
    Login.Click Login Button
