# Les localisateurs
link_OptionAdmin = "//a[@href='"


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