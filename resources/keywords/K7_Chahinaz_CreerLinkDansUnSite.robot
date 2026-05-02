# Locators Creer un link dans un site existant
  lnk_Link = "//*[@id='HEADER_SITE_LINKS_text']/a"
  btn_neauveau = "//button[text()='Nouveau lien']"
  input_Nom_link="//*[@id='template_x002e_linkedit_x002e_links-linkedit_x0023_default-title']"
  input_URL_link="//*[@id='template_x002e_linkedit_x002e_links-linkedit_x0023_default-url']"
  input_Description="//*[@id='template_x002e_linkedit_x002e_links-linkedit_x0023_default-description']"
  chk_Box="//*[@id='template_x002e_linkedit_x002e_links-linkedit_x0023_default-internal']"
  ajout_tag="//*[@id='template_x002e_linkedit_x002e_links-linkedit_x0023_default-tag-input-field']"
  btn_ajouter_Tag="//*[@id='template_x002e_linkedit_x002e_links-linkedit_x0023_default-add-tag-button-button']"
  btn_Enregistrer="//*[@id='template_x002e_linkedit_x002e_links-linkedit_x0023_default-ok-button']"

créer un lien dans un site déjà existant  
  #vNom_Site :est le nom du site cible.
  #vNom_Lien: est le nom du link a creer.
  #vURL_Lien : URL de lien 
  #vDescription: description de link creer 
  #vInterne: Checkbox (Les liens marqués ''Interne'' seront ouverts dans la même fenêtre, sinon les liens seront ouverts dans
  une nouvelle fenêtre/un nouvel onglet)
  #vTag: varriable pour ajouter le tag
    [Arguments]    ${vNom_Site}    ${vNom_Lien}    ${vURL_Lien}    ${vDescription}    ${vInterne}    ${vTag}
    # Aller dans le site
    Go To    ${vURL}/share/page/site/${vNom_Site}/dashboard
    # Précondition : Vérifier que la page du site cible est bien chargée. 
    #Si le site ne contient pas le module "Lien", l’ajouter en utilisant le keyword Ajouter un module dans un site.
    Page Should Contain Link    ${lnk_Link}
    # Cliquer sur "Link"
    Click Element    ${lnk_Link}
    # Cliquer sur "nouuveu Lien"
    Wait Until Element Is Visible    ${btn_neauveau}
    Click Element    ${btn_neauveau}
    # Remplir le formulaire
    Wait Until Element Is Visible    ${input_Nom_link}
    Input Text    ${input_Nom_link}    ${vNom_Lien}
    Input Text    ${input_URL_link}     ${vURL_Lien}
    # description 
    Input Text    ${input_Description}     ${vDescription}
    # cocher la case interne
    IF    '${vInterne}' == '1'
        Select Checkbox    ${chk_Box}
    ELSE
        Unselect Checkbox    ${chk_Box}
    END
    # ajouter un tag populaire de ce site 
    Input Text    ${ajout_tag}    ${vTag}
    Click Element    ${btn_ajouter_Tag}
    # Enregistrer
    Click Element    ${btn_Enregistrer}
    # Vérifier que le lien est bien ajouté
    Wait Until Page Contains    ${vNom_Lien}
