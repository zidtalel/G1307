#Locators pour keyword Supprimer une liste de données
find_List1 = "//div[@class='filter']//a[contains(text(), '"
find_List2 = "')]"
btn_Supprimer1 = "//div[@class='filter']//a[contains(., '"                     
btn_Supprimer2 = "')]/span[@class='delete']"
btn_ConfirmSup = "//*[@id='yui-gen5-button']"


Supprimer liste de donnees
    # ${vNom_Site} : nom du site dans lequel vous souhaitez supprimer une liste de données 
    # ${vtxt_titre} : nom de la liste que vous souhaitez supprimer
    [Arguments]    ${vtxt_titre}    ${vNom_Site}
    # Diriger vers la page Liste de données
    Go To    ${vURL}/share/page/site/${vNom_Site}/data-lists
    # Choisir la liste pour supprimer et confirmer
    Wait Until Element Is Visible    ${find_List1}${vtxt_titre}${find_List2}
    Mouse Over    ${find_List1}${vtxt_titre}${find_List2}
    Wait Until Element Is Visible    ${btn_Supprimer1}${vtxt_titre}${btn_Supprimer2}    
    Click Element    ${btn_Supprimer1}${vtxt_titre}${btn_Supprimer2}
    Click Element    ${btn_ConfirmSup}
    # Criteres de succes
    Wait Until Element Is Not Visible    ${find_List1}${vtxt_titre}${find_List2}    

