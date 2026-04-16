*** Settings ***
Documentation     Ce fichier contient les scripts de test.
Library           SeleniumLibrary
Variables         ../ressources/locators/alfresco_locators.py
Variables         ../ressources/variables/global_variables.py
Resource          ../ressources/keywords/alfresco_keywords.robot

Suite Setup       Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
Suite Teardown    Logout

*** Test Cases ***
Selectionner les options du menu Outils Admin
    Main menu    HOME_text
    Sleep    2s
    Main menu    MY_FILES_text
    Sleep    2s
    Main menu    SHARED_FILES_text
    Sleep    2s
    Main menu    SITES_MENU_text
    Sleep    2s
    Main menu    TASKS_text
    Sleep    2s
    Main menu    PEOPLE_text
    Sleep    2s
    Main menu    REPOSITORY_text
    Sleep    2s
    Main menu    ADMIN_CONSOLE_text