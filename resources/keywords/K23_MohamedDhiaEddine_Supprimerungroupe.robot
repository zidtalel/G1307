
#--- Locators pour la suppression d'un groupe dans alfresco
lnk_Outil_admin = "//a[@title='Outils admin']"
lnk_Groupes = "//a[@title='Gestion des groupes']"
input_search_group = "//div[@class='yui-u first']/div/input"
btn_search_group = "//div[@class='search-button']//button[text()='Rechercher']"
btn_delete_group = "//a[@class='delete']"  
confirm_delete_group = "//button[@id='page_x002e_ctool_x002e_admin-console_x0023_default-remove-button-button']"

*** Keywords ***
Supprimer un groupe
    [Arguments]    ${vGroupeName}
    Wait Until Element Is Visible    ${lnk_Outil_admin}
    Click Element    ${lnk_Outil_admin}
    Click Element    ${lnk_Groupes}
    Wait Until Element Is Visible    ${input_search_group}    5s
    Input Text    ${input_search_group}    ${vGroupeName}
    Click Button    ${btn_search_group}
    Wait Until Element Is Visible    ${btn_delete_group}    5s
    Click Element    ${btn_delete_group}
    Click Button    ${confirm_delete_group}


    