# Pour suppimer un aspect 
link_Model1 = "//tr[.//span[@class='value']]//td[1]//span[@class='value' and text()='"
link_Model2 = "']"
link_Aspect1 = "//span[@class='value' and contains(text(),'"
link_Aspect2 = "')]" 
link_Actions1 = "//span[contains(normalize-space(.),'"
link_Actions2 = "')]/ancestor::tr//span[normalize-space(.)='Actions']"
btn_Supprimer = "//tr[@role='menuitem' and @title='Supprimer']//td[contains(@class,'dijitMenuItemLabel') and normalize-space(.)='Supprimer']"
btn_Confirmer_Supp1 = "//div[contains(@class,'alfresco-dialogs-AlfDialog')][.//div[contains(.,'"
btn_Confirmer_Supp2 = "')]]//span[normalize-space(.)='Supprimer']"


Supprimer aspect
    ${vNom_Model} : Le nom de modele dans lequel vous souhaitez supprimer un aspect
    ${vNom_Aspect} : Le nom d'aspect que vous souhaitez supprimer
    [Arguments]    ${vNom_Model}    ${vNom_Aspect}
    # Diriger vers la page
    Go To    ${vURL}/share/page/console/admin-console/custom-model-manager
    Wait Until Element Is Visible    ${link_Model1}${vNom_Model}${link_Model2}
    # Choisir le Model dans lequel vous souhaitez supprimer un aspect
    Click Element    ${link_Model1}${vNom_Model}${link_Model2}
    Wait Until Element Is Visible    ${link_Actions1}${vNom_Aspect}${link_Actions2}
    # Clicker sur Menu Actions
    Mouse Over    ${link_Actions1}${vNom_Aspect}${link_Actions2}    
    Click Element    ${link_Actions1}${vNom_Aspect}${link_Actions2}
    # Clicker sur le bouton Supprimer
    Sleep    1s
    ${items}=    Get WebElements    ${btn_Supprimer}
    FOR    ${item}    IN    @{items}
        ${visible}=    Execute JavaScript    return arguments[0].offsetWidth > 0 && arguments[0].offsetHeight > 0;    ARGUMENTS    ${item}
        IF    ${visible}
            Scroll Element Into View    ${item}
            Click Element    ${item}
            BREAK
        END
    END
    # Clicker sur le bouton Supprimer(Confirmation)
    Wait Until Element Is Visible    ${btn_Confirmer_Supp1}${vNom_Aspect}${btn_Confirmer_Supp2}
    Click Element     ${btn_Confirmer_Supp1}${vNom_Aspect}${btn_Confirmer_Supp2}
    # Critere de succes
    Wait Until Element Is Not Visible    ${link_Aspect1}${vNom_Aspect}${link_Aspect2}     
