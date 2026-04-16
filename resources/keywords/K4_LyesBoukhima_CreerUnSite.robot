# site page locators
link_site="//span[@id='HEADER_SITES_MENU_text']"
link_creation_site="//td[@id='HEADER_SITES_MENU_CREATE_SITE_text']"
input_Nom_site="//input[@class='dijitReset dijitInputInner' and @name='title' ]"
input_Nom_URL="//input[@class='dijitReset dijitInputInner' and @name='shortName' ]"
input_description="//textarea[@class='dijitTextBox dijitTextArea' and @name='description']"
radio_visibilite="//input[@name='visibility' and @value='CHOIX']"
btn_creer="//span[@id='CREATE_SITE_DIALOG_OK']"
page_titre_site="//a[@class='alfresco-navigation-_HtmlAnchorMixin' and @title='NOM']"

creation site
    # ${vNomSite}    : Nom affiché du site (ex: MonSite)
    # ${vNomURL}     : Identifiant URL du site, sans espaces (ex: mon-site)
    # ${vDescription}: Description du site
    # ${vVisibilite} : Visibilité du site — valeurs possibles : PUBLIC, MODERATE, ListePrivee
    # ${vTimeOut}    : Délai maximum d'attente des éléments (ex: 10s)
    [Arguments]    ${vNomSite}    ${vNomURL}    ${vDescription}    ${vVisibilite}    ${vTimeOut}
    # Attendre que le menu Sites soit visible et cliquer dessus
    Wait Until Element Is Visible    ${link_site}    ${vTimeOut}
    Click Element    ${link_site}
    # Attendre que le lien "Créer un site" soit visible et cliquer dessus
    Wait Until Element Is Visible    ${link_creation_site}    ${vTimeOut}
    Click Element    ${link_creation_site}
    # Attendre que le formulaire de création soit chargé
    Wait Until Element Is Visible    ${input_Nom_site}    ${vTimeOut}
    # Remplir les champs du formulaire
    Input Text    ${input_Nom_site}    ${vNomSite}
    Input Text    ${input_Nom_URL}    ${vNomURL}
    Input Text    ${input_description}    ${vDescription}
    # Sélectionner la visibilité du site selon le paramètre fourni
    ${Choix_visibilite}=    Replace String    ${radio_visibilite}    CHOIX    ${vVisibilite}
    Click Element    ${Choix_visibilite}
    # Attendre que le bouton Créer soit actif puis cliquer dessus
    Wait Until Element Is Enabled    ${btn_creer}    ${vTimeOut}
    Click Element    ${btn_creer}
    # Construire le locator dynamiquement en remplaçant NOM par le vrai nom du site
    ${locator}=    Replace String    ${page_titre_site}    NOM    ${vNomSite}
    # Attendre que le titre du site apparaisse sur la page
    Wait Until Element Is Visible    ${locator}    ${vTimeOut}
    # Vérifier que l'élément est bien visible (confirmation de la création)
    Element Should Be Visible    ${locator}