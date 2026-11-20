# ⚙️ Automation & Backup Scripts — Windows Batch & Linux Shell

Ensemble de scripts d'automatisation de tâches d'administration système, de stratégies de sauvegarde de données (locales, distantes et FTP) et d'administration système sous **Windows (Batch `.bat`)** et **Linux (Bash `.sh`)**.

Suite de scripts d'administration et d'automatisation des sauvegardes sous Windows (Batch) et Linux (Bash).

---

## 📁 Structure du Projet

```text
automation-backup-scripts/
├── windows/
│   ├── 01_sauvegarde_locale.bat         # Sauvegarde simple de documents
│   ├── 02_sauvegarde_reseau_7zip.bat    # Sauvegarde compressée et horodatée sur partage réseau
│   └── 03_sauvegarde_ftp.bat            # Transfert automatisé vers serveur FTP (FileZilla)
├── linux/
│   └── tp_commandes_shell.sh            # Script de synthèse des commandes Debian 13
├── .gitignore
└── README.md
```

---

## 🪟 1. Scripts Windows Batch (`.bat`)

### `01_sauvegarde_locale.bat`
- **Objectif** : Sauvegarde locale automatique des documents bureautiques (`*.docx`).
- **Fonctionnement** : Détection dynamique du profil utilisateur (`%USERPROFILE%`), vérification et création automatique du dossier cible (`P:\Sauve`), copie des fichiers et pause pour validation.

### `02_sauvegarde_reseau_7zip.bat`
- **Objectif** : Sauvegarde distante centralisée avec compression et rétention d'historique.
- **Fonctionnement** :
  - Montage d'un lecteur réseau logique `E:` via la commande `net use \\192.168.10.2\tdsauvegarde`.
  - Horodatage dynamique de l'archive (`aaaa-mm-jj_hh-mm`) par découpage des variables système `%date%` et `%time%`.
  - Compression des fichiers Word et Excel via l'utilitaire **7-Zip** en ligne de commande (`7z.exe a`).
  - Démontage propre du lecteur réseau après exécution (`net use E: /delete`).

### `03_sauvegarde_ftp.bat`
- **Objectif** : Externalisation de sauvegardes compressées vers un serveur distant via le protocole FTP (ex : FileZilla Server).
- **Fonctionnement** :
  - Compression locale temporaire de l'archive.
  - Génération dynamique d'un fichier de commandes FTP d'authentification et de transfert en mode binaire.
  - Exécution automatisée avec `ftp -s:commandes_ftp.txt`.
  - Suppression sécurisée des fichiers temporaires à la fin du transfert.

---

## 🐧 2. Script Linux Bash (`.sh`)

### `tp_commandes_shell.sh`
- **Objectif** : Démonstration et automatisation des opérations courantes d'administration système sous distribution Debian.
- **Fonctionnalités couvertes** :
  - **Gestion de fichiers** : Création d'arborescences (`mkdir -p`), manipulation de contenu (`cat`, `cp`), création de liens physiques (`ln`).
  - **Recherche & Redirections** : Filtres avancés avec `find` et redirection du flux de sortie (`>`).
  - **Gestion des droits & Propriétaires** : Attribution des permissions numériques (`chmod 644`) et rappels d'administration (`adduser`, `groupadd`, `usermod`, `userdel`).

---

## 🚀 Utilisation

### Sous Windows
Exécuter les scripts `.bat` par double-clic ou directement dans l'Invite de commandes (`cmd`).

### Sous Linux
```bash
# Donner les droits d'exécution
chmod +x linux/tp_commandes_shell.sh

# Lancer le script
./linux/tp_commandes_shell.sh
```

---

## 👤 Auteur

* **Tom Vernier-Fétu** — Développeur junior en recherche d'alternance.
