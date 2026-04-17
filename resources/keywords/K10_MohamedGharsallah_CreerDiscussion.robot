

# =========================
# LOGIN
# =========================
txt_UserName = "name=username"
txt_Password = "name=password"
btn_Login    = "xpath=//button[contains(text(),'Connexion')]"

lblTitle = "//div[@id='HEADER_TITLE_BAR']/header/div"

# =========================
# DISCUSSION
# =========================
URL_DISCUSSION = "http://localhost:8084/share/page/site/g1307/discussions-createtopic"

TITLE_INPUT = "//input[@name='title']"

TAG_INPUT = "//input[@id='HEADER_SEARCHBOX_FORM_FIELD']"
BTN_AJOUTER_TAG = "//button[normalize-space()='Ajouter']"

BTN_ENREGISTRER = "//button[normalize-space()='Enregistrer']"

K10 - Creer Sujet Discussion
    [Arguments]    ${vTitre}    ${vMessage}    ${vTag}

    Go To    ${URL_DISCUSSION}

    Wait Until Element Is Visible    ${TITLE_INPUT}    20s

    # =========================
    # TITRE
    # =========================
    Input Text    ${TITLE_INPUT}    ${vTitre}

    # =========================
    # TEXTE (JS stable)
    # =========================
     Execute JavaScript     tinymce.activeEditor.setContent('<p>"${vMessage}"</p>');

    # =========================
    # TAG
    # =========================
    Input Text    ${TAG_INPUT}    ${vTag}
    Click Element    ${BTN_AJOUTER_TAG}

    # =========================
    # ENREGISTRER
    # =========================
    Click Element    ${BTN_ENREGISTRER}

    # =========================
    # VERIFICATION
    # =========================
    Wait Until Page Contains    ${vTitre}    10s
