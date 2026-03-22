# Les localisateurs
menu_Actions1 = "//td[contains(@class,'nameColumn')]//span[text()='"
menu_Actions2 ="']/ancestor::tr/td[contains(@class,'actionsColumn')]//span[text()='Actions']"
menu_Action_Option1 = "//div[@role='region']//img[@title='"
menu_Action_Option2 = "']"



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
