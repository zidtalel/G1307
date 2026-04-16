*** Settings ***
Documentation     Ce fichier contient les mots clés pour l'application Alfresco.
Library           SeleniumLibrary
Variables         ../locators/alfresco_locators.py
Variables         ../variables/global_variables.py



*** Keywords ***

Ajouter un module dans un site
    # vNom_Site est le nom du site cible.
    # vURL_SiteModules :  http://localhost:8088/share/page/site/${vNom_Site}/customise-site
    # vModule est le nom du module à afficher
    [Arguments]    ${vNom_Site}    ${vModule}
    Go To    ${vURL}/share/page/site/${vNom_Site}/customise-site
    Wait Until Element Is Visible    ${drop_Module}
    Drag And Drop    ${drag_Module1}${vModule}${drag_Module2}    ${drop_Module}
    Click Button    ${btn_Ok_Ajouter_Module}

Menu Outils Admin
    # Ce mot clé permet de cliquer sur l'une des options du menu Admin.
    # vMenuName est le nom de chaque option.
    # Ce paramètre peut avoir l'une des valeurs suivantes :
    # Application :    application
    # Gestionnaire de catégories :    category-manager
    # Gestionnaire de recherche :    search-manager
    # Gestionnaire de tags :    tag-management
    # Gestionnaire de modèle :    custom-model-manager
    # Gestionnaire de sites :    manage-sites
    # Tâches de réplication :    replication-jobs
    # Groupes :    groups
    # Utilisateurs :    users
    [Arguments]    ${vMenuName}
    Click Element    ${link_OptionAdmin}${vMenuName}']

Main menu
    # Ce mot clé permet de cliquer sur l'une des options du menu principal.
    # vMenuName est le nom de chaque option.
    # Ce paramètre peut avoir l'une des valeurs suivantes :
    # Accueil :    HOME_text
    # Mes fichiers :    MY_FILES_text
    # Fichiers partagés :    SHARED_FILES_text
    # Sites :    SITES_MENU_text
    # Tâches :    TASKS_text
    # Personnes :    PEOPLE_text
    # Entrepôt :    REPOSITORY_text
    # Outils admin :    ADMIN_CONSOLE_text
    [Arguments]    ${vMenuName}
    Click Element    ${link_MenuOption}${vMenuName}']

Login
    # vURL contient l'adresse URL de la page web
    # vBrowser contient l'identifiant du navigateur cible
    # vUsername contient le login
    # vPassword contient le mot de passe
    [Arguments]    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    Set Selenium Timeout    ${TIMEOUT}
    Open Browser    ${vURL}    ${vBrowser}    add_argument('--lang=fr')
    Maximize Browser Window
    Input text    ${txt_UserName}    ${vUsername}
    Input text    ${txt_Password}    ${vPassword}
    Click Button    ${btn_Login}
    Wait Until Element Is Visible    ${lblTitle}
    # S'assurer que l'utilisateur est connecte et que le tableau de bord est affiche
    Element Should Contain    ${lblTitle}    Tableau de bord de

Logout
    Sleep    1s
    Click Element	${link_HeaderUserMenu}
    Sleep    2s
    #Wait Until Element Is Visible    ${link_HeaderDeconnexion}
    Click Element                    ${link_HeaderDeconnexion}
    [Teardown]    Close Browser

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
  
Menu Action
    # Ce mot clé permet de cliquer sur l'une des options du menu Actions d'un modèle.
    # Il prend deux paramètres :
    # vModele est le nom du modèle.
    # vOption est l'option à activer
    # vOption peut avoir l'une des valeurs suivantes :
    # Activer
    # Désactiver
    # Modifier
    # Supprimer
    # Exporter
    [Arguments]    ${vModele}    ${vOption}
    Wait Until Element Is Visible    ${menu_Actions1}${vModele}${menu_Actions2}
    Click Element    ${menu_Actions1}${vModele}${menu_Actions2}
    Wait Until Element Is Visible    ${menu_Action_Option1}${vOption}${menu_Action_Option2}
    Click Element    ${menu_Action_Option1}${vOption}${menu_Action_Option2}
