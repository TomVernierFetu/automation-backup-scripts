@echo off
:: ============================================================
:: TP Script BAT - Partie 2 : Sauvegarde distante compressée
:: Auteur : Tom Vernier-Fétu (BTS SIO)
:: Description : Sauvegarde 7-Zip horodatée sur partage réseau
:: ============================================================

title Sauvegarde distante sur serveur avec 7-Zip

echo ===================================================
echo     SAUVEGARDE COMPRESSEE SUR PARTAGE RESEAU
echo ===================================================

:: 1. Définition des variables d'environnement
set "SOURCE=%USERPROFILE%\Documents"
set "SERVEUR=\\192.168.10.2\tdsauvegarde"
set "LECTEUR=E:"
set "ZIP_PATH=C:\Program Files\7-Zip\7z.exe"

:: 2. Formatage de la date et de l'heure (sans / ni :)
:: Format jj/mm/aaaa -> aaaa-mm-jj
set "ANNEE=%date:~6,4%"
set "MOIS=%date:~3,2%"
set "JOUR=%date:~0,2%"

:: Format hh:mm:ss -> gestion si l'heure est inférieure à 10 (espace remplacé par 0)
set "HEURE=%time:~0,2%"
if "%HEURE:~0,1%"==" " set "HEURE=0%HEURE:~1,1%"
set "MINUTE=%time:~3,2%"

set "HORODATAGE=%ANNEE%%MOIS%%JOUR%_%HEURE%%MINUTE%"
set "ARCHIVE_NAME=sauv_%HORODATAGE%.zip"

:: 3. Montage du partage réseau sur le lecteur E:
echo Connexion au lecteur reseau %LECTEUR%...
net use %LECTEUR% %SERVEUR% /yes

:: 4. Compression des fichiers Word (.docx) et Excel (.xlsx) avec 7-Zip
echo.
echo Compression des fichiers .docx et .xlsx vers %LECTEUR%\%ARCHIVE_NAME%...
"%ZIP_PATH%" a "%LECTEUR%\%ARCHIVE_NAME%" "%SOURCE%\*.docx" "%SOURCE%\*.xlsx"

:: 5. Déconnexion du lecteur réseau
echo.
echo Deconnexion du lecteur reseau %LECTEUR%...
net use %LECTEUR% /delete /yes

:: 6. Confirmation finale
echo.
echo ===================================================
echo Sauvegarde distante terminee avec succes : %ARCHIVE_NAME%
echo ===================================================

pause
