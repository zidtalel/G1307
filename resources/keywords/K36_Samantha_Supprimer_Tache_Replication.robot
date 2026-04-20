# Supprimer un tache de replication
link_Job1 = "//div[contains(@class,'jobs-list-container')]//a[.//span[text()='"
link_Job2 = "']]"
list_Jobs = "//div[@class='job-buttons']"
btn_DeleteJob = "//div[@class='job-buttons']/span/span/button[contains(@id,'delete-button')]"

# Alerte de confirmation 
div_Alert = "//div[@id='prompt']"
# A modifier selon le langage du navigateur utilisé
Angalis : Delete
Francais : Supprimer 
btn_ConfirmAlert = "//div[@id='prompt']//button[contains(text(),'Supprimer')]"

Supprimer un tache de replication
    # Ce mot clé permet de supprimer une tache de replication sur Outils Admin
    # vURL_Blog : http://localhost:8084/share/page/console/admin-console/replication-jobs
    # vNom_Job contient le nom exact du job a supprimer
    [Arguments]    ${vNom_Job}    ${vTimeOut}
    Go To    ${vURL}/share/page/console/admin-console/replication-jobs    
    ${job_locator}=    Set Variable    ${link_Job1}${vNom_Job}${link_Job2}
    Wait Until Element Is Visible    ${job_locator}
    Click Element    ${job_locator}
    Wait Until Element Is Visible    ${btn_DeleteJob}
    Click Element    ${btn_DeleteJob}
    # Handle alert
    Wait Until Element Is Visible    ${div_Alert}
    Click Button    ${btn_ConfirmAlert}
    # Confirmer que le job n'est plus visible
    Wait Until Page Does Not Contain Element    ${job_locator}