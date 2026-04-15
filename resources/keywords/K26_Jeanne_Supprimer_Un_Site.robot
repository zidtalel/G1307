# Localisateurs
# Options de configuration d'un site
div_SiteConfigDropdown="//div[@id='HEADER_SITE_CONFIGURATION_DROPDOWN']"
link_DeleteSiteOption="//tr[@id='HEADER_DELETE_SITE']"
btn_ConfirmDeleteSite="//span[@id='ALF_SITE_SERVICE_DIALOG_CONFIRMATION_label' and text()='OK']"
# Recherche de sites
btn_FindSite="//button[@id='template_x002e_site-finder_x002e_site-finder_x0023_default-button-button']"

Supprimer un site
    # vNomURLSite est l'identifiant du site tel qu'il apparaît dans son adresse URL (minuscules, chiffres et tirets seulement)
    # vNomSite est le nom du site tel qu'il apparaît sur l'entête du site
    [Arguments]    ${vNomURLSite}    ${vNomSite}
    # Préconditions
    # Navigation vers le site à supprimer
    Go To    ${vURL}/share/page/site/${vNomURLSite}/dashboard
    # Étapes de la suppression du site
    # Ouverture du menu "Options de configuration du site"
    Wait Until Element Is Visible    ${div_SiteConfigDropdown}
    Click Element    ${div_SiteConfigDropdown}
    # Sélection de l'option "Supprimer le site"
    Wait Until Element Is Visible    ${link_DeleteSiteOption}
    Click Element    ${link_DeleteSiteOption}
    # Confirmation de la suppression
    Wait Until Element Is Visible    ${btn_ConfirmDeleteSite}
    Click Element    ${btn_ConfirmDeleteSite}
    # Postconditions
    # Vérification que le site a bien été supprimé
    # Navigation vers la page Recherche de sites
    Go To    ${vURL}/share/page/site-finder
    # Clic sur bouton Rechercher
    Wait Until Element Is Visible    ${btn_FindSite}
    Click Element    ${btn_FindSite}
    # Vérification que le site supprimé n'est pas visible
    Element Should Not Be Visible    ${vNomSite}