@echo off
:: Compression 7-Zip et transfert automatique par FTP

title Sauvegarde et transfert FTP vers FileZilla Server

echo ===================================================
echo     SAUVEGARDE COMPRESSEE ET TRANSFERT FTP
echo ===================================================

:: 1. Configuration des chemins et paramètres FTP
set "SOURCE=%USERPROFILE%\Documents"
set "DOSSIER_TEMP=%TEMP%\sauvegarde_ftp"
set "ZIP_PATH=C:\Program Files\7-Zip\7z.exe"

set "FTP_SERVEUR=127.0.0.1"
set "FTP_USER=backup_user"
set "FTP_PASS=btssio"

:: 2. Formatage de la date et de l'heure
set "ANNEE=%date:~6,4%"
set "MOIS=%date:~3,2%"
set "JOUR=%date:~0,2%"
set "HEURE=%time:~0,2%"
if "%HEURE:~0,1%"==" " set "HEURE=0%HEURE:~1,1%"
set "MINUTE=%time:~3,2%"

set "HORODATAGE=%ANNEE%%MOIS%%JOUR%_%HEURE%%MINUTE%"
set "ARCHIVE_NAME=sauv_ftp_%HORODATAGE%.zip"

:: 3. Création du dossier temporaire
if not exist "%DOSSIER_TEMP%" mkdir "%DOSSIER_TEMP%"

:: 4. Compression locale de l'archive
echo Compression des fichiers en cours...
"%ZIP_PATH%" a "%DOSSIER_TEMP%\%ARCHIVE_NAME%" "%SOURCE%\*.docx" "%SOURCE%\*.xlsx"

:: 5. Génération dynamique du script de commandes FTP
set "SCRIPT_FTP=%DOSSIER_TEMP%\commandes_ftp.txt"
echo open %FTP_SERVEUR% > "%SCRIPT_FTP%"
echo %FTP_USER% >> "%SCRIPT_FTP%"
echo %FTP_PASS% >> "%SCRIPT_FTP%"
echo binary >> "%SCRIPT_FTP%"
echo cd / >> "%SCRIPT_FTP%"
echo lcd "%DOSSIER_TEMP%" >> "%SCRIPT_FTP%"
echo put "%ARCHIVE_NAME%" >> "%SCRIPT_FTP%"
echo quit >> "%SCRIPT_FTP%"

:: 6. Exécution du transfert FTP
echo.
echo Connexion au serveur FTP et transfert de %ARCHIVE_NAME%...
ftp -s:"%SCRIPT_FTP%"

:: 7. Nettoyage du script de commandes FTP temporaire
del "%SCRIPT_FTP%"

echo.
echo ===================================================
echo Transfert FTP termine avec succes !
echo ===================================================

pause
