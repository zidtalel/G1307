*** Settings ***
Documentation     Ce fichier contient les scripts de test.
Library           SeleniumLibrary
Variables         ../ressources/locators/alfresco_locators.py
Variables         ../ressources/variables/global_variables.py
Resource          ../ressources/keywords/alfresco_keywords.robot

Suite Setup       Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
Suite Teardown    Logout

*** Variables ***
${vModele}    g1307

*** Test Cases ***
Selectionner les options du menu actions de modele
    Main menu    ADMIN_CONSOLE_text
    Menu Outils Admin    custom-model-manager
    Menu Action    ${vModele}    Activer
    Sleep    2s
    Menu Action        ${vModele}    Désactiver
    Sleep    2s
    Menu Action    ${vModele}    Exporter
    Sleep    2s
    Menu Action    ${vModele}    Modifier
    Sleep    2s
    Click Element    ${btn_Annuler_Modifier_Modele}
    Sleep    2s
    Menu Action    ${vModele}    Supprimer
    Sleep    2s
    Wait Until Element Is Visible    ${btn_Annuler_Supprimer_Modele}
    Click Element    ${btn_Annuler_Supprimer_Modele}
    Sleep    2s

