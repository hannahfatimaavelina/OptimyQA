*** Settings ***

Library  SeleniumLibrary
Library     String

*** Variables ***

${content_page} =   css:div[class='page-main__content-wrapper']
${submit_application_confirmation} =    css:h1[class='h1']
${submit_application_confirmation_message} =    Continue with the submission of an application?
${submit_application_button} =  css:a[href*='/en/project/new/controller.php?formId=']




${fill_out_form_firstname_field} =    css:input[aria-label='First name']
${fill_out_form_lastname_field} =    css:input[aria-label='Last name']
${fill_out_form_extension_field} =    css:input[aria-label='Extension']
${fill_out_form_extension_field} =    css:input[aria-label='Last name']
${fill_out_form_unithouseno_field} =    css:textarea[aria-label='Unit no/House no, Street']
${fill_out_form_postalcode_autocomplete} =    css:input[aria-label='Select postal code']
${fill_out_form_autocomplete_value} =    css:li[class='ui-menu-item']
${fill_out_form_country_dropdown} =    css:select[aria-label='Country']
${fill_out_form_country_dropdown_value} =   css:option[value='${COUNTRY}[0]']
${fill_out_form_photo_button} =    css:span[class='qq-uploader-selector--default']
${fill_out_form_photo_input_file} =    css:input[name='Filedata']
${fill_out_form_photo_uploaded_file} =   css:a[href*='attachment']
${fill_out_form_gender_value} =    css:label[aria-label='${GENDER}']
${fill_out_form_role_dropdown} =    css:select[aria-label*='Select a role']  ##css:select[id="field_cba99291-980c-5cb1-91c2-1db8d294587b"]
@{fill_out_form_role_dropdown_values} =  css:option[id="be78a319-8d16-5788-9412-0e1e0cd80bee"]    css:option[id="97434c3e-1096-529e-ab94-52b48db51ab0"]     css:option[id="53d5877a-54ed-558b-a83e-9ef29729432c"]
${fill_out_form_skills_checkbox} =    css:label[aria-label='${SKILL}']
${fill_out_form_careerobjectives_field} =   css:textarea[aria-label='What is your career objective?']
${next_screen_button} =     css:button[id='navButtonNext']
${step_number} =  css:span[id='screenNo']
${validate_field} =   css:div[class*='answer'][id='container_
${validate_list} =   css:li[class*='answer'][id*='container_
${validate_dropdown} =   css:div[class*='dropdown'][id='container_
${validate_question} =   css:div[class*='question'][id='container_
${footer_locator} =     css:div[class='mt-4 mb-2 mt-md-0 card-footer d-none d-md-flex justify-content-between align-items-center']
${validate_and_send_button} =   css:div[class='d-none d-md-flex justify-content-between align-items-center']
${success_icon} =   css: [class='mb-4 text-center text-success']
${submit_application_success}   css: [class='h1 text-center']
${submit_application_success_message} =  Thank you for submitting your project


*** Keywords ***

Confirm Submission of New Application
    click element  ${content_page}
    wait until element is visible  ${submit_application_confirmation}
    ${is_confirmation_present} =    run keyword and return status  element should contain   ${submit_application_confirmation}  ${submit_application_confirmation_message}
    run keyword if  ${is_confirmation_present}  run keywords
            scroll element into view  ${submit_application_button}
            AND wait until element is visible   ${submit_application_button}
            AND click link  ${submit_application_button}

Fill-out Form then Verify Summary
    wait until element is visible   ${step_number}
    wait until element contains  ${step_number}     1

    scroll element into view   ${fill_out_form_firstname_field}
    wait until element is visible   ${fill_out_form_firstname_field}
    click element  ${fill_out_form_firstname_field}
    input text  ${fill_out_form_firstname_field}    ${FIRSTNAME}
    ${reusable_firstname} =     get element attribute    ${fill_out_form_firstname_field}   id

    scroll element into view    ${fill_out_form_lastname_field}
    wait until element is visible   ${fill_out_form_lastname_field}
    input text  ${fill_out_form_lastname_field}    ${LASTNAME}
    ${reusable_lastname} =     get element attribute    ${fill_out_form_lastname_field}   id

    scroll element into view     ${fill_out_form_extension_field}
    wait until element is visible   ${fill_out_form_extension_field}
    input text  ${fill_out_form_extension_field}    ${EXTENSION}
    ${reusable_extension} =     get element attribute    ${fill_out_form_extension_field}   id

    scroll element into view    ${fill_out_form_unithouseno_field}
    wait until element is visible   ${fill_out_form_unithouseno_field}
    input text  ${fill_out_form_unithouseno_field}    ${UNITHOUSENO}
    ${reusable_unithouseno} =   get element attribute    ${fill_out_form_unithouseno_field}   id
    @{reusable_unithouseno_splitted} =  split string     ${reusable_unithouseno}    ::


    scroll element into view    ${fill_out_form_postalcode_autocomplete}
    wait until element is visible   ${fill_out_form_postalcode_autocomplete}
    ${reusable_postalcode} =     get element attribute    ${fill_out_form_postalcode_autocomplete}   name
    @{reusable_postalcode_splitted} =  split string     ${reusable_postalcode}  ::
    input text   ${fill_out_form_postalcode_autocomplete}    ${POSTALCODE}
    wait until element is visible   ${fill_out_form_autocomplete_value}
    click element  ${fill_out_form_autocomplete_value}


    scroll element into view    ${fill_out_form_country_dropdown}
    wait until element is visible   ${fill_out_form_country_dropdown}
    click element  ${fill_out_form_country_dropdown}
    ${reusable_country} =     get element attribute    ${fill_out_form_country_dropdown}   id
    click element  ${fill_out_form_country_dropdown_value}
    press keys   ${fill_out_form_country_dropdown}    RETURN

    scroll element into view    ${fill_out_form_photo_button}
    wait until element is visible   ${fill_out_form_photo_button}
    choose file  ${fill_out_form_photo_input_file}  ${PHOTOFILEPATH}
    ${reusable_photo} =     get element attribute    ${fill_out_form_photo_input_file}  qq-button-id
    wait until element is visible   ${fill_out_form_photo_uploaded_file}
    element should contain  ${fill_out_form_photo_uploaded_file}    ${PHOTOFILE}

    scroll element into view    ${fill_out_form_gender_value}
    wait until element is visible   ${fill_out_form_gender_value}
    click element  ${fill_out_form_gender_value}
    ${reusable_gender} =     get element attribute    ${fill_out_form_gender_value}   for

    wait until element is visible   ${fill_out_form_role_dropdown}
    click element  ${fill_out_form_role_dropdown}
    run keyword if  '${ROLE}' == 'Manual tester'     click element  ${fill_out_form_role_dropdown_values}[0]
    run keyword if  '${ROLE}' == 'Automation tester'     click element  ${fill_out_form_role_dropdown_values}[1]
    run keyword if  '${ROLE}' == 'Manual + Automation tester'      click element  ${fill_out_form_role_dropdown_values}[2]
    ${reusable_role} =     get element attribute    ${fill_out_form_role_dropdown}   name

    scroll element into view    ${fill_out_form_skills_checkbox}
    wait until element is visible   ${fill_out_form_skills_checkbox}
    click element  ${fill_out_form_skills_checkbox}

    sleep   5s
    press keys  ${fill_out_form_skills_checkbox}    TAB+${CAREEROBJECTIVES}
    click element  ${fill_out_form_skills_checkbox}
    ${reusable_skill} =     get element attribute    ${fill_out_form_skills_checkbox}  for
    ${reusable_careerobjectives} =     get element attribute    ${fill_out_form_careerobjectives_field}   name
    @{reusable_careerobjectives_splitted} =  split string     ${reusable_careerobjectives}  ::

    click button  ${next_screen_button}
    sleep  10s
    wait until element is visible   ${step_number}
    wait until element contains  ${step_number}     2


    sleep  10s
    log to console  ${validate_field}${reusable_firstname}']
    scroll element into view  ${validate_field}${reusable_firstname}']
    click element   ${validate_field}${reusable_firstname}'] > div
    element should contain  ${validate_field}${reusable_firstname}'] > div    ${FIRSTNAME}

    scroll element into view  ${validate_field}${reusable_lastname}']
    log to console  ${validate_field}${reusable_lastname}']
    click element   ${validate_field}${reusable_lastname}'] > div
    element should contain  ${validate_field}${reusable_lastname}'] > div    ${LASTNAME}

    scroll element into view  ${validate_field}${reusable_extension}']
    log to console  ${validate_field}${reusable_extension}']
    click element   ${validate_field}${reusable_extension}'] > div
    element should contain  ${validate_field}${reusable_extension}'] > div    ${EXTENSION}

    scroll element into view  ${validate_field}${reusable_unithouseno_splitted}[1]']
    log to console  ${validate_field}${reusable_unithouseno_splitted}[1]']
    click element   ${validate_field}${reusable_unithouseno_splitted}[1]'] > p
    element should contain  ${validate_field}${reusable_unithouseno_splitted}[1]'] > p    ${UNITHOUSENO}

    scroll element into view  ${validate_field}${reusable_postalcode_splitted}[1]']
    log to console  ${validate_field}${reusable_postalcode_splitted}[1]']
    click element   ${validate_field}${reusable_postalcode_splitted}[1]'] > p
    element should contain  ${validate_field}${reusable_postalcode_splitted}[1]'] > p    ${POSTALCODE}

    press keys  ${validate_field}${reusable_postalcode_splitted}[1]']   DOWN_ARROW

    scroll element into view    ${validate_field}${reusable_country}']
    log to console  ${validate_field}${reusable_country}']
    click element   ${validate_field}${reusable_country}'] > p
    element should contain  ${validate_field}${reusable_country}'] > p    ${COUNTRY}[1]

    scroll element into view    ${fill_out_form_photo_uploaded_file}
    log to console  ${fill_out_form_photo_uploaded_file}
    element should contain  ${fill_out_form_photo_uploaded_file}    ${PHOTOFILE}

    press keys  ${validate_field}${reusable_country}'] > p   DOWN_ARROW+DOWN_ARROW

    scroll element into view    ${validate_list}${reusable_gender}']
    log to console  ${validate_list}${reusable_gender}']
    element should contain  ${validate_list}${reusable_gender}']    ${GENDER}

    press keys  ${validate_field}${reusable_country}'] > p  DOWN_ARROW+DOWN_ARROW

    scroll element into view    ${validate_dropdown}${reusable_role}']
    log to console  ${validate_dropdown}${reusable_role}']
    click element   ${validate_dropdown}${reusable_role}'] div > p
    element should contain  ${validate_dropdown}${reusable_role}'] div > p   ${ROLE}

    press keys  ${validate_dropdown}${reusable_role}']   DOWN_ARROW+DOWN_ARROW

    scroll element into view    ${validate_list}${reusable_skill}']
    log to console  ${validate_list}${reusable_skill}']
    element should contain  ${validate_list}${reusable_skill}']    ${SKILL}


    press keys  ${validate_list}${reusable_skill}']  DOWN_ARROW+DOWN_ARROW

    scroll element into view    ${validate_question}${reusable_careerobjectives_splitted}[0]']
    log to console  ${validate_question}${reusable_careerobjectives_splitted}[0]']
    click element   ${validate_question}${reusable_careerobjectives_splitted}[0]'] div > div > p
    element should contain  ${validate_question}${reusable_careerobjectives_splitted}[0]'] div > div > p   ${CAREEROBJECTIVES}

    press keys  ${validate_question}${reusable_careerobjectives_splitted}[0]']  DOWN_ARROW+DOWN_ARROW+DOWNARROW+DOWN_ARROW+DOWN_ARROW+DOWNARROW

Validate and Send Application
    scroll element into view  ${footer_locator}
    click element  ${validate_and_send_button}
    Sleep   10s

Verify Sucessful Submission of Application
    wait until element is visible   ${success_icon}
    wait until element is visible   ${submit_application_success}
    element should contain  ${submit_application_success}   ${submit_application_success_message}




