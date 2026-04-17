# Gestionnaire de modele

link_Outils_Admin="//div[@title='Outils admin']"
link_Gestion_Modeles="//a[@title='Gestionnaire de modèles']"
link_Modele1="//span[contains(@class,'value') and contains(text(),'"
link_Modele2="')]"
link_Type_Personnalise1="//span[contains(@class,'value') and contains(text(),'"
link_Type_Personnalise2="')]"
link_Propertie_1="//td[contains(@class,'nameColumn')]//span[contains(@class,'value') and contains(text(),'"
link_Propertie_2="')]"
btn_Action_1="//span[@class='value' and text()='"
btn_Action_2="']/ancestor::tr//span[text()='Actions']"
btn_Supprimer="//div[@class='dijitPopup Popup']//tr[@title='Supprimer']//td[@class='dijitReset dijitMenuItemLabel']"
btn_Confirmer_Suppression="//div[contains(@class,'dijitDialog')]//span[normalize-space()='Supprimer']"

Supprimer une propriete dans un type personnalise

    # Ce mot clé permet de supprimer une propriété dans un type personnalisé.
    # vNomModele : nom du modèle
    # vNomTypePerso : nom du type personnalisé
    # vNomPropriete : nom de la propriété à supprimer

    [Arguments]    ${vNomModele}    ${vNomTypePerso}    ${vNomPropriete}

     Go To    ${vURL}/share/page/console/admin-console/custom-model-manager

    # Sélectionner modèle
    Wait Until Element Is Visible    ${link_Modele1}${vNomModele}${link_Modele2}    
    Scroll Element Into View         ${link_Modele1}${vNomModele}${link_Modele2}
    Click Element                    ${link_Modele1}${vNomModele}${link_Modele2}

    # Sélectionner type personnalisé
    Wait Until Element Is Visible    ${link_Type_Personnalise1}${vNomTypePerso}${link_Type_Personnalise2}    
    Click Element                    ${link_Type_Personnalise1}${vNomTypePerso}${link_Type_Personnalise2}

    # Sélectionner propriété + hover
    Wait Until Element Is Visible    ${link_Propertie_1}${vNomPropriete}${link_Propertie_2}    
    Mouse Over                       ${link_Propertie_1}${vNomPropriete}${link_Propertie_2}

    Sleep    2s   

    # Actions 
    Wait Until Element Is Visible    ${btn_Action_1}${vNomPropriete}${btn_Action_2}
    Click Element    ${btn_Action_1}${vNomPropriete}${btn_Action_2}

    # Supprimer
    Wait Until Element Is Visible    ${btn_Supprimer}    
    Click Element                    ${btn_Supprimer}

    # Confirmer suppression
    Wait Until Element Is Visible    ${btn_Confirmer_Suppression}    
    Click Element                    ${btn_Confirmer_Suppression}