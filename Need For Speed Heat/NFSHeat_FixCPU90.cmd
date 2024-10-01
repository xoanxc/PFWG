@echo off
title Fix 90%% CPU Load - NEED FOR SPEED HEAT
set "CPU_Cores=0"
set "CPU_Threads=0"
set "UserCFGFileCDDir=%~dp0"
set "UserCFGFileName=user.cfg"
set "UserCFGFile=%UserCFGFileCDDir%%UserCFGFileName%"
set "backupFile=%UserCFGFileCDDir%%UserCFGFileName%.bak"

for /f "tokens=2 delims= " %%a in ('"wmic CPU Get DeviceID,NumberOfCores,NumberOfLogicalProcessors"') do set "CPU_Cores=%%a"
for /f "tokens=3 delims= " %%a in ('"wmic CPU Get DeviceID,NumberOfCores,NumberOfLogicalProcessors"') do set "CPU_Threads=%%a"

if %CPU_Cores% == 0 goto oops_a

:menu
cls
echo.
echo  ================================================
echo              FIX 90%% CPU LOAD For NFS  
echo  ================================================
echo.
echo     ==== CPU Information ====
echo       Cores  : %CPU_Cores%
echo       Threads: %CPU_Threads%
echo     =========================
echo.
@echo off
title Fix 90%% CPU Load - NEED FOR SPEED HEAT
set "CPU_Cores=0"
set "CPU_Threads=0"
set "UserCFGFileCDDir=%~dp0"
set "UserCFGFileName=user.cfg"
set "UserCFGFile=%UserCFGFileCDDir%%UserCFGFileName%"
set "backupFile=%UserCFGFileCDDir%%UserCFGFileName%.bak"
for /f "skip=1 tokens=2 delims=," %%a in ('"wmic CPU Get NumberOfCores /format:csv"') do set "CPU_Cores=%%a"
for /f "skip=1 tokens=2 delims=," %%a in ('"wmic CPU Get NumberOfLogicalProcessors /format:csv"') do set "CPU_Threads=%%a"
@echo off
title Fix 90%% CPU Load - NEED FOR SPEED HEAT
set "CPU_Cores=0"
set "CPU_Threads=0"
set "UserCFGFileCDDir=%~dp0"
set "UserCFGFileName=user.cfg"
set "UserCFGFile=%UserCFGFileCDDir%%UserCFGFileName%"
set "backupFile=%UserCFGFileCDDir%%UserCFGFileName%.bak"

for /f "skip=1 tokens=2 delims=," %%a in ('"wmic CPU Get NumberOfCores /format:csv"') do set "CPU_Cores=%%a"
for /f "skip=1 tokens=2 delims=," %%a in ('"wmic CPU Get NumberOfLogicalProcessors /format:csv"') do set "CPU_Threads=%%a"
echo     [1] Create user.cfg file
echo     [2] Revert changes (delete user.cfg)
echo     [3] Exit
echo.
set /p "option=  Enter your choice (1-3): "

if "%option%"=="1" goto create_cfg
if "%option%"=="2" goto revert_changes
if "%option%"=="3" exit

:create_cfg
cls
echo.
echo  ================================================
echo           Creating user.cfg file...
echo  ================================================

if exist "%UserCFGFile%" (
    if not exist "%backupFile%" (
        rename "%UserCFGFile%" "%UserCFGFileName%.bak"
    ) else (
        del "%UserCFGFile%" /q /f
    )
)

echo Thread.ProcessorCount %CPU_Cores% >> "%UserCFGFile%"
echo Thread.MaxProcessorCount %CPU_Cores% >> "%UserCFGFile%"
echo Thread.MinFreeProcessorCount 0 >> "%UserCFGFile%"
echo Thread.JobThreadPriority 0 >> "%UserCFGFile%"
echo GstRender.Thread.MaxProcessorCount %CPU_Threads% >> "%UserCFGFile%"

if exist "%UserCFGFile%" (
    echo.
    echo  ================================================
    echo      user.cfg created successfully!
    echo  ================================================
    echo.
) else (
    echo.
    echo  ================================================
    echo      Failed to create user.cfg!
    echo  ================================================
    echo.
)
pause
goto menu

:revert_changes
cls
echo.
echo  ================================================
echo         Reverting changes...
echo  ================================================

if exist "%UserCFGFile%" (
    del "%UserCFGFile%" /q /f
    echo.
    echo  ================================================
    echo      user.cfg file deleted!
    echo  ================================================
    echo.
) else (
    echo.
    echo  ================================================
    echo      user.cfg file not found!
    echo  ================================================
    echo.
)

if exist "%backupFile%" (
    rename "%backupFile%" "%UserCFGFileName%"
    echo.
    echo  ================================================
    echo      Backup restored to user.cfg!
    echo  ================================================
    echo.
)

pause
goto menu

:oops_a
cls
echo.
echo  ================================================
echo      Oooops, something went wrong :( (code: a)
echo  ================================================
echo.
pause
exit