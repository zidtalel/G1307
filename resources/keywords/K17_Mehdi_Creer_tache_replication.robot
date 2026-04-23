# Les localisateurs
# --- NAVIGATION: OUTILS ADMIN ---
link_AdminConsole = "xpath=//span[@id='HEADER_ADMIN_CONSOLE_text']"
div_ToolsLink = "xpath=//div[contains(@class,'tool tools-link')]"
link_ReplicationJobs = "xpath=//a[@href='replication-jobs']"

# --- GESTION DES TÂCHES DE RÉPLICATION ---
btn_OuvrirFormulaire = "xpath=//span[contains(@id, 'default-create')]//a"


# --- SECTION 1: GÉNÉRAL ---
txt_RepliName = "xpath=//input[contains(@id, 'prop_name')]"
txt_RepliDescription = "xpath=//textarea[contains(@id, 'prop_description')]"


# --- SECTION 2: CHARGE UTILE (Popup Object Finder) ---
btn_PayloadSelect = "xpath=//div[contains(@id, 'payloadContainer')]//button"

# Nouveau XPath paramétrable divisé en deux parties pour accepter n'importe quel dossier
btn_AddFolder_Part1 = "xpath=//div[contains(@class, 'object-finder')]//*[text()='"
btn_AddFolder_Part2 = "']/ancestor::tr//a[contains(@class, 'add')]"

btn_PopupOK = "xpath=//*[@id='alf-id0_payload-cntrl-ok-button']"


# # --- SECTION 2: CHARGE UTILE (Popup Object Finder) ---
# btn_PayloadSelect = "xpath=//div[contains(@id, 'payloadContainer')]//button"

# # Bouton PLUS (+) à gauche (XPath ultra-précis)
# btn_PlusDataDictionary = "xpath=//div[contains(@class, 'object-finder')]//*[text()='Data Dictionary']/ancestor::tr//a[contains(@class, 'add')]"


# btn_PopupOK = "xpath=//*[@id='alf-id0_payload-cntrl-ok-button']"

# --- SECTION 3: CIBLE DE TRANSFERT ---
btn_TargetSelect = "xpath=//div[contains(@id, 'transferTargetContainer')]//button[text()='Sélectionner']"
# On cible le bouton "Sélectionner" à l'INTÉRIEUR du popup de groupe de transfert
btn_ActionSelectTarget = "xpath=//div[contains(@class, 'target-group-picker')]//button[text()='Sélectionner']"

# --- SECTION 4: PLANNING (Date et Heure) ---
chk_ScheduleEnabled = "xpath=//input[contains(@id, 'scheduleEnabled')]"

# Alfresco utilise souvent deux inputs : un pour la date, un pour l'heure
txt_StartDate = "xpath=//div[contains(@id, 'scheduleStartContainer')]//input[contains(@class, 'date-entry')]"
txt_StartTime = "xpath=//div[contains(@id, 'scheduleStartContainer')]//input[contains(@class, 'time-entry')]"

txt_IntervalCount = "xpath=//input[contains(@id, 'prop_intervalCount')]"
sel_IntervalPeriod = "xpath=//select[contains(@id, 'prop_intervalPeriod')]"

# --- VALIDATION ---
btn_RepliSubmit = "xpath=//div[contains(@id, 'form-buttons')]//button[text()='Créer une tâche']"


# --- SECTION 4: PLANNING ---
chk_ScheduleEnabled = "xpath=//input[contains(@id, 'scheduleEnabled')]"
txt_IntervalCount = "xpath=//input[contains(@id, 'prop_intervalCount')]"
sel_IntervalPeriod = "xpath=//select[contains(@id, 'prop_intervalPeriod')]"

# --- SECTION 5: OPTIONS & VALIDATION ---
chk_JobEnabled = "xpath=//input[contains(@id, 'prop_enabled-entry')]"
btn_RepliSubmit = "xpath=//div[contains(@id, 'form-buttons')]//button[text()='Créer une tâche']"

