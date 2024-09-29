@echo off
title Parche de LEGO Star Wars The Force Awakens
echo ================================================
echo         Parche para LEGO Star Wars TFA
echo ================================================

REM Obtener la unidad del sistema
set drive=%SystemDrive%

REM Informar al usuario
echo Navegando a la carpeta del juego...
cd d %drive%Users%username%AppDataRoamingWarner Bros. Interactive EntertainmentLEGO STAR WARS The Force AwakensGUI3

REM Borrar todo el contenido de la carpeta
echo Borrando el contenido de la carpeta GUI3...
del f q .
rmdir s q %drive%Users%username%AppDataRoamingWarner Bros. Interactive EntertainmentLEGO STAR WARS The Force AwakensGUI3

REM Remover los permisos de la carpeta
echo Removiendo permisos de la carpeta...
icacls %drive%Users%username%AppDataRoamingWarner Bros. Interactive EntertainmentLEGO STAR WARS The Force AwakensGUI3 deny %username%F

echo ================================================
echo Operación completada exitosamente.
echo Pulsa cualquier tecla para cerrar...
pause nul
