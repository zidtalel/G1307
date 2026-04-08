# Options de disposition du tableau de bord
img_RoueDentee = "//div[@id='HEADER_CUSTOMIZE_USER_DASHBOARD']/img"
btn_ChangerDisposition = "//*[@id='template_x002e_customise-layout_x002e_customise-user-dashboard_x0023_default-change-button-button']"
btn_Mode = "//button[@id='template_x002e_customise-layout_x002e_customise-user-dashboard_x0023_default-select-button-dashboard"
btn_OK = "//button[@id='template_x002e_customise-dashlets_x002e_customise-user-dashboard_x0023_default-save-button-button']"


Changer de disposition
    # Ce mot clé permet de changer la disposition des dashlets sur la tableau de bord principal
    # vMode est le mode de colonne affiché pour contenir les dashlets.
    # Ce paramètre peut avoir l'une des valeurs suivantes :
    # -1-column-button
    # -2-columns-wide-right-button
    # -2-columns-wide-left-button
    # -3-columns-button
    # -4-columns-button
    [Arguments]    ${vMode}
    sleep    2s
    # Click sur la roue dentée
    Click Element    ${img_RoueDentee}
    # Click sur le bouton "Changer la disposition"
    Wait Until Element Is Visible    ${btn_ChangerDisposition}
    Click Element    ${btn_ChangerDisposition}
    # Click sur le bouton "Sélectionner" de l'un des modes
    Run Keyword And Ignore Error    Click Element    ${btn_Mode}${vMode}']
    # Click sur le bouton "Ok"
    Run Keyword And Ignore Error    Click Element    ${btn_OK}
