# Localisateurs
# Liste des discussions d'un site
link_FilterAll="//a[@class='filter-link filter0' and text()='Tout']"
link_DeleteTopic1="//a[text()='"
link_DeleteTopic2="']/ancestor::div[@class='node topic']/div/div/a[text()='Supprimer']"
btn_ConfirmDeleteTopic="//button[text()='Supprimer']"
div_DeleteTopicSuccess="//div[@id='message_c']"
link_Topic="//a[text()='"

Supprimer un sujet dans une discussion
    # vNomURLSite est l'identifiant du site tel qu'il apparaît dans son adresse URL (minuscules, chiffres et tirets seulement)
    # vTitreSujet est le titre complet du sujet à supprimer
    # vMessageSucces contient le texte exact du message de succès de la suppression du sujet
    [Arguments]    ${vNomURLSite}    ${vTitreSujet}    ${vMessageSucces}
    # Préconditions
    # Un site possédant le module Discussions doit exister : utiliser les mot-clés K4 et K43
    # Navigation vers la liste de discussions du site
    Go To    ${vURL}/share/page/site/${vNomURLSite}/discussions-topiclist
    # Clic sur le filtre "Tout"
    Wait Until Element Is Visible    ${link_FilterAll}
    Click Element    ${link_FilterAll}
    # Clic sur le lien Supprimer du sujet à retirer
    Wait Until Element Is Visible    ${link_DeleteTopic1}${vTitreSujet}${link_DeleteTopic2}
    Click Element    ${link_DeleteTopic1}${vTitreSujet}${link_DeleteTopic2}
    # Confirmation de la suppression
    Wait Until Element Is Visible    ${btn_ConfirmDeleteTopic}
    Click Element    ${btn_ConfirmDeleteTopic}
    # Postconditions
    # Vérification que le message de succès s'affiche
    Wait Until Element Is Visible    ${div_DeleteTopicSuccess}
    Element Text Should Be    ${div_DeleteTopicSuccess}    ${vMessageSucces}
    # Vérification que le lien du sujet supprimé n'apparaît plus dans la liste
    Element Should Not Be Visible    ${link_Topic}${vTitreSujet}']