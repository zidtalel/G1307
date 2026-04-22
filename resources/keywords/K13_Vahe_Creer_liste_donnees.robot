#Locators pour keyword Creer liste de données
# # Liste de données
# link_TypeList1="//div[@class='item-types']//a[contains(text(), '"
# link_TypeList2="')]"
# link_NouvelleList = "//*[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newListButton-button']"
# lbl_TitleForList = "//*[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newList_prop_cm_title']"
# ligne_Description = "//*[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newList_prop_cm_description']"
# btn_Enregistrer = "//*[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newList-form-submit-button']"
# find_List1 = "//div[@class='filter']//a[contains(text(), '"
# find_List2 = "')]"


Creer liste de donnees
    # ${vNomUrl_Site} : nom de Url(identifiant) du site dans lequel vous souhaitez ajouter une liste de données 
    # ${vtypeList} : correspond au type de liste que le site web permet de créer
    # ${vtxt_titre} : nom de la liste tel que vous souhaitez l’appeler
    # ${vtext_description} : description de la liste
    [Arguments]    ${vNomUrl_Site}    ${vtypeList}    ${vtxt_titre}    ${vtext_description}
    #Diriger vers la page liste de données
    Go To    ${vURL}/share/page/site/${vNomUrl_Site}/data-lists
    Sleep    1s
    # Cliquer sur Nouvelle liste (au cas où il n’y a aucune liste et que le site web ouvre directement le formulaire pour une nouvelle liste)
    ${status}    ${value}=    Run Keyword And Ignore Error
    ...    Element Should Be Visible    ${lbl_TitleForList}

    Run Keyword If    '${status}' == 'FAIL'
    ...    Click Element    ${link_NouvelleList}
    # Choisir type de Liste de données, rempplir l'information et enregistrer
    Wait Until Element Is Visible    ${lbl_TitleForList}
    Click Element    ${link_TypeList1}${vtypeList}${link_TypeList2}
    Input Text    ${lbl_TitleForList}    ${vtxt_titre}
    Input Text    ${ligne_Description}    ${vtext_description}
    Click Element    ${btn_Enregistrer}
    # Criteres de succes
    Wait Until Element Is Visible    ${find_list1}${vtxt_titre}${find_list2}