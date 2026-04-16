
#Locators pour supprimer un dossier

#cliquer sur le lien "Fichiers partagés"
link_FichiersPartager = "//*[@id='HEADER_SHARED_FILES_text']/a"
#cliquer sur le dossier à supprimer
link_Dossier1 = "//a[normalize-space()='"
link_Dossier2 = "']"
#cliquer sur le lien le nom du dossier
link_NomDossier1 = "//span[@class='label']/a[normalize-space()='"
link_NomDossier2 = "']"
#cliquer sur le lien "Supprimer" du menu d'action du dossier
link_SupprimerDossier = "//div[@id='onActionDelete']//a"
#cliquer sur le bouton "Supprimer" de la boîte de confirmation
btn_Supprimer ="//span[normalize-space()='Supprimer']"

#Variables pour supprimer un dossier
${vNomDossier}  :  Variable pour stocker le nom du dossier à supprimer

Supprimer un dossier
    [Arguments]    ${vNomDossier}
    # Cliquer sur le lien "Fichiers partagés"
    Click Element    ${link_FichiersPartager}
    Wait Until Page Contains Element    ${link_Dossier1}${vNomDossier}${link_Dossier2}    ${vTimeout}
    # Cliquer sur le dossier à supprimer
    Click Element    ${link_Dossier1}${vNomDossier}${link_Dossier2}
    Wait Until Page Contains Element    ${link_NomDossier1}${vNomDossier}${link_NomDossier2}    ${vTimeout}
    # Cliquer sur le lien du dossier pour accéder à sa page de détails
    Click Element   ${link_NomDossier1}${vNomDossier}${link_NomDossier2}
    Wait Until Page Contains Element    ${link_SupprimerDossier}    ${vTimeout}
    #cliquer sur le lien "Supprimer le Dossier"
    Click Element    ${link_SupprimerDossier}
    #cliquer sur le Bouton "Supprimer "
    Click Element    ${btn_Supprimer}
    # Vérifier que le dossier a été supprimé avec succès en vérifiant l'absence du nom du dossier sur la page
    Wait Until Element Is Not Visible    ${vNomDossier}    ${vTimeout}    
    Page Should Not Contain    ${vNomDossier}