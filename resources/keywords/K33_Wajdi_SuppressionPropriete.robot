# *** Settings ***
# Library    SeleniumLibrary

# *** Variables ***
# Navigation
${lnk_Outils_Admin}          xpath=//a[@title='Outils admin' and normalize-space()='Outils admin']
${lnk_Gestionnaire_Modeles}  xpath=//a[@title='Gestionnaire de modèles' and @href='custom-model-manager']

# Sélection modèle / aspect
${lbl_Modele_1}              xpath=//span[contains(@class,'value') and contains(text(),'
${lbl_Modele_2}              ')]

${lbl_Aspect_1}              xpath=//span[contains(@class,'value') and contains(text(),'
${lbl_Aspect_2}              ')]

# Propriété
${link_Propriete_1}          xpath=//td[contains(@class,'nameColumn')]//span[contains(@class,'value') and contains(text(),'
${link_Propriete_2}          ')]

# Actions
${btn_Action_1}              xpath=//span[@class='value' and text()='
${btn_Action_2}              ']/ancestor::tr//span[text()='Actions']

# Menu supprimer
${btn_Supprimer}             xpath=//div[contains(@class,'dijitPopup') and contains(@class,'Popup')]//tr[@title='Supprimer']//td[contains(@class,'dijitMenuItemLabel')]

# Confirmation
${btn_Confirmer_Suppression}    xpath=//div[contains(@class,'dijitDialog')]//span[normalize-space()='Supprimer']


# *** Keywords ***
Supprimer une propriété dans un aspect
    [Documentation]    Supprime une propriété dans un aspect existant d'un modèle Alfresco.
    ...                ${vNomModele}     : nom du modèle
    ...                ${vNomAspect}     : nom de l'aspect
    ...                ${vNomPropriete}  : nom complet de la propriété à supprimer
    ...                ${vURL}           : URL de l'application Alfresco
    [Arguments]    ${vNomModele}    ${vNomAspect}    ${vNomPropriete}  


    # Sélectionner modèle
    Wait Until Element Is Visible    ${lbl_Modele_1}${vNomModele}${lbl_Modele_2}    10s
    Scroll Element Into View         ${lbl_Modele_1}${vNomModele}${lbl_Modele_2}
    Click Element                    ${lbl_Modele_1}${vNomModele}${lbl_Modele_2}

    # Sélectionner aspect
    Wait Until Element Is Visible    ${lbl_Aspect_1}${vNomAspect}${lbl_Aspect_2}    10s
    Scroll Element Into View         ${lbl_Aspect_1}${vNomAspect}${lbl_Aspect_2}
    Click Element                    ${lbl_Aspect_1}${vNomAspect}${lbl_Aspect_2}

    # Sélectionner propriété
    Wait Until Element Is Visible    ${link_Propriete_1}${vNomPropriete}${link_Propriete_2}    10s
    Mouse Over                       ${link_Propriete_1}${vNomPropriete}${link_Propriete_2}
    Sleep    1s

    # Actions
    Wait Until Element Is Visible    ${btn_Action_1}${vNomPropriete}${btn_Action_2}    10s
    Click Element                    ${btn_Action_1}${vNomPropriete}${btn_Action_2}

    # Supprimer
    Wait Until Element Is Visible    ${btn_Supprimer}    10s
    Click Element                    ${btn_Supprimer}

    # Confirmation
    Wait Until Element Is Visible    ${btn_Confirmer_Suppression}    10s
    Click Element                    ${btn_Confirmer_Suppression}

    # Vérification finale
    Wait Until Element Is Not Visible    ${link_Propriete_1}${vNomPropriete}${link_Propriete_2}    10s


    