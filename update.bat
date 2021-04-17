@echo off
rem update.bat transfers all files from the GitHub
rem to the development_ folders of minecraft
rem so that joining the host world will have
rem all the required files
if not exist "C:\Users\%username%\Documents\GitHub\Folder" (
echo You have to set the GitHub clone directory to Folder
pause
) else (
if not exist "C:\Users\%username%\Documents\GitHub\Folder\resource_packs\Resources" (
echo You have pull the GitHub...
pause
) else (
xcopy C:\Users\%username%\Documents\GitHub\Folder\resource_packs\Resources\ C:\Users\%username%\AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_resource_packs\UXResources\ /s
xcopy C:\Users\%username%\Documents\GitHub\Folder\behavior_packs\Behavior\ C:\Users\%username%\AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_behavior_packs\UXBehavior\ /s
echo Updated your pack to the GitHub version 
type version.txt
pause
           ))
if errorlevel 4 goto lowmemory
if errorlevel 2 goto abort
if errorlevel 0 goto exit
:lowmemory
echo Insufficient memory to copy files
goto exit
:abort
echo You pressed CTRL+C to end the copy operation.
goto exit
:exit