#!/bin/bash
# TC2 - TP Commandes Shell sous Linux (Debian 13)

echo "=== DEMONSTRATION DES COMMANDES SHELL LINUX ==="
echo

# PARTIE 1 : GESTION DES FICHIERS ET REPERTOIRES
echo "--- 1. Creation des repertoires rep1, rep2, rep3 dans /tmp/tpshell ---"
BASE_DIR="/tmp/tpshell"
mkdir -p "$BASE_DIR/rep1" "$BASE_DIR/rep2" "$BASE_DIR/rep3"

echo "Contenu du dossier de base :"
ls -l "$BASE_DIR"

echo
echo "--- 2. Creation et manipulation du fichier document ---"
echo "Contenu initial du document cree pour le script shell" > "$BASE_DIR/rep1/document.txt"
echo "Contenu avec la commande cat :"
cat "$BASE_DIR/rep1/document.txt"

# Copie vers rep2 et rep3
cp "$BASE_DIR/rep1/document.txt" "$BASE_DIR/rep2/document.txt"
cp "$BASE_DIR/rep1/document.txt" "$BASE_DIR/rep3/document_copie.txt"

# Creation d'un lien physique (hard link)
ln "$BASE_DIR/rep1/document.txt" "$BASE_DIR/rep3/document2.txt"

# Recherche de fichiers avec find
echo
echo "Recherche des fichiers se terminant par .txt :"
find "$BASE_DIR" -name "*.txt"

# Redirection de la liste des fichiers vers un fichier bilan
find "$BASE_DIR" -type f > "$BASE_DIR/liste_fichiers.txt"

# PARTIE 2 : ADMINISTRATION DES UTILISATEURS ET GROUPES (Rappels)
echo
echo "--- 2. Rappel des commandes d'administration d'utilisateurs ---"
echo "# Creation d'un groupe : sudo groupadd gr1"
echo "# Creation d'un utilisateur avec dossier : sudo adduser util1"
echo "# Ajout d'un utilisateur a un groupe : sudo usermod -aG gr1 util1"
echo "# Afficher les groupes d'un utilisateur : groups util1"
echo "# Supprimer un utilisateur et son home : sudo userdel -r util3"

# PARTIE 3 : GESTION DES DROITS D'ACCES (chmod / chown / chgrp)
echo
echo "--- 3. Gestion des droits d'acces ---"
# Droits en lecture seule pour tous : 444
chmod 644 "$BASE_DIR/rep1/document.txt"
echo "Droits appliques sur document.txt :"
ls -l "$BASE_DIR/rep1/document.txt"

echo
echo "=== Fin du script de synthese SHELL ==="
