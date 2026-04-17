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

K28 - Supprimer Modele
    [Arguments]    ${vNom_Modele}

    Go To    http://localhost:8084/share/page/console/admin-console/custom-model-manager

    # =========================
    # MODELE
    # =========================
    ${locator_Modele}=    Evaluate    "${MODELE}".format("${vNom_Modele}")
    Wait Until Element Is Visible    ${locator_Modele}    20s

    # =========================
    # ACTIONS
    # =========================
    ${locator_Menu}=    Evaluate    "${MENU_ACTIONS}".format("${vNom_Modele}")
    Click Element    ${locator_Menu}

    Wait Until Page Contains    Supprimer    10s

    # =========================
    # SUPPRIMER
    # =========================
    # 🔥 clic JS ULTRA fiable (cible exact ton menu)
    Execute JavaScript    document.querySelectorAll("td.dijitMenuItemLabel").forEach(e=>{if(e.innerText.trim()==="Supprimer"){e.click();}});

    Sleep    2s

    # confirmation (si popup)
    Execute JavaScript    document.querySelectorAll("span").forEach(e=>{if(e.innerText.trim()==="Supprimer"){e.click();}});

    Sleep    2s

    Reload Page

    Page Should Not Contain    Modele_Mohamed_Gharsallah