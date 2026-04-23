*** Settings ***
Library     SeleniumLibrary
Resource    variables.robot

*** Keywords ***
Ouvrir navigateur et se connecter
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN_USERNAME}    10s
    Input Text    ${LOGIN_USERNAME}    ${USERNAME}
    Input Text    ${LOGIN_PASSWORD}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains    ${DASHBOARD_TEXT}    10s

Aller vers creation groupe
    Click Element    xpath=//a[@title="Admin Tools"] | //a[contains(normalize-space(.),"Outils admin")]
    Wait Until Page Contains Element    xpath=//a[contains(normalize-space(.),"Groups") or contains(normalize-space(.),"Groupes")]    10s
    Click Element    xpath=//a[contains(normalize-space(.),"Groups") or contains(normalize-space(.),"Groupes")]
    Wait Until Page Contains    Groups    10s

Creer un groupe
    [Arguments]    ${group_name}    ${display_name}
    ${browse_button}=    Set Variable    xpath=//button[contains(normalize-space(.),"Parcourir")] | //input[@value="Parcourir"] | //button[contains(normalize-space(.),"Browse")] | //input[@value="Browse"]
    ${new_group_button}=    Set Variable    xpath=//span[@title="Nouveau groupe" or @title="New Group"]
    ${short_name}=    Set Variable    xpath=//*[@id="page_x002e_ctool_x002e_admin-console_x0023_default-create-shortname"]
    ${display_name_field}=    Set Variable    xpath=//*[@id="page_x002e_ctool_x002e_admin-console_x0023_default-create-displayname"]
    ${create_button}=    Set Variable    xpath=//button[contains(normalize-space(.),"Créer un groupe")] | //button[contains(normalize-space(.),"Create Group")] | //input[@value="Créer un groupe"] | //input[@value="Create Group"]

    Wait Until Element Is Visible    ${browse_button}    10s
    Click Element    ${browse_button}
    Sleep    2s
    Wait Until Element Is Visible    ${new_group_button}    10s
    Click Element    ${new_group_button}
    Wait Until Element Is Visible    ${short_name}    10s
    Input Text    ${short_name}    ${group_name}
    Input Text    ${display_name_field}    ${display_name}
    Click Element    ${create_button}
    Wait Until Page Contains    ${group_name}    10s



Fermer navigateur
    Close Browser
