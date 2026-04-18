#Creer modele
link_OutilsAdmin ="//span[@id='HEADER_ADMIN_CONSOLE_text']"
link_ModelesGestionnaire ="//a[normalize-space(text())='Gestionnaire de modèles']"
btn_CreerModele ="//span[contains(@class,'alfresco-buttons-AlfButton') and contains(@class,'createButton')]"
input_EspaceNom ="//div[contains(@class,'dijitInputField')]//input[@name='namespace']"
input_Prefixer ="//div[contains(@class,'dijitInputField')]//input[@name='prefix']"
input_NomModele ="//div[contains(@class,'dijitInputField')]//input[@name='name']"
input_Createur = "//div[contains(@class,'dijitInputField')]//input[@name='author']"
input_DescriptionModele ="//textarea[@class='dijitTextBox dijitTextArea' and @name='description']"
btn_ValiderCreation ="//span[@role='button']//span[normalize-space()='Créer']"
creer un modele
    [Arguments]    ${EspaceNom}    ${Prefixe}    ${NomModele}    ${NomCreateur}    ${DescriptionModele}=
    # Aller dans Outils Admin
    Wait Until Element Is Visible    ${link_OutilsAdmin}    timeout=10s
    Click Element    ${link_OutilsAdmin}
    # Aller dans Gestionnaire de modèles
    Wait Until Element Is Visible    ${link_ModelesGestionnaire}    timeout=10s
    Click Element    ${link_ModelesGestionnaire}
    # Ouvrir le formulaire "Créer un modèle"
    Wait Until Element Is Visible    ${btn_CreerModele}    timeout=10s
    Click Element    ${btn_CreerModele}
    # Remplir le champ Espace de nom
    Wait Until Element Is Visible    ${input_EspaceNom}    timeout=10s
    Input Text    ${input_EspaceNom}    ${EspaceNom}    
    #Remplir le champ Prefixer
    Wait Until Element Is Visible    ${input_Prefixer}    timeout=10s
    Input Text    ${input_Prefixer}    ${Prefixe}
    # Remplir le champ Nom du modèle
    Wait Until Element Is Visible    ${input_NomModele}    timeout=10s
    Input Text    ${input_NomModele}    ${NomModele}
    # Remplir le champ Nom du Createur
    Wait Until Element Is Visible    ${input_Createur}    timeout=10s
    Input Text    ${input_Createur}    ${NomCreateur}
    # Remplir Description
    Wait Until Element Is Visible    ${input_DescriptionModele}    timeout=10s
    Input Text    ${input_DescriptionModele}    ${DescriptionModele}    
    # Valider la création
    Wait Until Element Is Visible    ${btn_ValiderCreation}    timeout=10s
    Click Element    ${btn_ValiderCreation}
    # Vérifier que le modèle apparaît dans la liste
    Wait Until Page Contains Element    //span[contains(text(),"${NomModele}")]    timeout=10s
