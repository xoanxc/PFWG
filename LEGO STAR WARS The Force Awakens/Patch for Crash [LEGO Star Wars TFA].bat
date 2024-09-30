@echo off
title Parche de LEGO Star Wars The Force Awakens
echo ================================================
echo         Parche para LEGO Star Wars TFA
echo ================================================

REM Obtener la unidad del sistema
set drive=%SystemDrive%
set username=%USERNAME%

:menu
cls
echo ================================================
echo         Menu del parche
echo ================================================
echo 1. Aplicar parche
echo 2. Revertir parche
echo 3. Salir
echo ================================================
set /p option=Selecciona una opción (1-3): 

if "%option%"=="1" goto parchear
if "%option%"=="2" goto revertir
if "%option%"=="3" exit
goto menu

:parchear
cls
echo Navegando a la carpeta del juego...
cd /d "%drive%\Users\%username%\AppData\Roaming\Warner Bros. Interactive Entertainment\LEGO STAR WARS The Force Awakens\GUI3"

REM Borrar todo el contenido de la carpeta
echo Borrando el contenido de la carpeta GUI3...
del /f /q *
rmdir /s /q "%drive%\Users\%username%\AppData\Roaming\Warner Bros. Interactive Entertainment\LEGO STAR WARS The Force Awakens\GUI3"

REM Remover los permisos de la carpeta
echo Removiendo permisos de la carpeta...
icacls "%drive%\Users\%username%\AppData\Roaming\Warner Bros. Interactive Entertainment\LEGO STAR WARS The Force Awakens\GUI3" /deny %username%:F

echo ================================================
echo Parche aplicado correctamente.
echo Pulsa cualquier tecla para volver al menú...
pause >nul
goto menu

:revertir
cls
echo Revertiendo cambios...
REM Restaurar permisos
icacls "%drive%\Users\%username%\AppData\Roaming\Warner Bros. Interactive Entertainment\LEGO STAR WARS The Force Awakens\GUI3" /reset

echo Permisos restaurados correctamente.
echo ================================================
echo Pulsa cualquier tecla para volver al menú...
pause >nul
goto menu
