*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${vURL}                 http://localhost:8084

# Supprimer une page wiki elements
${link_Page1}           //a[normalize-space()='
${link_Page2}           ']
${link_DeletePage1}     //div[contains(@class,'wikipage')][.//a[normalize-space()='
${link_DeletePage2}     ']]//a[@class='delete-link']
${div_WikiListe}        //div[contains(@class,'pagelist')]

# Alerte de confirmation
${div_Alert}            //div[@id='prompt']
# Anglais : Delete
# Français : Supprimer
${btn_ConfirmAlert}     //div[@id='prompt']//button[contains(text(),'Supprimer')]

*** Keywords ***
Supprimer une page wiki
    [Arguments]    ${vNom_Site}    ${vNom_Page}    ${vTimeOut}

    Go To    ${vURL}/share/page/site/${vNom_Site}/wiki

    Wait Until Element Is Visible    ${div_WikiListe}    ${vTimeOut}
    Wait Until Element Is Visible    ${link_Page1}${vNom_Page}${link_Page2}    ${vTimeOut}

    Click Element    ${link_DeletePage1}${vNom_Page}${link_DeletePage2}

    # Handle alert
    Wait Until Element Is Visible    ${div_Alert}    ${vTimeOut}
    Click Button    ${btn_ConfirmAlert}

    # Vérification suppression
    Wait Until Element Is Visible    ${div_WikiListe}    ${vTimeOut}
    Wait Until Page Does Not Contain Element    ${link_Page1}${vNom_Page}${link_Page2}    ${vTimeOut}