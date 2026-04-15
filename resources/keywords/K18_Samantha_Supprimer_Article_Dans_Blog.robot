# Supprimer un article dans un blog elements
link_filterAll = "//span[@class='all']/a[text()='All']"
link_Post1 = "//a[normalize-space()='"
link_Post2 = "']"
link_DeletePost1 = "//div[contains(@class,'node post')][.//a[text()='"
link_DeletePost2 = "']]//div[@class='onDeleteBlogPost']//a"
div_BlogListe = "//div[contains(@class, 'blog-postlist')]"

# Alerte de confirmation 
div_Alert = "//div[@id='prompt']"
btn_ConfirmAlert = "//div[@id='prompt']//button[contains(text(),'Delete')]"

Supprimer un article dans un blog
    # Ce mot clé permet de supprimer un article dans un blog
    # vURL_Blog : http://localhost:8084/share/page/site${vNom_Site}/blog-postlist
    # vNom_Site contient le lien du site
    # vNom_Article contient le nom exact d'article a supprimer
    [Arguments]    ${vNom_Site}    ${vNom_Article}    ${vTimeOut}
    Go To    ${vURL}/share/page/site/${vNom_Site}/blog-postlist
    Wait Until Element Is Visible    ${link_filterAll}    ${vTimeOut}
    Click Element    ${link_filterAll}
    Wait Until Element Is Visible    ${div_BlogListe}
    Click Element    ${link_DeletePost1}${vNom_Article}${link_DeletePost2}
    # Handle alert
    Wait Until Element Is Visible    ${div_Alert}
    Click Button    ${btn_ConfirmAlert}
    # Confirmer que le post n'est plus visible
    Wait Until Element Is Visible    ${div_BlogListe}    ${vTimeOut}   
    Wait Until Page Does Not Contain Element    ${link_Post1}${vNom_Article}${link_Post2}    ${vTimeOut}