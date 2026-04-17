# Locators
# ${BTN_SUPPRIMER} //img[contains(@title,"Cliquez pour supprimer ''${vID}''")]
${CONFIRM_SUPPR}    //span[@id='ALF_CRUD_SERVICE_DELETE_CONFIRMATION_DIALOG_CONFIRM_label']
${BTN_NOUVEAU_FILTRE}    //span[@id='CREATE_FACET_BUTTON_label']

# Keywords

Supprimer Filtre
    [Arguments]    ${vID}    


    Go To                            ${vURL}/share/page/dp/ws/faceted-search-config
    Wait Until Element Is Visible    ${BTN_NOUVEAU_FILTRE}    10s

    Click Element    ${BTN_SUPPRIMER} 
    Wait Until Element Is Visible    ${CONFIRM_SUPPR}         10s
    Click Element                    ${CONFIRM_SUPPR}
