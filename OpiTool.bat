@echo off
:menu
cls
echo ==============================
echo  OpiTool
echo ==============================
echo  1. Delete unnecessary files (Temp and Prefetch)
echo  2. Set Time Resolution to 1ms
echo  3. Change power plan to High Performance
echo  4. Clear DNS cache
echo  5. Disable animations and visual effects
echo  6. Free up memory (RAM)
echo  7. Disable unnecessary services
echo  8. Create a system restore point
echo  9. Clear system logs
echo  0. Exit
echo ==============================
set /p choice="Choose an option (0-9): "

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
echo Deleting unnecessary files (Temp and Prefetch)...
del /q /f %temp%\*
del /q /f C:\Windows\Prefetch\*
echo Files have been deleted.
pause
goto menu

:set_time_resolution
echo Setting Time Resolution to 1ms...
powershell -command "& {Add-Type -TypeDefinition @'
using System.Runtime.InteropServices;
public class TimeResolution {
    [DllImport(\"winmm.dll\")]
    public static extern uint timeBeginPeriod(uint period);
    [DllImport(\"winmm.dll\")]
    public static extern uint timeEndPeriod(uint period);
}
'@ -PassThru | ForEach-Object { $_::timeBeginPeriod(1) } }"
echo Time resolution has been set to 1ms.
pause
goto menu

:high_performance
echo Changing power plan to High Performance...
powershell -command "& {
    $planHighPerformance = (powercfg /L | Select-String 'High performance').ToString().Split()[3]
    $planUltimatePerformance = (powercfg /L | Select-String 'Ultimate performance').ToString().Split()[3]
    if ($planUltimatePerformance) {
        Write-Output 'Setting to Ultimate performance plan...'
        powercfg /S $planUltimatePerformance
    } elseif ($planHighPerformance) {
        Write-Output 'Setting to High performance plan...'
        powercfg /S $planHighPerformance
    } else {
        Write-Output 'High performance plan not available. Make sure it is enabled.'
    }
}"
echo Power plan has been changed.
pause
goto menu

:flush_dns
echo Clearing DNS cache...
ipconfig /flushdns
echo DNS cache has been cleared.
pause
goto menu

:disable_animations
echo Disabling animations and visual effects...
powershell -command "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'UserPreferencesMask' -Value 98,12,01,80,12,00,00,00"
echo Animations and visual effects have been disabled.
pause
goto menu

:free_memory
echo Freeing up memory (RAM)...
powershell -command "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers();"
echo Memory (RAM) has been freed.
pause
goto menu

:disable_services
echo Disabling unnecessary services...
net stop wuauserv
net stop bits
echo Unnecessary services have been disabled.
pause
goto menu

:create_restore_point
echo Creating system restore point...
powershell -command "Checkpoint-Computer -Description 'Before optimization' -RestorePointType 'Modify_Settings'"
echo A restore point has been created.
pause
goto menu

:clean_logs
echo Clearing system logs...
powershell -command "wevtutil cl Application"
powershell -command "wevtutil cl System"
echo System logs have been cleared.
pause
goto menu

:end
echo Goodbye!
pause
exit
