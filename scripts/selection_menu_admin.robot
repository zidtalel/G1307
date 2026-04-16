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
    Main menu    ADMIN_CONSOLE_text
    Menu Outils Admin    application
    Sleep    2s
    Menu Outils Admin    category-manager
    Sleep    2s
    Menu Outils Admin    search-manager
    Sleep    2s
    Menu Outils Admin    tag-management
    Sleep    2s
    Menu Outils Admin    custom-model-manager
    Sleep    2s
    Menu Outils Admin    manage-sites
    Sleep    2s
    Menu Outils Admin    replication-jobs
    Sleep    2s
    Menu Outils Admin    groups
    Sleep    2s
    Menu Outils Admin    users