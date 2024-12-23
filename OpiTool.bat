@echo off
:menu
cls
echo ==============================
echo  Optymalizacja Twojego komputera
echo ==============================
echo  1. Usun niepotrzebne pliki (Temp i Prefetch)
echo  2. Ustaw Time Resolution na 1ms
echo  3. Zmien plan zasilania na wysoka wydajnosc
echo  4. Czyszczenie pamieci DNS
echo  5. Wylaczenie animacji i efektow wizualnych
echo  6. Zwolnienie pamieci RAM
echo  7. Wylaczenie zbędnych usług
echo  8. Tworzenie punktu przywracania systemu
echo  9. Czyszczenie logow systemowych
echo  0. Wyjscie
echo ==============================
set /p choice="Wybierz opcje (0-9): "

if "%choice%"=="1" goto clean_all
if "%choice%"=="2" goto set_time_resolution
if "%choice%"=="3" goto high_performance
if "%choice%"=="4" goto flush_dns
if "%choice%"=="5" goto disable_animations
if "%choice%"=="6" goto free_memory
if "%choice%"=="7" goto disable_services
if "%choice%"=="8" goto create_restore_point
if "%choice%"=="9" goto clean_logs
if "%choice%"=="0" goto end
goto menu

:clean_all
echo Usuwanie niepotrzebnych plikow (Temp i Prefetch)...
del /q /f %temp%\*
del /q /f C:\Windows\Prefetch\*
echo Pliki zostaly usuniete.
pause
goto menu

:set_time_resolution
echo Ustawianie Time Resolution na 1ms...
powershell -command "& {Add-Type -TypeDefinition @'
using System.Runtime.InteropServices;
public class TimeResolution {
    [DllImport(\"winmm.dll\")]
    public static extern uint timeBeginPeriod(uint period);
    [DllImport(\"winmm.dll\")]
    public static extern uint timeEndPeriod(uint period);
}
'@ -PassThru | ForEach-Object { $_::timeBeginPeriod(1) } }"
echo Rozdzielczosc czasu ustawiona na 1ms.
pause
goto menu

:high_performance
echo Zmiana planu zasilania na wysoka wydajnosc...
powershell -command "& {
    $planHighPerformance = (powercfg /L | Select-String 'Wysoka wydajnosc').ToString().Split()[3]
    $planUltimatePerformance = (powercfg /L | Select-String 'Najwyzsza wydajnosc').ToString().Split()[3]
    if ($planUltimatePerformance) {
        Write-Output 'Ustawiam plan Najwyzsza wydajnosc...'
        powercfg /S $planUltimatePerformance
    } elseif ($planHighPerformance) {
        Write-Output 'Ustawiam plan Wysoka wydajnosc...'
        powercfg /S $planHighPerformance
    } else {
        Write-Output 'Plan Wysoka wydajnosc niedostepny. Upewnij sie, ze jest wlaczony.'
    }
}"
echo Plan zasilania zostal zmieniony.
pause
goto menu

:flush_dns
echo Czyszczenie pamieci DNS...
ipconfig /flushdns
echo Pamiec DNS zostala wyczyszczona.
pause
goto menu

:disable_animations
echo Wylaczanie animacji i efektow wizualnych...
powershell -command "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'UserPreferencesMask' -Value 98,12,01,80,12,00,00,00"
echo Animacje i efekty wizualne zostaly wylaczone.
pause
goto menu

:free_memory
echo Zwolnienie pamieci RAM...
powershell -command "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers();"
echo Pamiec RAM zostala zwolniona.
pause
goto menu

:disable_services
echo Wylaczanie zbędnych usług...
net stop wuauserv
net stop bits
echo Zbedne uslugi zostaly wylaczone.
pause
goto menu

:create_restore_point
echo Tworzenie punktu przywracania systemu...
powershell -command "Checkpoint-Computer -Description 'Przed optymalizacją' -RestorePointType 'Modify_Settings'"
echo Punkt przywracania systemu zostal utworzony.
pause
goto menu

:clean_logs
echo Czyszczenie logów systemowych...
powershell -command "wevtutil cl Application"
powershell -command "wevtutil cl System"
echo Logi systemowe zostaly wyczyszczone.
pause
goto menu

:end
echo Do zobaczenia!
pause
exit
