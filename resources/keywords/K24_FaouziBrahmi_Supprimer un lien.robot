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

Aller vers site alfresco
    [Arguments]    ${site_name}
    Go To    ${URL}/site/${site_name}/dashboard
    Wait Until Page Contains    ${site_name}    10s

Aller vers page liens
    [Arguments]    ${site_name}
    Go To    ${URL}/site/${site_name}/links
    Wait Until Page Contains    ${site_name}    10s
    Sleep    3s
Supprimer un lien
    [Arguments]    ${link_name}
    ${checkbox}=    Set Variable    xpath=//a[normalize-space(.)="${link_name}"]/ancestor::tr[1]//input[@type="checkbox"] | //a[normalize-space(.)="${link_name}"]/ancestor::div[contains(@class,"yui-dt-rec") or contains(@class,"item")][1]//input[@type="checkbox"]
    ${delete_action}=    Set Variable    xpath=//div[contains(@class,"delete-link")]//a[.//span[normalize-space(.)="Supprimer"]]

    Wait Until Element Is Visible    ${checkbox}    10s
    Click Element    ${checkbox}
    Sleep    2s
    Wait Until Element Is Visible    ${delete_action}    10s
    Click Element    ${delete_action}
    Wait Until Element Is Visible    ${CONFIRM_DELETE_BUTTON}    10s
    Click Element    ${CONFIRM_DELETE_BUTTON}




Verifier que le lien n existe plus
    [Arguments]    ${link_name}
    ${link_row}=    Set Variable    xpath=//a[normalize-space(.)="${link_name}"] | //span[normalize-space(.)="${link_name}"] | //div[normalize-space(.)="${link_name}"]
    Wait Until Keyword Succeeds    20 sec    2 sec    Page Should Not Contain Element    ${link_row}


Fermer navigateur
    Close Browser
