@echo off
title Parche de LEGO Star Wars The Force Awakens
echo ================================================
echo         Parche para LEGO Star Wars TFA
echo ================================================

REM Obtener la unidad del sistema y el nombre de usuario
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
set gamepath=%drive%\Users\%username%\AppData\Roaming\Warner Bros. Interactive Entertainment\LEGO STAR WARS The Force Awakens\GUI3

if exist "%gamepath%" (
    REM Remover todos los permisos (usuario actual y administrador)
    echo Removiendo permisos de la carpeta...
    icacls "%gamepath%" /deny %username%:F >nul
    icacls "%gamepath%" /deny Administrators:F >nul

    echo ================================================
    echo Permisos removidos correctamente.
) else (
    echo ================================================
    echo No se encontró la carpeta del juego.
)

echo Pulsa cualquier tecla para volver al menú...
pause >nul
goto menu

:revertir
cls
echo Revertiendo cambios...
if exist "%gamepath%" (
    REM Restaurar permisos
    icacls "%gamepath%" /reset >nul
    echo Permisos restaurados correctamente.
) else (
    echo No se encontró la carpeta del juego.
)

echo ================================================
echo Pulsa cualquier tecla para volver al menú...
pause >nul
goto menu
