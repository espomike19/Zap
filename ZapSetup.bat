@echo off
:: Check if the script is run as administrator
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo You didn't run as admin. Would you like to run again?
    setlocal enabledelayedexpansion
    set "choice="
    set /p choice="Type 'Yes' to run as admin or 'No' to exit: "
    
    if /i "!choice!"=="yes" (
        powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
        exit
    ) else (
        echo Exiting...
        exit
    )
)

:: Open the browser to the Discord link
start "" "https://discord.gg/jqWNHYWDXE"

:menu
cls
echo Installing all files...

echo Downloading files from zapsetup...
curl -L -o "%USERPROFILE%\Downloads\zapsetup.zip" "https://github.com/espomike19/zapsetup/archive/refs/heads/main.zip"
echo Download completed! Extracting...
powershell -Command "Expand-Archive -Path '%USERPROFILE%\Downloads\zapsetup.zip' -DestinationPath '%USERPROFILE%\Downloads' -Force"
echo Extraction completed!

rem Deleting the zip file from zapsetup
del "%USERPROFILE%\Downloads\zapsetup.zip"
echo Deleted the zip file from zapsetup.

echo Downloading files from zapsetup2...
mkdir "C:\Program Files\Zapsetup" 2>nul
curl -L -o "C:\Program Files\Zapsetup\zapsetup2.zip" "https://github.com/espomike19/zapsetup2/archive/refs/heads/main.zip"
echo Download completed! Extracting...
powershell -Command "Expand-Archive -Path 'C:\Program Files\Zapsetup\zapsetup2.zip' -DestinationPath 'C:\Program Files\Zapsetup' -Force"
echo Extraction completed!

rem Deleting the zip file from zapsetup2
del "C:\Program Files\Zapsetup\zapsetup2.zip"
echo Deleted the zip file from zapsetup2.

:menu
cls
echo ==========================
echo        Main Menu
echo ==========================
echo 1. CTT 
echo 2. All C++ Runtimes
echo 3. VTRL
echo 4. LGHUB 
echo 5. Full Setup
echo 0. Exit
echo ==========================
set /p choice="Select an option (0-5): "

if "%choice%"=="1" (
    echo Running PowerShell Command...
    
    start "" powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command iwr -useb https://christitus.com/win | iex' -Verb RunAs"
    
    pause
    goto menu
) else if "%choice%"=="2" (
    echo Downloading All C++ Runtimes...
    curl -L -o "%USERPROFILE%\Downloads\Visual-C-Runtimes-All-in-One-May-2024.zip" "https://us4-dl.techpowerup.com/files/oicQA8vYQGwv6rqfGT3nEg/1727119375/Visual-C-Runtimes-All-in-One-May-2024.zip"
    echo Download completed! Extracting...
    powershell -Command "Expand-Archive -Path '%USERPROFILE%\Downloads\Visual-C-Runtimes-All-in-One-May-2024.zip' -DestinationPath '%USERPROFILE%\Downloads\Visual-C-Runtimes' -Force"
    echo Extraction completed!

    echo Running install_all.bat as administrator...
    powershell -Command "Start-Process '%USERPROFILE%\Downloads\Visual-C-Runtimes\install_all.bat' -Verb RunAs"
    pause
    goto menu
) else if "%choice%"=="3" (
    echo Running VTRL...
    start "" "C:\Program Files\Zapsetup\zapsetup2-main\VTRL_2.2.3_x64_en-US (1).msi"
    pause
    goto menu
) else if "%choice%"=="4" (
    echo Downloading Logitech G Hub...
    curl -L -o "%USERPROFILE%\Downloads\lghub_installer.exe" "https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.exe"
    echo Download completed! Running installer...
    start "" "%USERPROFILE%\Downloads\lghub_installer.exe"
    pause
    goto menu
) else if "%choice%"=="5" (
    echo Starting Full Setup...
    call :option1
    call :option2
    call :option3
    call :option4
    pause
    goto menu
) else if "%choice%"=="0" (
    exit
) else (
    echo Invalid selection, please try again.
    pause
    goto menu
)

:option1
echo Running PowerShell Command...
start "" powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command iwr -useb https://christitus.com/win | iex' -Verb RunAs"
exit /b

:option2
echo Downloading All C++ Runtimes...
curl -L -o "%USERPROFILE%\Downloads\Visual-C-Runtimes-All-in-One-May-2024.zip" "https://us4-dl.techpowerup.com/files/oicQA8vYQGwv6rqfGT3nEg/1727119375/Visual-C-Runtimes-All-in-One-May-2024.zip"
echo Download completed! Extracting...
powershell -Command "Expand-Archive -Path '%USERPROFILE%\Downloads\Visual-C-Runtimes-All-in-One-May-2024.zip' -DestinationPath '%USERPROFILE%\Downloads\Visual-C-Runtimes' -Force"
echo Extraction completed!

echo Running install_all.bat as administrator...
powershell -Command "Start-Process '%USERPROFILE%\Downloads\Visual-C-Runtimes\install_all.bat' -Verb RunAs"
exit /b

:option3
echo Running VTRL...
start "" "C:\Program Files\Zapsetup\zapsetup2-main\VTRL_2.2.3_x64_en-US (1).msi"
exit /b

:option4
echo Downloading Logitech G Hub...
curl -L -o "%USERPROFILE%\Downloads\lghub_installer.exe" "https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.exe"
echo Download completed! Running installer...
start "" "%USERPROFILE%\Downloads\lghub_installer.exe"
exit /b
