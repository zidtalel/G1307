# Localisateurs
# --- Navigation Dossiers ---

link_Dossier_Mehdi = "xpath=//*[text()='Dossier_Test_Mehdi']"

btn_Plus_Images = "xpath=//a[text()='images']/ancestor::tr//a[contains(., 'Plus')]"

item_Gerer_Les_Regles = "xpath=//span[text()='Gérer les règles']"
btn_Confirmer_Suppression_Popup = "xpath=//div[@class='ft']//button[text()='Supprimer']"

# --- Page des Règles (Sélecteurs Stables) ---

btn_Supprimer_Regle_Panel = "id=template_x002e_rule-details_x002e_folder-rules_x0023_default-delete-button"
btn_Confirmer_Suppression_Final = "xpath=//div[@class='ft']//button[text()='Supprimer']"
link_Regle_Liste_Part1 = "xpath=//a[@class='title' and text()='"
link_Regle_Liste_Part2 = "']"

# --- Page des Règles (Détails à droite) ---

lbl_Regle_Titre_Details = "xpath=//div[contains(@id, 'rule-details')]//h2"
btn_Supprimer_Regle_Action = "xpath=//div[contains(@class, 'rule-details')]//button[text()='Supprimer']"
btn_Confirmer_Suppression_Popup = "xpath=//div[@class='ft']//button[text()='Supprimer']"

*** Keywords ***

Naviguer Vers Gestion Des Regles Mehdi
    #Ce mot-clé permet de naviguer dans l'arborescence documentaire pour accéder 
    #à la page de gestion des règles du sous-dossier 'images'. 
    #Il simule le parcours utilisateur : ouverture du dossier parent, survol du 
    #sous-dossier, ouverture du menu d'actions et clic sur 'Gérer les règles'.
    
    # 1. Cliquer sur le dossier parent 'Dossier_Test_Mehdi' pour l'ouvrir
    Wait Until Element Is Visible    ${link_Dossier_Mehdi}    ${TIMEOUT}
    Click Element    ${link_Dossier_Mehdi}
    
    # 2. Mettre la souris sur le dossier 'images' pour faire apparaître les options cachées (comme le bouton 'Plus...')
    Wait Until Element Is Visible    xpath=//a[text()='images']    ${TIMEOUT}
    Mouse Over    xpath=//a[text()='images']
    
    # 3. Cliquer sur le bouton "Plus..." de la ligne correspondante au dossier 'images'
    Wait Until Element Is Visible    ${btn_Plus_Images}    5s
    Click Element    ${btn_Plus_Images}
    
    # 4. Cliquer sur "Gérer les règles" dans le menu déroulant qui vient de s'ouvrir
    Wait Until Element Is Visible    ${item_Gerer_Les_Regles}    ${TIMEOUT}
    Click Element    ${item_Gerer_Les_Regles}
    
    # 5. Vérification finale : s'assurer que la navigation a réussi et que la page des règles est bien chargée
    Wait Until Page Contains    Règles de dossier    ${TIMEOUT}


Supprimer Une Regle
    #Ce mot-clé prend en paramètre le nom d'une règle, la sélectionne dans le 
    #panneau de gauche, clique sur le bouton de suppression dans les détails 
    #à droite, valide la modale de confirmation, et vérifie sa disparition.
    [Arguments]    ${nom_regle}
    
    # 1. Identifier et cliquer sur le nom de la règle dans la liste à gauche pour afficher ses détails
    Wait Until Element Is Visible    xpath=//a[@class='title' and text()='${nom_regle}']    ${TIMEOUT}
    Click Element                    xpath=//a[@class='title' and text()='${nom_regle}']
    
    # 2. Attendre que l'interface affiche les détails de la règle à droite (apparition du bouton Supprimer)
    Wait Until Element Is Visible    ${btn_Supprimer_Regle_Action}    ${TIMEOUT}
    
    # 3. Cliquer sur le bouton 'Supprimer' situé dans le panneau des détails de la règle
    Click Element                    ${btn_Supprimer_Regle_Action}
    
    # 4. Une modale (popup) de sécurité s'ouvre. Attendre qu'elle apparaisse et confirmer la suppression
    Wait Until Element Is Visible    ${btn_Confirmer_Suppression_Popup}    ${TIMEOUT}
    Click Element                    ${btn_Confirmer_Suppression_Popup}
    
    # 5. Vérification visuelle que la règle a bien été supprimée (elle ne doit plus exister dans la liste)
    Wait Until Element Is Not Visible    xpath=//a[@class='title' and text()='${nom_regle}']    ${TIMEOUT}
