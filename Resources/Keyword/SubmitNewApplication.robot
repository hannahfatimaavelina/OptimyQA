*** Settings ***

Library  SeleniumLibrary
Resource  ../../Resources/Page/UserHome.robot
Resource  ../../Resources/Page/SubmitNewApplication.robot

*** Keywords ***

User decides to submit a new application
    UserHome.Click Submit a new application Button
    SubmitNewApplication.Confirm Submission of New Application

User fills-out form and verifies summary
    SubmitNewApplication.Fill-out Form then Verify Summary

User validates and sends application successfully
    SubmitNewApplication.Validate and Send Application
    SubmitNewApplication.Verify Sucessful Submission of Application
