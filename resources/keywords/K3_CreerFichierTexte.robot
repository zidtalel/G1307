#Locators pour créer un fichier texte
link_FichiersPartager = "//*[@id='HEADER_SHARED_FILES_text']/a"
link_creer = "//button[contains(.,'Créer')]"
clik_PleinText = "//a[@href='/share/page/context/shared/create-content?destination={nodeRef}&itemId=cm:content&mimeType=text/plain']"
txt_Nom = "//input[@name='prop_cm_name']"
txt_Contenu ="//*[@name='prop_cm_content']"
txt_Titre ="//*[@name='prop_cm_title']"
txt_Description = "//*[@name='prop_cm_description']"
btn_Creer = "//*[normalize-space()='Créer']"

# Variables pour créer un fichier texte
# ${vNomFichier} : Variables pour créer un fichier texte  (ex: "Essai")
# ${ContenuFichier} : Variables pour le contenu du fichier texte 
# ${vTitre} : Variables pour le titre  du fichier texte
# ${vDescription} : Variables pour la description du fichier texte


Creer fichier text 
    [Arguments]    ${vNomFichier}    ${ContenuFichier}    ${vTitre}    ${vDescription}
    # Cliquer sur le lien "Fichiers partagés"
    Click Element    ${link_FichiersPartager}
    # Attendre que le lien "Créer" soit visible et cliquer dessus
    Wait Until Element Is Visible    ${link_creer}    ${vTimeout}
    # Cliquer sur "Créer" 
    Click Element    ${link_creer}
    # Attendre que l'option "Fichier texte" soit visible et cliquer dessus
    Wait Until Element Is Visible    ${clik_PleinText}    ${vTimeout}
    #choisir "Fichier texte" 
    Click Element    ${clik_PleinText}
    # Remplir les champs du formulaire de création de fichier texte
    Input Text    ${txt_Nom}    ${vNomFichier}
    Input Text    ${txt_Contenu}    ${ContenuFichier}
    Input Text    ${txt_Titre}    ${vTitre}
    Input Text    ${txt_Description}    ${vDescription}
    # Cliquer sur le bouton "Créer" pour créer le fichier texte
    Click Element    ${btn_Creer}
    Wait Until Page Contains    ${vNomFichier}    ${vTimeout}
    # Vérifier que le fichier texte a été créé avec succès en vérifiant la présence du nom du fichier sur la page
    Page Should Contain    ${vNomFichier}