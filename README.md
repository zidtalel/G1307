## 🚀 Alfresco Automation Keywords - Projet G1307

Ce dépôt sert de **bibliothèque centrale** pour le développement collaboratif de *Keywords* réutilisables pour le **Robot Framework**, dédiés au projet d'automatisation des tests sur l'application **Alfresco**.

Le but principal est de constituer une base solide de **$\approx 50$ actions communes** pour faciliter et accélérer l'écriture des scripts de tests futurs.

-----

### 🎯 Objectifs du Projet Collaboratif

  * **Standardisation :** Définir et appliquer des conventions de nommage et de structure de code pour une maintenance aisée.
  * **Réutilisation :** Créer des Keywords génériques et robustes qui peuvent être utilisés dans de multiples scénarios de tests.
  * **Collaboration :** Apprendre à travailler en équipe sur un dépôt Git/GitHub, incluant la gestion des Pull Requests et des conflits.

-----

### 📂 Structure du Dépôt

Le dossier clé de ce dépôt est `Keywords`.

| Dossier | Contenu | Rôle |
| :--- | :--- | :--- |
| **`Keywords/`** | Tous les fichiers `.robot` contenant les Keywords. | Le cœur de la librairie de Keywords réutilisables. **C'est ici que vous travaillerez.** |
| `data/` | Fichiers de données (si nécessaire : CSV, JSON, etc.). | Non pertinent pour cette phase, mais peut être utilisé plus tard. |
| `resources/` | Fichiers de configuration ou de ressources partagées. | Peut être utilisé pour définir des variables ou des librairies communes. |


### 📦 Télécharger le Template de Projet

Vous pouvez télécharger un **template de projet** prêt à l'emploi, illustrant l'utilisation des mots clés principaux de ce dépôt. Ce template montre comment intégrer et enchaîner les Keywords dans des scripts Robot Framework.

👉 [Télécharger le template ProjetRobotAlfresco.zip](https://github.com/zidtalel/G1307/ProjetRobotAlfresco.zip)

**Mots clés utilisés dans l'exemple fourni :**

- K43 : Ajouter un module dans un site
- K44 : Menu Outils admin
- K45 : Main menu
- K46 : Login
- K47 : Logout
- K48 : Changer de disposition
- K49 : Menu Action

### 📝 Conventions de Nommage et Localisation des Fichiers

Pour assurer la cohérence et la facilité de recherche, le respect des conventions suivantes est **obligatoire** :

#### 1\. Emplacement

Tous les fichiers de Keywords doivent être stockés **uniquement** dans le dossier `Keywords/`.

#### 2\. Nommage du Fichier (`*.robot`)

Le nom du fichier doit être structuré comme suit :
  * **`K##` :** Le code unique du Keyword (ex: `k47`) tel qu'indiqué dans le **fichier Excel de répartition des tâches**.
  * **`Prénom` :** Votre prénom pour identifier le contributeur initial.
  * **`NomDuKeyword` :** Un nom clair et descriptif de l'action principale (ex: `Login`, `CreateDocument`).

> **✅ Exemple Correct :** `k47_Talel_Login.robot`
> **❌ Exemple Incorrect :** `Login-page.robot`

#### 3\. Caractères Autorisés

  * N'utilisez que : **Lettres** (a-z, A-Z), **Chiffres** (0-9), et le **Tiret Bas** (`_`).
  * **Interdit :** Caractères accentués (`é`, `à`, `ç`, etc.), espaces, et autres caractères spéciaux (`-`, `!`, `&`, etc.).

-----

### 📜 Structure du Contenu du Fichier

Chaque fichier `.robot` doit être organisé en **deux sections principales** pour une lisibilité maximale :

#### 1\. Section des Localisateurs (Variables)

Placez les localisateurs des éléments (XPath, ID, Name, etc.) au **tout début** du fichier, en utilisant une convention de nommage claire (ex: préfixe pour le type d'élément).

```robot framework
# Login Page Elements
# Convention : TypeElement_NomDescriptif
txt_UserName = "name=username"
txt_Password = "name=password"
btn_Login = "xpath=//button[contains(text(), 'Connexion')]"
lbl_Title = "//div[@id='HEADER_TITLE_BAR']/header/div"
```

#### 2\. Section du Keyword (Test Cases)

Le code du Keyword doit suivre immédiatement la section des variables.

#### 📣 Commentaire & Documentation (Crucial)

**Il est OBLIGATOIRE de commenter et documenter au maximum votre script.**

  * Utilisez la section `Documentation` du Keyword.
  * Commentez chaque ligne ou bloc d'action complexe.
  * Décrivez clairement les arguments attendus (`[Arguments]`).

<!-- end list -->

```robot framework
Login
    [Documentation]    Permet de se connecter à l'application Alfresco.
    ...                Vérifie la redirection vers le 'Tableau de bord'.
    [Arguments]    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}

    # vURL : Adresse URL de la page web cible.
    # vBrowser : Navigateur à utiliser (ex: chrome, firefox).
    # vUsername : Login de l'utilisateur.
    # vPassword : Mot de passe de l'utilisateur.

    Set Selenium Timeout    ${TIMEOUT}
    Open Browser    ${vURL}    ${vBrowser}    add_argument('--lang=fr')
    Maximize Browser Window
    
    # Saisie des identifiants
    Input text    ${txt_UserName}    ${vUsername}
    Input text    ${txt_Password}    ${vPassword}
    Click Button    ${btn_Login}

    # Vérification post-connexion
    Wait Until Element Is Visible    ${lblTitle}
    # S'assurer que l'utilisateur est connecté et que le tableau de bord est affiché
    Element Should Contain    ${lblTitle}    Tableau de bord de
```

-----

### ⚙️ Contribution : Workflow Git

1.  **Clonez** le projet en local.
2.  Créez une **nouvelle branche** pour votre travail : `git checkout -b k47-login-prenom`.
3.  Rédigez votre fichier `.robot` dans le dossier `Keywords/`.
4.  **Committez** vos changements : `git commit -m "(k47): Ajout du keyword Login par Prenom"`.
5.  **Pushez** votre branche : `git push origin k47-login-prenom`.
6.  Ouvrez une **Pull Request (PR)** sur la branche `master` du dépôt original.

**Faites valider votre code par l'équipe avant de fusionner \!**

-----

### ❓ Besoin d'aide ou Questions ?

N'hésitez pas à poser vos questions dans Teams ou lors du prochain cours. Bonne automatisation \!

-----
