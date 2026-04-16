*** Settings ***
Documentation     Ce fichier contient les scripts de test.
Library           SeleniumLibrary
Variables         ../ressources/locators/alfresco_locators.py
Variables         ../ressources/variables/global_variables.py
Resource          ../ressources/keywords/alfresco_keywords.robot

Suite Setup       Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
Suite Teardown    Logout

*** Test Cases ***
Chager la disposition du tableau de bord
    Changer de disposition    -1-column-button
    Sleep    2s
    Changer de disposition    -2-columns-wide-right-button
    Sleep    2s
    Changer de disposition    -2-columns-wide-left-button
    Sleep    2s
    Changer de disposition    -3-columns-button
    Sleep    2s
    Changer de disposition    -4-columns-button