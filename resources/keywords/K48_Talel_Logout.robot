link_HeaderUserMenu = "id=HEADER_USER_MENU_POPUP_text"
link_HeaderDeconnexion = "id=HEADER_USER_MENU_LOGOUT_text"

Logout
    Sleep    1s
    Click Element	${link_HeaderUserMenu}
    Sleep    2s
    #Wait Until Element Is Visible    ${link_HeaderDeconnexion}
    Click Element                    ${link_HeaderDeconnexion}
    [Teardown]    Close Browser