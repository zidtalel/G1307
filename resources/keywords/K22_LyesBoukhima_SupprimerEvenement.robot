# evenement locators
link_date_calendrier="//div[@id='calendar']/descendant::a[@class='calnav']"
liste_mois="//select[@id='calendar_nav_month']"
input_annee="//input[@id='calendar_nav_year']"
btn_ok="//button[@id='calendar_nav_submit']"
link_premier_du_mois="//a[@class='selector' and contains(normalize-space(text()),'1')]"
evenement_a_supprimer="//a[@href='/share/page/site/NOMURL/calendar?date=DATE']/descendant::span[contains(normalize-space(text()),'NOMEVEN')]"
btn_supprimer="//span[@id='template_x002e_view_x002e_calendar_x0023_defaultContainer-delete-button']"
btn_supprimer2="//span[@class='button-group']/descendant::button[contains(normalize-space(text()),'Supprimer')]"

supprission d'un evenement
    # ${vURL}             : URL de base d'Alfresco (ex: http://localhost:8084/share/page)
    # ${vNomSite}         : Identifiant URL du site (ex: mon-site)
    # ${vDate}            : Date de l'événement au format jj/MM/aaaa (ex: 15/04/2024)
    # ${vTitreEvenement}  : Titre exact de l'événement à supprimer (ex: Réunion équipe)
    # ${vTimeOut}         : Délai maximum d'attente des éléments (ex: 10s)
    [Arguments]    ${vURL}    ${vNomSite}    ${vNomURL}    ${vDate}    ${vTitreEvenement}    ${vTimeOut}
    # Découper la date au format jj/MM/aaaa pour extraire le mois et l'année
    ${vParties}=    Split String    ${vDate}    /
    ${vMois}=         Evaluate    int("${vParties}[1]") - 1  # le -1 pour utiliser la liste des mois par value
    ${vAnnee}=        Set Variable    ${vParties}[2]
    # Convertir la date au format aaaa-MM-jj (ex: 2026-04-15) pour l'utiliser dans un localisateur
    ${vDateISO}=      Set Variable    ${vParties}[2]-${vParties}[1]-${vParties}[0]

    # Naviguer vers le calendrier du site
    Go To    ${vURL}/site/${vNomURL}/calendar
    # Ouvrir le sélecteur de date
    Wait Until Element Is Visible    ${link_date_calendrier}    ${vTimeOut}
    Click Element    ${link_date_calendrier}
    # Sélectionner le mois dans la liste déroulante
    Wait Until Element Is Visible    ${liste_mois}    ${vTimeOut}
    Select From List By Value    ${liste_mois}    ${vMois}
    # Saisir l'année dans le champ prévu
    Wait Until Element Is Visible    ${input_annee}    ${vTimeOut}
    Input Text    ${input_annee}    ${vAnnee}
    # Valider la sélection de la date
    Wait Until Element Is Enabled    ${btn_ok}    ${vTimeOut}
    Click Element    ${btn_ok}
    # Cliquer sur le premier jour du mois pour afficher les événements
    Wait Until Element Is Visible    ${link_premier_du_mois}    ${vTimeOut}
    Wait Until Keyword Succeeds    ${vTimeOut}    1s    Click Element    ${link_premier_du_mois}
    # Construire le locator dynamiquement en remplaçant Date et NOMEVEN et NOMURL
    ${locator_evenement}=    Replace String    ${evenement_a_supprimer}    DATE      ${vDateISO}
    ${locator_evenement}=    Replace String    ${locator_evenement}         NOMEVEN    ${vTitreEvenement}
    ${locator_evenement}=    Replace String    ${locator_evenement}         NOMURL    ${vNomURL}
    # Cliquer sur l'événement à supprimer
    Wait Until Element Is Visible    ${locator_evenement}    ${vTimeOut}
    Click Element    ${locator_evenement}
    # Cliquer sur le bouton Supprimer pour ouvrir la confirmation
    Wait Until Element Is Visible    ${btn_supprimer}    ${vTimeOut}
    Click Element    ${btn_supprimer}
    # Confirmer la suppression dans la boîte de dialogue
    Wait Until Element Is Visible    ${btn_supprimer2}    ${vTimeOut}
    Click Element    ${btn_supprimer2}
    #Verification de la supprission 
    Wait Until Element Is Not Visible    ${locator_evenement}    ${vTimeOut}
    Element Should Not Be Visible    ${locator_evenement}