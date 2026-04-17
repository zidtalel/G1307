
# Règles de dossier
link_FichiersPartages ="//a[@title='Fichiers partagés']"
link_Dossier_1 = "//a[normalize-space(text())='"
link_Dossier_2 = "']"
link_Plus = "//a[contains(text(),'Farah 1307')]/ancestor::tr//span[text()='Plus...']"
link_Gerer_Regles = "//a[contains(text(),'Farah 1307')]/ancestor::tr//span[text()='Gérer les règles']"
link_Creer_Des_Regles="//a[text()='Créer des règles']"
btn_Nouvelle_Regle="//*[id='template_x002e_rules-header_x002e_folder-rules_x0023_default-newRule-button']"
input_Nom="//input[@id='template_x002e_rule-edit_x002e_rule-edit_x0023_default-title']"
input_Description="//textarea[@id='template_x002e_rule-edit_x002e_rule-edit_x0023_default-description']"
select_Quand="(//select[contains(@class,'config-name')])[1]"
chk_Si_Criteres ="//input[@id='template_x002e_rule-edit_x002e_rule-edit_x0023_default-ruleConfigIfCondition-condition-checkbox']"
chk_Sauf_Si_Criteres="//input[@id='template_x002e_rule-edit_x002e_rule-edit_x0023_default-ruleConfigUnlessCondition-condition-checkbox']"
select_Action="//div[text()='Exécuter une action :']/../following-sibling::ul/li/div[@class='name']/select"
btn_Selectionner="//button[text()='Sélectionner...']"
btn_Fichiers_Partages="//button[contains(@id,'destinationDialog-shared-button')]"
select_Fichier_1 = "//span[normalize-space(text())='"
select_Fichier_2 = "']"
btn_OK="//button[normalize-space(text())='OK']"
btn_Creer="//button[normalize-space(text())='Créer']"



Creer une regle
    # Ce mot clé permet de créer une règle dans un dossier.
    # vNomDossier : dossier source
    # vNomRegle : nom de la règle
    # vDescription : description
    # vCondition : valeur du champ "Quand"
    # vAction : action à exécuter
    # vCible : dossier cible (destination)

    [Arguments]    ${vNomDossier}    ${vNomRegle}    ${vDescription}    ${vCondition}    ${vAction}    ${vCible}

    Go To    ${vURL}/share/page/context/shared/sharedfiles

    # Dossier source
    Wait Until Element Is Visible    ${link_Dossier_1}${vNomDossier}${link_Dossier_2}
    Mouse Over    ${link_Dossier_1}${vNomDossier}${link_Dossier_2}

    # Plus
    Wait Until Element Is Visible    ${link_Plus}
    Click Element    ${link_Plus}

    # Gérer les règles
    Wait Until Element Is Visible    ${link_Gerer_Regles}
    Click Element    ${link_Gerer_Regles}

    # Condition si pas de regle dans le dossier ou si une regle existe deja

    ${btn_Nouvelle_Regle_Existe}=    Run Keyword And Return Status    Element Should Be Visible    ${btn_Nouvelle_Regle}
    IF     ${btn_Nouvelle_Regle_Existe}
        Click Element    ${btn_Nouvelle_Regle}
    ELSE
        Click Element    ${link_Creer_Des_Regles}
    END

    # Nom
    Wait Until Element Is Visible    ${input_Nom}
    Input Text    ${input_Nom}    ${vNomRegle}

    # Description
    Wait Until Element Is Visible    ${input_Description}
    Input Text    ${input_Description}    ${vDescription}

    # Condition (Quand)
    Wait Until Element Is Visible  ${select_Quand}    
    Select From List By Label      ${select_Quand}    ${vCondition}

    # Action
    Wait Until Element Is Visible    ${select_Action}
    Select From List By Label    ${select_Action}    ${vAction}

    # Sélectionner...
    Wait Until Element Is Visible    ${btn_Selectionner}
    Click Element    ${btn_Selectionner}

    # Fichiers partagés
    Wait Until Element Is Visible    ${btn_Fichiers_Partages}
    Click Element    ${btn_Fichiers_Partages}

    # Dossier cible 
    Wait Until Element Is Visible    ${select_Fichier_1}${vCible}${select_Fichier_2}
    Click Element    ${select_Fichier_1}${vCible}${select_Fichier_2}

    # OK
    Wait Until Element Is Visible    ${btn_OK}
    Click Element    ${btn_OK}

    # Créer
    Wait Until Element Is Visible    ${btn_Creer}
    Click Element    ${btn_Creer}
