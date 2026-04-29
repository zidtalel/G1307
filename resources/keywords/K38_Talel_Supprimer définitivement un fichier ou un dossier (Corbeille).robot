*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem

*** Variables ***
${vURL}    https://34.122.124.94/
${vButtonDelete1}    //a[text()='
${vButtonDelete2}    ']/ancestor::tr/td//button[text()='Delete']

*** Keywords *** 
Supprimer Définitivement Fichier
    [Arguments]    ${vNomDeFichier}    ${vUtilisateur}
    Go To    ${vURL}share/page/user/${vUtilisateur}/user-trashcan
    Sleep    1s
    Click Element    ${vButtonDelete1}${vNomDeFichier}${vButtonDelete2}
    Sleep    1s
    Click Element    //div[@id='prompt']//button[text()='OK']
