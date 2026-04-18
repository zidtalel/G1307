#locators
#Creer dossier
btn_Creer = "//button[contains(text(),'Créer')]"
btn_CreerDossier = "//span[normalize-space()='Dossier']"
input_NomDossier = "//input[contains(@id,'name')]"
input_TitreDossier = "//input[contains(@id,'title')]"
input_DescriptionDossier = "//textarea[contains(@id,'description')]"
btn_EnregistrerDossier ="//button[normalize-space()='Enregistrer']"
link_MesFichiers = "//span[@id='HEADER_MY_FILES_text']"
Aller dans Mes fichiers et creer un dossier
    [Arguments]    ${NomDossier}    ${TitreDossier}    ${DescriptionDossier}
    # Aller dans Mes fichiers    
    Wait Until Element Is Visible    ${link_MesFichiers}    timeout=10s  
    Click Element                    ${link_MesFichiers}       
    #Cliquer sur "Créer..."
    Wait Until Element Is Visible    ${btn_Creer}    timeout=10s
    Click Element                    ${btn_Creer}
    # Cliquer sur "Dossier"
    Wait Until Element Is Visible    ${btn_CreerDossier}    timeout=10s
    Click Element                    ${btn_CreerDossier}
     # Remplir le formulaire
    Wait Until Element Is Visible    ${input_NomDossier}    timeout=10s
    Input Text    ${input_NomDossier}    ${NomDossier}
    Input Text    ${input_TitreDossier}    ${TitreDossier}
    Input Text    ${input_DescriptionDossier}    ${DescriptionDossier}    
    # Enregistrer
    Click Element    ${btn_EnregistrerDossier}
    # Vérifier la création
    Wait Until Page Contains Element    //span[contains(text(),"${NomDossier}")]    timeout=10s
    
