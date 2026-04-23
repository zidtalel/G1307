# Localisateurs
# --- Navigation Dossiers ---
# ==============================================================================
# 4. NAVIGATION DANS L'ENTREPÔT DOCUMENTAIRE (DOSSIERS)
# ==============================================================================
# XPaths dynamiques pour cibler N'IMPORTE QUEL dossier parent
link_Dossier_Part1 = "xpath=//*[text()='"
link_Dossier_Part2 = "']"

# XPaths dynamiques pour survoler N'IMPORTE QUEL sous-dossier cible
link_DossierCible_Part1 = "xpath=//a[text()='"
link_DossierCible_Part2 = "']"

# XPaths dynamiques pour cliquer sur le bouton "Plus..." du sous-dossier
btn_Plus_Dossier_Part1 = "xpath=//a[text()='"
btn_Plus_Dossier_Part2 = "']/ancestor::tr//a[contains(., 'Plus')]"

item_Gerer_Les_Regles = "xpath=//span[text()='Gérer les règles']"

# ------------------------------------------------------------------------------
# 5. PAGE DE GESTION DES RÈGLES - PANNEAU DE GAUCHE (LISTE)
# ------------------------------------------------------------------------------
# Variables permettant de construire dynamiquement le sélecteur d'une règle
# (ex: ${link_Regle_Liste_Part1}nom_de_la_regle${link_Regle_Liste_Part2} )
link_Regle_Liste_Part1 = "xpath=//a[@class='title' and text()='"
link_Regle_Liste_Part2 = "']"


# ------------------------------------------------------------------------------
# 6. PAGE DE GESTION DES RÈGLES - PANNEAU DE DROITE (DÉTAILS ET ACTIONS)
# ------------------------------------------------------------------------------
# Titre (H2) affichant le nom de la règle dans le panneau des détails à droite
lbl_Regle_Titre_Details = "xpath=//div[contains(@id, 'rule-details')]//h2"

# Bouton d'action "Supprimer" généré par le framework (YUI) dans le panneau de droite
btn_Supprimer_Regle_Action = "xpath=//div[contains(@class, 'rule-details')]//button[text()='Supprimer']"


# ------------------------------------------------------------------------------
# 7. FENÊTRES MODALES (POPUPS)
# ------------------------------------------------------------------------------
# Bouton de confirmation finale "Supprimer" affiché dans la fenêtre popup (en bleu)
btn_Confirmer_Suppression_Popup = "xpath=//div[@class='ft']//button[text()='Supprimer']"
*** Keywords ***

Naviguer Vers Gestion Des Regles
    # On ne passe plus que le dossier cible en argument (ex: Dossier_Test_Mehdi)
    [Arguments]    ${vDossierCible}
    
    # 1. Mettre la souris sur le dossier cible pour faire apparaître le bouton "Plus..."
    ${loc_DossierCible}=    Set Variable    ${link_DossierCible_Part1}${vDossierCible}${link_DossierCible_Part2}
    Wait Until Element Is Visible    ${loc_DossierCible}    ${TIMEOUT}
    Mouse Over    ${loc_DossierCible}
    
    # 2. Cliquer sur "Plus..." sur la ligne de ce dossier spécifique
    ${loc_Plus_Cible}=    Set Variable    ${btn_Plus_Dossier_Part1}${vDossierCible}${btn_Plus_Dossier_Part2}
    Wait Until Element Is Visible    ${loc_Plus_Cible}    5s
    Click Element    ${loc_Plus_Cible}
    
    # 3. Cliquer sur "Gérer les règles" dans le menu déroulant
    Wait Until Element Is Visible    ${item_Gerer_Les_Regles}    ${TIMEOUT}
    Click Element    ${item_Gerer_Les_Regles}
    
    # Vérification : On doit voir le titre de la page finale
    Wait Until Page Contains    Règles de dossier    ${TIMEOUT}


Supprimer Une Regle
    # Il ne reste plus que 2 arguments : le dossier et le nom de la règle
    [Arguments]    ${vDossierCible}    ${nom_regle}
    
    # --- 0. APPEL DE LA NAVIGATION ---
    Naviguer Vers Gestion Des Regles    ${vDossierCible}
    
    # --- SUITE DU PROCESSUS DE SUPPRESSION ---
    # On assemble le XPath avec les variables Part1 et Part2 définies dans Locators.py
    ${loc_Regle}=    Set Variable    ${link_Regle_Liste_Part1}${nom_regle}${link_Regle_Liste_Part2}
    
    # 1. Cliquer sur le nom de la règle dans la liste à gauche
    Wait Until Element Is Visible    ${loc_Regle}    ${TIMEOUT}
    Click Element                    ${loc_Regle}
    
    # 2. Attendre l'apparition du bouton 'Supprimer' dans les détails à droite
    Wait Until Element Is Visible    ${btn_Supprimer_Regle_Action}    ${TIMEOUT}
    
    # 3. Cliquer sur le bouton Supprimer du panneau de détails
    Click Element                    ${btn_Supprimer_Regle_Action}
    
    # 4. Attendre l'apparition du popup de confirmation et cliquer sur Supprimer
    Wait Until Element Is Visible    ${btn_Confirmer_Suppression_Popup}    ${TIMEOUT}
    Click Element                    ${btn_Confirmer_Suppression_Popup}
    
    # 5. Vérifier que la règle n'est plus visible dans la liste (confirmation de suppression)
    Wait Until Element Is Not Visible    ${loc_Regle}    ${TIMEOUT}
    
    # 5. Vérification visuelle que la règle a bien été supprimée (elle ne doit plus exister dans la liste)
    Wait Until Element Is Not Visible    xpath=//a[@class='title' and text()='${nom_regle}']    ${TIMEOUT}
