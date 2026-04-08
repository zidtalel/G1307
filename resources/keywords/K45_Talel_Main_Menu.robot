# Les localisateurs
link_MenuOption = "//span[@id='HEADER_"

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
