# Locators
class SupprimerSite:
    img_configuration = "//div[@id='HEADER_SITE_CONFIGURATION_DROPDOWN']"
    link_supprimerSite = "//td[@id='HEADER_DELETE_SITE_text']"
    btn_okSupprimer = "//span[@id='ALF_SITE_SERVICE_DIALOG_CONFIRMATION_label']"
    link_monProfile = "//td[@id='HEADER_USER_MENU_PROFILE_text']"
    link_corbeille = "//a[text()='Corbeille']"
    btn_supprimerCorbeille1 = "//div[text()='"
    btn_supprimerCorbeille2 = "']/ancestor::tr//button[text()='Supprimer']"
    btn_okConfirmation = "//button[text()='OK']"


Supprimer Definitivement Un Site

    # nomSite : Contient le nom du site a supprimer

    [Arguments]    ${nomSite}
    Go To    url=${vURL}/share/page/site/${nomSite}/dashboard
    Wait Until Element Is Visible    ${SupprimerSite.img_configuration}
    Click Element    ${SupprimerSite.img_configuration}
    Click Element    ${SupprimerSite.link_supprimerSite}
    Click Element    ${SupprimerSite.btn_okSupprimer}
    Click Element    ${Connexion.link_user}
    Click Element    ${SupprimerSite.link_monProfile}
    Wait Until Element Is Visible    ${SupprimerSite.link_corbeille}
    Click Element    ${SupprimerSite.link_corbeille}
    Wait Until Element Is Visible    ${SupprimerSite.btn_supprimerCorbeille1}${nomSite}${SupprimerSite.btn_supprimerCorbeille2}
    Click Element    ${SupprimerSite.btn_supprimerCorbeille1}${nomSite}${SupprimerSite.btn_supprimerCorbeille2}
    Click Element    ${SupprimerSite.btn_okConfirmation}
