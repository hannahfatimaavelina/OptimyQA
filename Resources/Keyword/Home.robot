*** Settings ***

Library  SeleniumLibrary
Resource  ../../Resources/Page/Home.robot

*** Keywords ***

User loads QA exam instance
    Home.Open Application

User decides to login from home page
    Home.Login from Home Page