# --- VÉRIFICATION ---
link_JobInList_Part1 = "xpath=//div[contains(@id, 'jobsList')]//*[contains(text(), '"
link_JobInList_Part2 = "')]"



*** Keywords ***
# Ce mot-clé maître permet de créer une tâche de réplication complète de bout en bout.
# Il orchestre l'appel aux sous-mots-clés pour effectuer les actions suivantes :
# 1. Ouvrir le formulaire de création.
# 2. Saisir le nom et la description de la tâche.
# 3. Sélectionner la charge utile (Data Dictionary).
# 4. Configurer la planification (Date, Heure, Intervalle).
# 5. Sauvegarder la tâche et vérifier qu'elle apparaît bien dans la liste.

# --- BLOC NAVIGATION ---
Naviguer Vers Replication
    Click Element    ${link_AdminConsole}
    Wait Until Element Is Visible    ${div_ToolsLink}    ${TIMEOUT}
    Click Element    ${link_ReplicationJobs}
    Wait Until Element Is Visible    ${btn_OuvrirFormulaire}    ${TIMEOUT}

# --- FORMULAIRE DÉCOMPOSÉ ---
Saisir Informations Generales
    [Arguments]    ${vNom}    ${vDesc}
    Input Text    ${txt_RepliName}    ${vNom}
    Input Text    ${txt_RepliDescription}    ${vDesc}

Choisir Dossier Charge Utile
    [Arguments]    ${vDossier}
    # 1. Ouvrir le sélecteur
    Wait Until Element Is Visible    ${btn_PayloadSelect}    ${TIMEOUT}
    Click Button    ${btn_PayloadSelect}
    
    # 2. Cliquer sur le (+) du dossier dynamique (ex: "Shared")
    # On assemble le XPath avec la variable passée en argument
    ${loc_FolderPlus}=    Set Variable    ${btn_AddFolder_Part1}${vDossier}${btn_AddFolder_Part2}
    Wait Until Element Is Visible    ${loc_FolderPlus}    ${TIMEOUT}
    Click Element    ${loc_FolderPlus}

    Sleep    1s    

    Click Button    ${btn_PopupOK}
    Sleep    1s


Configurer Planning
    [Arguments]    ${vDate}    ${vHeure}    ${vNombre}    ${vUnite}
    # 1. Cocher la case
    Select Checkbox    ${chk_ScheduleEnabled}
    # 2. Remplir la date (Format JJ/MM/AAAA) et l'heure (HH:MM)
    Wait Until Element Is Visible    ${txt_StartDate}    ${TIMEOUT}
    Input Text    ${txt_StartDate}    ${vDate}
    Input Text    ${txt_StartTime}    ${vHeure}
    # 3. Remplir l'intervalle
    Input Text    ${txt_IntervalCount}    ${vNombre}
    Select From List By Value    ${sel_IntervalPeriod}    ${vUnite}

Valider Et Verifier Creation
    [Arguments]    ${vNomTache}
    Select Checkbox    ${chk_JobEnabled}
    Click Button    ${btn_RepliSubmit}
    Wait Until Element Is Visible    ${btn_OuvrirFormulaire}    ${TIMEOUT}
    Wait Until Page Contains Element    ${link_JobInList_Part1}${vNomTache}${link_JobInList_Part2}    ${TIMEOUT}


# --- MOT-CLÉ MAÎTRE MIS À JOUR ---
Creer Une Tache De Replication Complete
    # On ajoute ${vDossier} dans les arguments attendus
    [Arguments]    ${vNom}    ${vDesc}    ${vDossier}    ${vDate}    ${vHeure}    ${vNombre}    ${vUnite}
    
    Click Element    ${btn_OuvrirFormulaire}
    Saisir Informations Generales    ${vNom}    ${vDesc}
    
    # On passe l'argument au sous-mot-clé
    Choisir Dossier Charge Utile    ${vDossier}
    
    Configurer Planning    ${vDate}    ${vHeure}    ${vNombre}    ${vUnite}
    Valider Et Verifier Creation    ${vNom}
