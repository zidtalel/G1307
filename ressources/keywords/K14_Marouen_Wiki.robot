*** Settings ***
Library           SeleniumLibrary
Variables         ../variables/global_variables.py

*** Variables ***
#Variables pour créer une page wiki
# ${vTitre_Page}    :    Variable pour stocker le titre de la page wiki
# ${vContenu_Page}  :    Variable pour stocker le contenu de la page wiki

#Locators pour créer une page wiki
${input_WikiTitle}      //input[@name='pageTitle']
${frame_WikiContent}    //iframe[contains(@id,'_ifr')]
${body_WikiContent}     //body[@id='tinymce']
${btn_WikiSave}         //*[contains(text(),'Enregistrer') or contains(text(),'Save')]

*** Keywords ***
Créer une page wiki
    [Arguments]    ${vNom_Site}    ${vTitre_Page}    ${vContenu_Page}

    Go To    ${vURL}/share/page/site/${vNom_Site}/wiki-create

    Wait Until Element Is Visible    ${input_WikiTitle}    15s

    Input Text    ${input_WikiTitle}    ${vTitre_Page}

    Select Frame    ${frame_WikiContent}
    Input Text    ${body_WikiContent}    ${vContenu_Page}
    Unselect Frame

    Click Element    ${btn_WikiSave}

    Wait Until Page Contains    ${vTitre_Page}