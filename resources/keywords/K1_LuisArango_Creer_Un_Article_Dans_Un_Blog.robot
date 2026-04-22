# Locators pour keyword Creation blog article
link_NewArticle = "//*[@id='template_x002e_toolbar_x002e_blog-postlist_x0023_default-create-button-button']"
btn_Publier = "//*[@id='template_x002e_postedit_x002e_blog-postedit_x0023_default-publish-button-button']"
txt_Titre = "//*[@id='template_x002e_postedit_x002e_blog-postedit_x0023_default-title']"
txt_Text = "//*[@id='tinymce']/p/br"
txt_Tags = "//*[@id='template_x002e_postedit_x002e_blog-postedit_x0023_default-tag-input-field']"
btn_Ajouter = "//*[@id='template_x002e_postedit_x002e_blog-postedit_x0023_default-add-tag-button-button']"
link_ArticleCreated = "//*[@id='template_x002e_postview_x002e_blog-postview_x0023_default-postview']/div[2]/div[1]/a"
find_Article1 = "//div[@class='nodeTitle']//a[contains(text(), '"
find_Article2 = "')]"


Creer Blog article
    # ${vNomUrl_Site} : nom de Url(identifiant) du site dans lequel vous souhaitez ajouter un article 
    # ${vtitre} : nom d'article tel que vous souhaitez l’appeler
    # ${vtext} : description d'article
    # ${vTAg} : tag pour article
    [Arguments]    ${vTitre}    ${vText}    ${vTAg}    ${vNomUrl_Site}
    # Diriger vers la page
    Go To    ${vURL}/share/page/site/${vNomUrl_Site}/blog-postlist
    Wait Until Element Is Visible    ${link_NewArticle}
    Click Element    ${link_NewArticle}
    Wait Until Element Is Visible    ${txt_Titre}
    Input Text    ${txt_Titre}    ${vTitre}
    # Input Text    ${txt_Text}    ${vText}
    Input Text    ${txt_Tags}    ${vTag}
    Click Element    ${btn_Ajouter}
    Click Element    ${btn_Publier}
    # Critere de succes
    Wait Until Element Is Visible    ${link_ArticleCreated}
    Page Should Contain Element     ${find_Article1}${vTitre}${find_Article2} 