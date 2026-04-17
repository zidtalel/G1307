# =========================
# LOGIN
# =========================
txt_UserName = "name=username"
txt_Password = "name=password"
btn_Login    = "xpath=//button[contains(text(),'Connexion')]"

lblTitle = "//div[@id='HEADER_TITLE_BAR']/header/div"


# =========================
# MODEL
# =========================
MODELE = "//span[text()='{}']"

MENU_ACTIONS = "//span[text()='{}']/ancestor::tr//span[contains(text(),'Actions')]"

# Menu supprimer (Dojo)
SUPPRIMER_MENU = "//td[normalize-space()='Supprimer']"

# Confirmation popup
CONFIRM_SUPPRIMER = "//span[contains(text(),'Supprimer')]"


# Menu action
menu_Actions1 = "//td[contains(@class,'nameColumn')]//span[text()='"
menu_Actions2 ="']/ancestor::tr/td[contains(@class,'actionsColumn')]//span[text()='Actions']"
menu_Action_Option1 = "//div[@role='region']//img[@title='"
menu_Action_Option2 = "']"
btn_Annuler_Supprimer_Modele = "//div[@role='dialog' and .//span[text()='Supprimer le modèle']]//span[@role='button' and .//span[text()='Annuler']]"
btn_Annuler_Modifier_Modele = "//*[@id='CMM_EDIT_MODEL_DIALOG_CANCEL_label']"

K28 - Supprimer Modele
    [Arguments]    ${vNom_Modele}

    Go To    http://localhost:8084/share/page/console/admin-console/custom-model-manager

   
    Menu Action    ${vNom_Modele}    Supprimer
    Click Element    //div[@role='dialog' and .//span[text()='Supprimer le modèle']]//span[@role='button' and .//span[text()='Supprimer']]
    Sleep    2s

    Reload Page

    Page Should Not Contain    ${vNom_Modele}
Menu Action
    # Ce mot clé permet de cliquer sur l'une des options du menu Actions d'un modèle.
    # Il prend deux paramètres :
    # vModele est le nom du modèle.
    # vOption est l'option à activer
    # vOption peut avoir l'une des valeurs suivantes :
    # Activer
    # Désactiver
    # Modifier
    # Supprimer
    # Exporter
    [Arguments]    ${vModele}    ${vOption}
    Wait Until Element Is Visible    ${menu_Actions1}${vModele}${menu_Actions2}
    Click Element    ${menu_Actions1}${vModele}${menu_Actions2}
    Wait Until Element Is Visible    ${menu_Action_Option1}${vOption}${menu_Action_Option2}
    Click Element    ${menu_Action_Option1}${vOption}${menu_Action_Option2}