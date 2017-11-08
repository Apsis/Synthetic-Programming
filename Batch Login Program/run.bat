@echo off
mode con cols=65 lines=32
setlocal enabledelayedexpansion
color 0a
title Login Program

:start1
cls
echo Input a number and press enter...
echo.
echo 1) Login
echo 2) Create New Account
set /p loginx1=">> "
if not %loginx1% leq 2 goto start1
if %loginx1% equ 1 goto login
echo What do you want your username to be?
set /p username1=">>> "
set v1f=0

:findspaces
set x=!v1f!
set Letter%v1f%=!username1:~%x%,1!
if "!Letter%v1f%!" equ " " (
echo.
echo.
echo Sorry, no spaces allowed in your username...
pause >nul
goto start1
)
if NOT "!Letter%v1f%!" equ "" (
set /a v1f=%v1f%+1
goto findspaces
)
echo What do you want your password to be?
set /p password1=">>> "
goto save

:login
cls
set /p name1=Username:
if not exist "%name1%.bat" (
echo Invalid Username...
pause >nul
goto start1
)
set /p pass1=Password:
call %name1%.bat
if not %password1% equ %pass1% (
echo Invalid Password
pause >nul
goto start1
)
goto menu

:save
(
echo set username1=%username1%
echo set password1=%password1%
)>%username1%.bat
goto start1

:menu
echo Logged in!
pause >nul