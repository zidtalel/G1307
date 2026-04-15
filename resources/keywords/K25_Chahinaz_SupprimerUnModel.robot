# Locators supprimer un module
  btn_Supprimer_module1 = '//li[.//h3[@class="title" and text()="'
  btn_Supprimer_module2 = '"]]//a[@name=".onRemoveClick"]'
  btn_Ok_Supprimer_Module = "//button[contains(.,'OK')]"

Supprimer un module dans un site existant 
    # vNom_Site est le nom du site cible.
    # vModule est le nom du module à afficher
    [Arguments]    ${vNom_Site}    ${vModule}
    # Accéder à la page Personnaliser le site
    Go To    ${vURL}/share/page/site/${vNom_Site}/customise-site
    # Attendre  que les modules soient visibles
    Wait Until Element Is Visible    ${btn_Supprimer_module1}${vModule}${btn_Supprimer_module2}
    Click Element    ${btn_Supprimer_module1}${vModule}${btn_Supprimer_module2}
    # Confirmer la suppression
    Click Button    ${btn_Ok_Supprimer_Module}
    # Vérifier que le module n'est plus présent
    Go To    ${vURL}/share/page/site/${vNom_Site}
    Page Should Not Contain    ${vModule}
