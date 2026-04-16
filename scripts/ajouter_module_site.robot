*** Settings ***
Documentation     Ce fichier contient les scripts de test.
Library           SeleniumLibrary
Variables         ../ressources/locators/alfresco_locators.py
Variables         ../ressources/variables/global_variables.py
Resource          ../ressources/keywords/alfresco_keywords.robot

Suite Setup       Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
Suite Teardown    Logout

*** Variables ***
${vNom_Site}    g1307
${vModule}    Blog

*** Test Cases ***
Ajouter un module dans un site
    Ajouter un module dans un site    ${vNom_Site}    ${vModule}    
    