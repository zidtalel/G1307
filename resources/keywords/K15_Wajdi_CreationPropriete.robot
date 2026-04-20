
# Navigation
${lnk_Outils_Admin}                xpath=//a[@title='Outils admin' and normalize-space()='Outils admin']
${lnk_Gestionnaire_Modeles}        xpath=//a[@title='Gestionnaire de modèles' and @href='custom-model-manager']

# Sélection modèle / aspect
${lbl_Modele_1}                    xpath=//span[@class='value' and normalize-space()='
${lbl_Modele_2}                    ']

${lbl_Aspect_1}                    xpath=//span[@class='value' and normalize-space()='
${lbl_Aspect_2}                    ']

# Formulaire création propriété
${btn_Creer_Propriete}             xpath=//span[normalize-space()='Créer une propriété']
${txt_Nom_Propriete}               name=name
${txt_Etiquette_Affichage}         name=title
${txt_Valeur_Defaut}               name=defaultValue
${chk_Multiple}                    name=multiple

# Listes déroulantes
${lst_Type_Donnee}                 xpath=//input[@name='datatype']/ancestor::table[@role='listbox']
${lst_Requise}                     xpath=//input[@name='mandatory']/ancestor::table[@role='listbox']
${lst_Contrainte}                  xpath=//input[@name='constraint']/ancestor::table[@role='listbox']
${lst_Indexation}                  xpath=//input[@name='indexing_txt']/ancestor::table[@role='listbox']

# Popup visible des listes Dojo
${popup_visible}                   xpath=//div[contains(@class,'dijitMenuPopup') and not(contains(@style,'display:none')) and not(contains(@style,'display: none'))]

# Bouton valider
${btn_Creer}                       xpath=//span[@id='CMM_CREATE_PROPERTY_DIALOG_CREATE_label' and normalize-space()='Créer']

#Créer une propriété dans un aspect
# ${vModele}          : nom du modèle existant
# ${vAspect}          : nom de l'aspect existant
# ${vNom}             : nom technique de la propriété
# ${vEtiquette}       : étiquette d'affichage
# ${vDescription}     : description (peut être ${EMPTY})
# ${vTypeDonnee}      : type de donnée (ex: d:text)
# ${vRequise}         : Facultative / Obligatoire
# ${vMultiple}        : True / False
# ${vValeurParDefaut} : valeur par défaut (peut être ${EMPTY})
# ${vContrainte}      : ex: Aucun
# ${vIndexation}      : ex: Texte libre
    
    
    [Arguments]    ${vModele}    ${vAspect}    ${vNom}    ${vEtiquette}    ${vDescription}
    ...            ${vTypeDonnee}=d:text    ${vRequise}=Facultative    ${vMultiple}=False
    ...            ${vValeurParDefaut}=${EMPTY}    ${vContrainte}=Aucun    ${vIndexation}=Texte libre

    # Navigation
    Wait Until Element Is Visible    ${lnk_Outils_Admin}    10s
    Click Element                    ${lnk_Outils_Admin}
    Wait Until Element Is Visible    ${lnk_Gestionnaire_Modeles}    10s
    Click Element                    ${lnk_Gestionnaire_Modeles}

    # Sélectionner le modèle
    Wait Until Element Is Visible    ${lbl_Modele_1}${vModele}${lbl_Modele_2}    10s
    Scroll Element Into View         ${lbl_Modele_1}${vModele}${lbl_Modele_2}
    Click Element                    ${lbl_Modele_1}${vModele}${lbl_Modele_2}

    # Sélectionner l'aspect
    Wait Until Element Is Visible    ${lbl_Aspect_1}${vAspect}${lbl_Aspect_2}    10s
    Scroll Element Into View         ${lbl_Aspect_1}${vAspect}${lbl_Aspect_2}
    Click Element                    ${lbl_Aspect_1}${vAspect}${lbl_Aspect_2}

    # Ouvrir le formulaire
    Wait Until Element Is Visible    ${btn_Creer_Propriete}    10s
    Click Element                    ${btn_Creer_Propriete}

    # Champs texte
    Wait Until Element Is Visible    ${txt_Nom_Propriete}    10s
    Input Text                       ${txt_Nom_Propriete}    ${vNom}
    Input Text                       ${txt_Etiquette_Affichage}    ${vEtiquette}

    IF    '${vDescription}' != ''
        Execute Javascript    document.querySelector("textarea[name='description']").value="${vDescription}";
    END

    # Type de donnée
    Click Element                    ${lst_Type_Donnee}
    Wait Until Element Is Visible    ${popup_visible}//*[normalize-space(.)='${vTypeDonnee}']    10s
    Click Element                    ${popup_visible}//*[normalize-space(.)='${vTypeDonnee}']

    # Requise
    Click Element                    ${lst_Requise}
    Wait Until Element Is Visible    ${popup_visible}//*[normalize-space(.)='${vRequise}']    10s
    Click Element                    ${popup_visible}//*[normalize-space(.)='${vRequise}']

    # Multiple
    IF    '${vMultiple}' == 'True'
        Select Checkbox    ${chk_Multiple}
    END

    # Valeur par défaut
    IF    '${vValeurParDefaut}' != ''
        Input Text    ${txt_Valeur_Defaut}    ${vValeurParDefaut}
    END

    # Contrainte
    ${contrainte_id}=    Get Element Attribute    ${lst_Contrainte}    id
    Click Element                    ${lst_Contrainte}
    Wait Until Element Is Visible    xpath=//*[@id='${contrainte_id}_menu']//*[normalize-space(.)='${vContrainte}']    10s
    Click Element                    xpath=//*[@id='${contrainte_id}_menu']//*[normalize-space(.)='${vContrainte}']

    # Indexation
    ${indexation_id}=    Get Element Attribute    ${lst_Indexation}    id
    Click Element                    ${lst_Indexation}
    Wait Until Element Is Visible    xpath=//*[@id='${indexation_id}_menu']//*[normalize-space(.)='${vIndexation}']    10s
    Click Element                    xpath=//*[@id='${indexation_id}_menu']//*[normalize-space(.)='${vIndexation}']

    # Valider
    Wait Until Element Is Visible    ${btn_Creer}    10s
    Click Element                    ${btn_Creer}

    # Vérification
    Wait Until Element Is Visible    xpath=//span[contains(@class,'value') and contains(.,'${vNom}')]    10s
    Element Should Be Visible        xpath=//span[contains(@class,'value') and contains(.,'${vNom}')]