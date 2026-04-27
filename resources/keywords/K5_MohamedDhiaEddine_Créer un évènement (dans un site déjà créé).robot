## Locators for formulaire de création d'événement dans alfresco
#choisir Date
mois_année = "//div/a[@class='calnav']"
choisir_mois = "//select[@id='calendar_nav_month']"
input_année = "//input[@name='calendar_nav_year']"
BTN_OK = "//button[@id='calendar_nav_submit']"

#Locater ajouter un événement
BTN_ADD_EVENT = "//button[contains(text(),'Ajouter un événement')]"

#inputs pour le formulaire de création d'événement
INPUT_QUOI = "//input[@name='what']"
INPUT_LIEU = "//input[@name='where']"
INPUT_DESC="//textarea[@name='desc']"

#Locators pour Tags
BTN_Ajouter = "//button[@id='eventEditPanel-add-tag-button-button']"
input_tags = "//input[@id='eventEditPanel-tag-input-field']"
CHECKBOX_ALLDAY ="//input[@type='checkbox' and contains(@name,'allday')]"

#Locators pour la date de fin
BTN_NEXT_MONTH = "//*[@id='buttoncalendar']//a[@class='calnavright']"
DATE_FIN = "//input[contains(@name,'todate')]"
DATE_FIN = "//input[contains(@name,'todate')]"
HEURE_FIN = "//span[@id='eventEditPanel-endtime']//input[@id='eventEditPanel-end']"

#DATE_Debut 
HEURE_DEBUT = "//span[@id='eventEditPanel-starttime']//input[@id='eventEditPanel-start']"

#Locators pour sauvegarder l'événement
BTN_SAVE = "//button[contains(text(),'Enregistrer')]"


*** Keywords ***
Remplir Formulaire Evenement
    [Arguments]    ${vquoi}    ${vOU}    ${vdesc}    ${vvariable}    ${vheure_debut}    ${vheure_fin}    ${vANNEE_debut}    
    ...    ${vMOIS_debut}    ${vJOUR_debut}    ${vmois_fin}    ${vJOURfin}    ${vtag}
    Go To    http://192.168.1.98/share/page/site/alfresco/calendar
    choisir Date    ${vANNEE_debut}    ${vMOIS_debut}    ${vJOUR_debut}
    Cliquer sur ajouter evenement
    
    Saisir Quoi           ${vquoi}
    Saisir Lieu           ${vOU}
    Saisir Description    ${vdesc}
    Cocher Journee Entiere    ${vvariable}    
    saisir Heure de debut    ${vheure_debut}    ${vvariable}
    Choisir Date fin     ${vmois_fin}    ${vJOURfin}    ${vheure_fin}    ${vvariable}
    ajouter un tag    ${vtag}
    Cliquer Enregistrer


choisir Date
    [Arguments]    ${vANNEE_debut}    ${vMOIS_debut}    ${vJOUR_debut}
    Click Element    ${mois_année}
    Wait Until Element Is Visible    ${choisir_mois}    10
    Select From List By Value    ${choisir_mois}    ${vMOIS_debut}
    Input Text    ${input_année}    ${vANNEE_debut}
    Click Button    ${BTN_OK}
    Wait Until Element Is Visible    //table[contains(@class,'yui-calendar')]    10s
    Wait Until Element Is Visible    //table[contains(@class,'yui-calendar')]//a[normalize-space()='${vJOUR_debut}']    10s
    Click Element    //table[contains(@class,'yui-calendar')]//a[normalize-space()='${vJOUR_debut}']


Cliquer sur ajouter evenement
    Click Button    ${BTN_ADD_EVENT}


Saisir Quoi
    [Arguments]    ${vquoi}
    Wait Until Element Is Visible    ${INPUT_QUOI}
    Input Text    ${INPUT_QUOI}    ${vquoi}


Saisir Lieu
    [Arguments]    ${vOU}
    Input Text    ${INPUT_LIEU}    ${vOU}


Saisir Description
    [Arguments]    ${vdesc}
    Input Text    ${INPUT_DESC}    ${vdesc}

saisir Heure de debut
    [Arguments]    ${vheure_debut}    ${vvariable}
    IF    ${vvariable} == 0
        Input Text    ${HEURE_DEBUT}    ${vheure_debut}
    END

# -- si on veut cocher la case journée entière, on ne remplit pas les champs d'heure de début et de fin
Cocher Journee Entiere
    [Arguments]    ${vvariable}

    IF    ${vvariable} == 1
        Select Checkbox    ${CHECKBOX_ALLDAY}
    ELSE
        Unselect Checkbox    ${CHECKBOX_ALLDAY}
    END    

Choisir Date fin

    [Arguments]    ${vmois_fin}    ${vJOURfin}    ${vheure_fin}    ${vvariable}

    Click Element    ${DATE_FIN}

    ${vmois_voulu}=    Set Variable    Janvier 2029

    ${vmois_actuel}=    Get Text    xpath=//div[@class='calheader']
    ${vmois_actuel}=    Split String    ${vmois_actuel}    \n
    ${vmois_actuel}=    Get From List    ${vmois_actuel}    1
    ${vmois_actuel}=    Strip String    ${vmois_actuel}

    WHILE    $vmois_actuel != $vmois_fin

        Click Element    xpath=//a[@class='calnavright']
        Sleep    1s

        ${vmois_actuel}=    Get Text    xpath=//div[@class='calheader']
        ${vmois_actuel}=    Split String    ${vmois_actuel}    \n
        ${vmois_actuel}=    Get From List    ${vmois_actuel}    1
        ${vmois_actuel}=    Strip String    ${vmois_actuel}

    END
    Click Element    xpath=//table[contains(@class,'yui-calendar')]//a[normalize-space()='${vJOURfin}']  
     IF    ${vvariable} == 0
        Input Text    ${HEURE_FIN}    ${vheure_fin}  
    END
Cliquer Enregistrer
    Click Button    ${BTN_SAVE}

ajouter un tag
    [Arguments]    ${vtag}
    Input Text    ${input_tags}    ${vtag}
    Click Element    ${BTN_Ajouter}