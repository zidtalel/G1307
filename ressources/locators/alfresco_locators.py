# Page de connexion
txt_UserName = "name=username"
txt_Password = "name=password"
btn_Login = "xpath=//button[contains(text(), 'Connexion')]"
lblTitle = "//div[@id='HEADER_TITLE_BAR']/header/div"

# Menu principal
link_OptionAdmin = "//a[@href='"
link_MenuOption = "//span[@id='HEADER_"
link_HeaderUserMenu = "id=HEADER_USER_MENU_POPUP_text"
link_HeaderDeconnexion = "id=HEADER_USER_MENU_LOGOUT_text"

# Ajouter module Elements
drag_Module1 = "//h3[text()='"
drag_Module2 = "']/ancestor::li"
drop_Module = "//*[@id='template_x002e_customise-pages_x002e_customise-site_x0023_default']/div[5]"
btn_Ok_Ajouter_Module = "//button[contains(.,'OK')]"

# Options de disposition du tableau de bord
img_RoueDentee = "//div[@id='HEADER_CUSTOMIZE_USER_DASHBOARD']/img"
btn_ChangerDisposition = "//*[@id='template_x002e_customise-layout_x002e_customise-user-dashboard_x0023_default-change-button-button']"
btn_Mode = "//button[@id='template_x002e_customise-layout_x002e_customise-user-dashboard_x0023_default-select-button-dashboard"
btn_OK = "//button[@id='template_x002e_customise-dashlets_x002e_customise-user-dashboard_x0023_default-save-button-button']"

# Administration des modèles
menu_Actions1 = "//td[contains(@class,'nameColumn')]//span[text()='"
menu_Actions2 ="']/ancestor::tr/td[contains(@class,'actionsColumn')]//span[text()='Actions']"
menu_Action_Option1 = "//div[@role='region']//img[@title='"
menu_Action_Option2 = "']"
btn_Annuler_Supprimer_Modele = "//div[@role='dialog' and .//span[text()='Supprimer le modèle']]//span[@role='button' and .//span[text()='Annuler']]"
btn_Annuler_Modifier_Modele = "//*[@id='CMM_EDIT_MODEL_DIALOG_CANCEL_label']"



# K14 - Wiki
input_WikiTitle = "xpath=//input[@name='pageTitle']"
frame_WikiContent = "xpath=//iframe[contains(@id,'_ifr')]"
body_WikiContent = "xpath=//body[@id='tinymce']"
btn_WikiSave = "xpath=//*[contains(text(),'Enregistrer') or contains(text(),'Save')]"

