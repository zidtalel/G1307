# Locators Filtre
${BTN_NOUVEAU_FILTRE}    //span[@id='CREATE_FACET_BUTTON_label']
${INPUT_ID_FILTRE}       //input[@name='filterID']
${INPUT_NOM_FILTRE}     //input[@name='displayName']
${CHECKBOX_ACTIF}      //input[@name='isEnabled' and @type='checkbox']
${SELECT_PROP}        //input[@id='FORM_FACET_QNAME_CONTROL']
${SELECT_TRI}        //table[@widgetid='FORM_SORTBY_CONTROL']
${NB_MAX_FILTRE}    //div[@id='FORM_MAX_FILTERS']//input[@role='spinbutton']
${LONG_MIN}         //div[@id='FORM_MIN_FILTER_VALUE_LENGTH']//input[@role='spinbutton']
${NB_RESULT}        //div[@widgetid='FORM_HIT_THRESHOLD']//input[@role='spinbutton']
${DISPO_FILTRE}          //table[@id='FORM_SCOPE_CONTROL']
${MENU_DISPO}            //td[contains(@id,'FORM_SCOPE_CONTROL_menu')]//td[normalize-space()='${vDispo}']
${BTN_ENREGISTRER}       //span[contains(@class,'dijitButtonText') and text()='Enregistrer']
${BTN_SUPPRIMER}    //img[contains(@title,"Cliquez pour supprimer ''${vID}''")]
${CONFIRM_SUPPR}    //span[@id='ALF_CRUD_SERVICE_DELETE_CONFIRMATION_DIALOG_CONFIRM_label']

Creation nouveau filtre
    [Arguments]    ${vID}    ${vNom}    ${vEtat}    ${vProp}    ${vTri}    ${vNbMax}    ${vLongMin}    ${vNbResult}    ${vDispo}


    # Navigation
    Go To    ${vURL}/share/page/dp/ws/faceted-search-config
    Wait Until Element Is Visible    ${BTN_NOUVEAU_FILTRE}    10s
    Click Element                    ${BTN_NOUVEAU_FILTRE}

    # ID et Nom
    Wait Until Element Is Visible    ${INPUT_ID_FILTRE}    10s
    Input Text    ${INPUT_ID_FILTRE}     ${vID}
    Input Text    ${INPUT_NOM_FILTRE}    ${vNom}

    # Checkbox
    ${checked}=    Get Element Attribute    ${CHECKBOX_ACTIF}    aria-checked
    IF    '${vEtat}' == 'true' and '${checked}' != 'true'
        Click Element    ${CHECKBOX_ACTIF}
    ELSE IF    '${vEtat}' == 'false' and '${checked}' == 'true'
        Click Element    ${CHECKBOX_ACTIF}
    END

    # Propriété 
    Scroll Element Into View    ${SELECT_PROP}
    Click Element               ${SELECT_PROP}
    Input Text                  ${SELECT_PROP}    ${vProp}
    Sleep                       2s
    Press Keys                  ${SELECT_PROP}    ARROW_DOWN
    Sleep                       1s
    Press Keys                  ${SELECT_PROP}    RETURN
    Sleep                       1s

    # Tri 
    Scroll Element Into View    ${SELECT_TRI}
    Click Element               ${SELECT_TRI}
    Sleep                       1s
    Press Keys                  ${SELECT_TRI}    ARROW_DOWN
    Sleep                       1s
    Press Keys                  ${SELECT_TRI}    RETURN
    Sleep                       1s
# champ visible
    Double Click Element        ${NB_MAX_FILTRE}
    Input Text                  ${NB_MAX_FILTRE}    ${vNbMax}
    Double Click Element        ${LONG_MIN}
    Input Text                  ${LONG_MIN}         ${vLongMin}

    Scroll Element Into View    ${NB_RESULT}
    Double Click Element        ${NB_RESULT}
    Input Text                  ${NB_RESULT}        ${vNbResult}


    # Enregistrer
    Scroll Element Into View         ${BTN_ENREGISTRER}
    Wait Until Element Is Enabled    ${BTN_ENREGISTRER}    15s
    Click Element                    ${BTN_ENREGISTRER}
