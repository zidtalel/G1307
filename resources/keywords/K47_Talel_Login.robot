# Login Page Elements
txt_UserName = "name=username"
txt_Password = "name=password"
btn_Login = "xpath=//button[contains(text(), 'Connexion')]"
lblTitle = "//div[@id='HEADER_TITLE_BAR']/header/div"

Login
    # vURL contient l'adresse URL de la page web
    # vBrowser contient l'identifiant du navigateur cible
    # vUsername contient le login
    # vPassword contient le mot de passe
    [Arguments]    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    Set Selenium Timeout    ${TIMEOUT}
    Open Browser    ${vURL}    ${vBrowser}    add_argument('--lang=fr')
    Maximize Browser Window
    Input text    ${txt_UserName}    ${vUsername}
    Input text    ${txt_Password}    ${vPassword}
    Click Button    ${btn_Login}
    Wait Until Element Is Visible    ${lblTitle}
    # S'assurer que l'utilisateur est connecte et que le tableau de bord est affiche
    Element Should Contain    ${lblTitle}    Tableau de bord de