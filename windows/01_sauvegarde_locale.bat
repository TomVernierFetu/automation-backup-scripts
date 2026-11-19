@echo off
:: Sauvegarde les fichiers .docx vers le lecteur P:

title Sauvegarde locale des documents Word

echo ===================================================
echo     SAUVEGARDE DES DOCUMENTS WORD EN COURS
echo ===================================================

:: Définition des répertoires source et destination
set "SOURCE=%USERPROFILE%\Documents"
set "DESTINATION=P:\Sauve"

:: Vérifier si le dossier de destination existe, sinon le créer
if not exist "%DESTINATION%" (
    echo Creation du repertoire de sauvegarde sur P:...
    mkdir "%DESTINATION%"
)

:: Copie des fichiers Word (.docx) vers le lecteur P:
echo Copie des fichiers .docx depuis "%SOURCE%" vers "%DESTINATION%"...
copy "%SOURCE%\*.docx" "%DESTINATION%\" /Y

:: Message de confirmation de fin de script
echo.
echo ===================================================
echo Script effectue avec succes !
echo ===================================================

:: Pause pour valider le résultat lors du recettage
pause
