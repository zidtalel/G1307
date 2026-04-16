*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../ressources/keywords/alfresco_keywords.robot
Resource          ../ressources/keywords/K14_Marouen_Wiki.robot
Variables         ../ressources/variables/global_variables.py

Suite Setup       Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
Suite Teardown    Close Browser

*** Test Cases ***
K14 - Créer une page wiki
    ${random}=    Generate Random String    5
    ${titre}=     Set Variable    PageWiki${random}
    Créer une page wiki    g1307    ${titre}    Ceci est une page wiki de test.







