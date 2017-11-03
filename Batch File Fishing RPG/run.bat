@echo off
mode con cols=65 lines=32
setlocal enabledelayedexpansion
color f0
title Fishing RPG

:start1
cls
echo Input a number and press enter\return . . .
echo.
echo 1) Login
echo 2) Create New Account
set /p loginx1=">> "
if not %loginx1% leq 2 goto start1
if %loginx1% equ 1 goto login
echo What do you want your username to be?
set /p username1=">> "
set v1f=0
:findspaces
set x=!v1f!
set Letter%v1f%=!username1:~%x%,1!
if "!Letter%v1f%!" equ " " (
echo.
echo.
echo Sorry, no spaces allowed in your username...
echo If I allowed you to have spaces
echo in your username, then you
echo wouldn't be able to save you game...
pause >nul
goto start1
)
if NOT "!Letter%v1f%!" equ "" (
set /a v1f=%v1f%+1
goto findspaces
)
echo What do you want your password to be?
set /p password1=">> "
goto beginplaying

:login
cls
set /p name1=Username:
if not exist "%name1%.bat" (
echo Invalid username . . .
pause >nul
goto start1
)
set /p pass1=Password:
call %name1%.bat
if not %password1% equ %pass1% (
echo Invalid password . . .
pause >nul
goto start1
)
goto menu

:beginplaying
set money=500
set crab=0
set shrimp=0
set trout=0
set flounder=0
set shark=0
set salmon=0
set net=0
set cage=0
set harpoon=0
set rod=0
set flyrod=0
set boat1=0
set boat2=0
set boat3=0
set boat4=0
set boat5=0
set boat6=0
set boat7=0
set boat8=0
set shrimprate=1
set crabrate=1
set troutrate=1
set flounderrate=1
set sharkrate=1
set salmonrate=1
set axxx=0
set pcrab=25
set pshrimp=3
set ptrout=7
set pflounder=15
set pshark=50
set psalmon=10
set moa=0
set gwshark=0
set squid=0
set gsquid=0

:menu
cls
echo Fishing RPG Menu
echo.
Echo 1) Go Fish'n
echo 2) Store
echo 3) Boat Shop
echo 4) Gamble Gold
echo 5) Fish Market
echo 6) Your Items
echo 7) Rich Store
echo 8) Save Game
set /p x1=
if %x1% == 1 goto fishingLoop
if %x1% == 2 goto store
if %x1% == 3 goto boatstore
if %x1% == 4 goto gamble1
if %x1% == 5 goto market1
if %x1% == 6 goto checkitems
if %x1% == 7 goto richstore
if %x1% == 8 goto savegame1
goto menu

:boatstore
cls
echo Fishing RPG Boat Store
echo.
echo You currently have %money% Gold.
echo.
echo.
echo 1) Shrimp'n Boat: %boat1%
echo.                Costs 2,000 Gold.
echo 2) Small Boat:    %boat2%
echo.                Costs 20,000 Gold.
echo 3) Large Boat:   %boat3%
echo.                Costs 60,000 Gold.
echo 4) Rich Boat:    %boat4%
echo.                Costs 150,000 Gold.
echo 5) Pro Boat:     %boat5%
echo.                Costs 500,000 Gold.
echo 6) Dream Boat:   %boat6%
echo.                Costs 1,000,000 Gold.
echo 7) Elegant Boat: %boat7%
echo.                Costs 3,000,000 Gold.
echo 8) Titanic:      %boat8%
echo.                Costs 15,000,000 Gold.
echo 9) Goto Menu
set /p v1=
if %v1% == 1 goto boat1
if %v1% == 2 goto boat2
if %v1% == 3 goto boat3
if %v1% == 4 goto boat4
if %v1% == 5 goto boat5
if %v1% == 6 goto boat6
if %v1% == 7 goto boat7
if %v1% == 8 goto boat8
if %v1% == 9 goto menu
goto boatstore

:boat1
if %money% leq 1999 (
echo.
echo.
echo You don't have enough Gold.
pause >nul
goto boatstore
)
set /a money=%money% - 2000
set /a boat1=%boat1%+1
if %shrimprate% neq 1 (
set /a shrimprate=%shrimprate%+5
) else (
set /a shrimprate=%shrimprate%+4
)
echo.
echo.
echo Boat Purchased. With this boat you can now catch
echo %shrimprate% shrimp at one time.
pause >nul
goto boatstore
:boat2
if %money% leq 19999 (
echo.
echo.
echo You don't have enough Gold.
pause >nul
goto boatstore
)
set /a money=%money% - 20000
set /a boat2=%boat2%+1
if %troutrate% neq 1 (
set /a troutrate=%troutrate%+5
) else (
set /a troutrate=%troutrate%+4
)
echo.
echo.
echo Boat Purchased. With this boat you can now
echo catch %troutrate% trout at one time.
pause >nul
goto boatstore
:boat3
if %money% leq 59999 (
echo.
echo.
echo You don't have enough Gold.
pause >nul
goto boatstore
)
set /a money=%money% - 60000
set /a boat3=%boat3%+1
if %troutrate% neq 1 (
set /a troutrate=%troutrate%+15
) else (
set /a troutrate=%troutrate%+14
)
echo.
echo.
echo Boat Purchased. With this boat you can now
echo catch %troutrate% trout at one time.
pause >nul
goto boatstore
:boat4
if %money% leq 149999 (
echo.
echo.
echo You don't have enough Gold.
pause >nul
goto boatstore
)
set /a money=%money% - 150000
set /a boat4=%boat4%+1
if %salmonrate% neq 1 (
set /a salmonrate=%salmonrate%+10
) else (
set /a salmonrate=%salmonrate%+9
)
echo.
echo.
echo Boat Purchased. With this boat you can now
echo catch %salmonrate% salmon at one time.
pause >nul
goto boatstore

:boat5
if %money% leq 499999 (
echo.
echo.
echo You don't have enough Gold.
pause >nul
goto boatstore
)
set /a money=%money% - 500000
set /a boat5=%boat5%+1
if %flounderrate% neq 1 (
set /a flounderrate=%flounderrate%+15
) else (
set /a flounderrate=%flounderrate%+14
)
echo.
echo.
echo Boat Purchased. With this boat you
echo can catch %flounderrate% flounder at one time.
pause >nul
goto boatstore

:boat6
if %money% leq 999999 (
echo.
echo.
echo You don't have enough Gold.
pause >nul
goto boatstore
)
set /a money=%money% - 1000000
set /a boat6=%boat6%+1
if %crabrate% neq 1 (
set /a crabrate=%crabrate%+60
) else (
set /a crabrate=%crabrate%+59
)
echo.
echo.
echo Boat Purchased. With this boat you can
echo catch %crabrate% crab at one time.
pause >nul
goto boatstore

:boat7
if %money% leq 2999999 (
echo.
echo.
echo You don't have enough Gold.
pause >nul
goto boatstore
)
set /a money=%money% - 3000000
set /a boat7=%boat7%+1
if %sharkrate% neq 1 (
set /a sharkrate=%sharkrate%+25
) else (
set /a sharkrate=%sharkrate%+24
)
echo.
echo.
echo Boat Purchased. With this boat you
echo can catch %sharkrate% shark at one time.
pause >nul
goto boatstore

:boat8
if %money% leq 14999999 (
echo.
echo.
echo You don't have enough Gold.
pause >nul
goto boatstore
)
set /a money=%money% - 15000000
set /a boat8=%boat8%+1
if %sharkrate% neq 1 (
set /a sharkrate=%sharkrate%+150
) else (
set /a sharkrate=%sharkrate%+149
)
echo.
echo.
echo Boat Purchased. With this boat you can
echo catch %sharkrate% shark at one time.
pause >nul
goto boatstore


:store
cls
echo Fishing RPG Store
echo.
echo You currently have %money% Gold.
echo You currently have %shrimp% Shrimp.
echo You currently have %crab% Crabs.
echo You currently have %trout% Trout.
echo You currently have %salmon% Salmon.
echo You currently have %flounder% Flounder.
echo You currently have %shark% Sharks.
echo.
echo.
echo.
echo 1) Shrimp Net:        costs  100 Gold.
echo 2) Crab Cage:         costs  1,500 Gold.
echo 3) Harpoon:           costs  5,000 Gold.
echo 4) Fishing Rod:       costs  600 Gold.
echo 5) Fly Fishing Rod:   costs  1,000 Gold.
echo 6) Leave Store.
set /p x2=
if %x2% == 1 goto buynet
if %x2% == 2 goto buycage
if %x2% == 3 goto buyharp
if %x2% == 4 goto buyrod
if %x2% == 5 goto buyfly
if %x2% == 6 goto menu

:buyrod
if %rod% == 1 (
echo.
echo.
echo You already have a rod.
pause >nul
goto store
)
if %money% leq 599 (
echo.
echo.
echo You don't have enough Gold.
pause >nul
goto store
)
set /a money=%money% - 600
set rod=1
echo.
echo.
echo Rod purchased.
pause >nul
goto store

:buyfly
if %flyrod% == 1 (
echo.
echo.
echo You already have a fly fishing rod.
pause >nul
goto store
)
if %money% leq 999 (
echo.
echo.
echo You don't have enough Gold.
pause >nul
goto store
)
set /a money=%money% - 1000
set flyrod=1
echo.
echo.
echo Fly Fishing Rod purchased.
pause >nul
goto store

:buyharp
if %harpoon% == 1 (
echo.
echo.
echo You already have a harpoon.
pause >nul
goto store
)
if %money% leq 4999 (
echo.
echo.
echo You don't have enough Gold.
pause >nul
goto store
)
set /a money=%money% - 5000
set harpoon=1
echo.
echo.
echo Harpoon purchased.
pause >nul
goto store

:buynet
if %net% == 1 (
echo.
echo.
echo You already have a net.
pause >nul
goto store
)
if %money% leq 99 (
echo.
echo.
echo You don't have enough Gold.
pause >nul
goto store
)
set /a money=%money% - 100
set net=1
echo.
echo.
echo Net purchased.
pause >nul
goto store

:buycage
if %cage% == 1 (
echo.
echo.
echo You already have a cage.
pause >nul
goto store
)
if %money% leq 1499 (
echo.
echo.
echo You don't have enough Gold.
pause >nul
goto store
)
set /a money=%money% - 1500
set cage=1
echo.
echo.
echo Cage purchased.
pause >nul
goto store



:fishingloop
for /l %%q in (1,1,6) do set catchingf%%q=true
if %net% equ 0 set catchingf1=0
if %cage% equ 0 set catchingf2=0
if %harpoon% equ 0 set catchingf6=0
if %rod% equ 0 set catchingf5=0
if %flyrod% equ 0 (
set catchingf4=0
set catchingf3=0
)
if %catchingf1%+%catchingf2%+%catchingf3%+%catchingf4%+%catchingf5%+%catchingf6% equ 0+0+0+0+0+0 goto menu
set fishyy1=shrimp
set fishyy2=crab
set fishyy3=trout
set fishyy4=salmon
set fishyy5=flounder
set fishyy6=shark
set fvfv4=0
:loopfishs
set /a fvfv4+=1
call :fishing_display
if "%catchingf1%" equ "true" set /a shrimp=%shrimp%+!shrimprate!
if "%catchingf2%" equ "true" set /a crab=%crab%+!crabrate!
if "%catchingf3%" equ "true" set /a trout=%trout%+!troutrate!
if "%catchingf4%" equ "true" set /a salmon=%salmon%+!salmonrate!
if "%catchingf5%" equ "true" set /a flounder=%flounder%+!flounderrate!
if "%catchingf6%" equ "true" set /a shark=%shark%+!sharkrate!
if %fvfv4% equ 100 (
call :fishing_display
pause >nul
goto menu
)
goto loopfishs

:fishing_display
cls
echo . . . Fishing . . .
echo.
echo Shrimp:%shrimp%
echo Crab:%crab%
echo Trout:%trout%
echo Salmon:%salmon%
echo Flounder:%flounder%
echo Shark:%shark%
goto :eof




:gamble1
cls
call :gamble1display
if %money% equ 0 (
echo You lost all you Gold.
pause >nul
goto menu
)
goto bet1

:bet1
call :gamble1display
echo How much gold do you wager? (enter "leave" to go back)
set /p gamb=">> "
if %gamb% equ leave goto menu
if not %gamb% leq %money% (
echo Invalid...
pause >nul
goto gamble1
)
set r1=%random%
set r2=%r1%
set /a r1= %r1% / 2
set /a r1= %r1% * 2
if %r1%==%r2% (
set /a money=%money%-%gamb%
call :gamble1display
echo.
echo.
echo You lost %gamb% gold.
echo.
pause
goto gamble1
) else (
set /a money=%money%+%gamb%
call :gamble1display
echo.
echo.
echo You won %gamb% gold.
echo.
pause
goto gamble1
)

:gamble1display
cls
echo Gold Left:%money%
goto :eof


:market1
cls
echo Welcome to the Fish Market.
set counter1=1
set pfish1=%pcrab%
set pfish2=%pshrimp%
set pfish3=%ptrout%
set pfish4=%pflounder%
set pfish5=%pshark%
set pfish6=%psalmon%
set r1=%random%
set r2=%r1%
set /a r1= %r1% / 2
set /a r1= %r1% * 2
if %r1%==%r2% (
set changep=nochange
) else (
set changep=change
)
if %changep% equ nochange (
call :market1display
goto buyfish
)
if %changep% equ change (
goto changeps
)
goto menu

:market1display
echo.
echo Gold:%money%
echo.
echo Price of crab:      %pcrab%
echo Price of shrimp:    %pshrimp%
echo Price of trout:     %ptrout%
echo Price of flounder:  %pflounder%
echo Price of shark:     %pshark%
echo Price of salmon:    %psalmon%
echo.
goto :eof

:changeps
set r1=%random%
set r2=%r1%
set /a r1= %r1% / 2
set /a r1= %r1% * 2
if %r1%==%r2% (
set /a pfish%counter1%=!pfish%counter1%!+1
) else (
set /a pfish%counter1%=!pfish%counter1%!-1
)
if !pfish%counter1%! leq 0 (
set /a pfish%counter1%=!pfish%counter1%!+1
)
set /a counter1=%counter1%+1
if not %counter1% geq 7 (
goto changeps
)
set pcrab=%pfish1%
set pshrimp=%pfish2%
set ptrout=%pfish3%
set pflounder=%pfish4%
set pshark=%pfish5%
set psalmon=%pfish6%
call :market1display
goto buyfish

:buyfish
echo 1)Buy Fish
echo 2)Sell Fish
echo 3)Leave
set /p aw1=">> "
if not %aw1% leq 3 goto market1
if %aw1% equ 3 goto menu
if %aw1% equ 2 goto sellfishz
echo What type of fish do you wish to buy? (no plural, example: shark)
set /p fc4=
if %fc4% equ crab goto buyfishz
if %fc4% equ shrimp goto buyfishz
if %fc4% equ trout goto buyfishz
if %fc4% equ flounder goto buyfishz
if %fc4% equ shark goto buyfishz
if %fc4% equ salmon goto buyfishz
goto market1

:buyfishz
echo How many %fc4% do you wish to buy?
set /a maxf=%money%/!p%fc4%!
set /a pprice=%maxf%*!p%fc4%!
echo You can buy up to %maxf% %fc4%. (cost %pprice%)
set /p x1w=">> "
set /a price=!p%fc4%!*%x1w%
if %price% gtr %money% (
echo  You don't have enough gold.
pause >nul
goto market1
)
set /a %fc4%=!%fc4%! + %x1w%
set /a money=%money% - %price%
echo You bought %x1w% %fc4% for %price% gold.
pause >nul
goto market1

:sellfishz
echo What type of fish do you wish to sell?
set /p fc4=
if %fc4% equ crab goto sellfish
if %fc4% equ shrimp goto sellfish
if %fc4% equ trout goto sellfish
if %fc4% equ flounder goto sellfish
if %fc4% equ shark goto sellfish
if %fc4% equ salmon goto sellfish
goto market1

:sellfish
echo How many %fc4% do you wish to sell?
set /a gg2=!%fc4%!*!p%fc4%!
echo You have !%fc4%! %fc4%. (worth %gg2% gold.)
set /p x1w=">> "
if !%fc4%! lss %x1w% (
echo You don't have that much...
pause >nul
goto market1
)
set /a price=!p%fc4%!*%x1w%
set /a money=%price% + %money%
set /a %fc4%=!%fc4%!-%x1w%
echo Sold %x1w% %fc4% for %price%  gold.
pause >nul
goto market1


:savegame1
(
echo set username1=%username1%
echo set password1=%password1%
echo set money=%money%
echo set crab=%crab%
echo set shrimp=%shrimp%
echo set trout=%trout%
echo set flounder=%flounder%
echo set shark=%shark%
echo set salmon=%salmon%
echo set net=%net%
echo set cage=%cage%
echo set harpoon=%harpoon%
echo set rod=%rod%
echo set flyrod=%flyrod%
echo set boat1=%boat1%
echo set boat2=%boat2%
echo set boat3=%boat3%
echo set boat4=%boat4%
echo set boat5=%boat5%
echo set boat6=%boat6%
echo set boat7=%boat7%
echo set boat8=%boat8%
echo set shrimprate=%shrimprate%
echo set crabrate=%crabrate%
echo set troutrate=%troutrate%
echo set flounderrate=%flounderrate%
echo set sharkrate=%sharkrate%
echo set salmonrate=%salmonrate%
echo set axxx=%axxx%
echo set pcrab=%pcrab%
echo set pshrimp=%pshrimp%
echo set ptrout=%ptrout%
echo set pflounder=%pflounder%
echo set pshark=%pshark%
echo set psalmon=%psalmon%
echo set moa=%moa%
echo set gwshark=%gwshark%
echo set squid=%squid%
echo set gsquid=%gsquid%
)>%username1%.bat
echo Game Saved . . .
echo.
pause
goto menu


:checkitems
cls
set networth=0
set f1w=%shrimp%*%pshrimp%
set f2w=%shark%*%pshark%
set f3w=%crab%*%pcrab%
set f4w=%salmon%*%psalmon%
set f5w=%trout%*%ptrout%
set f6w=%flounder%*%pflounder%
set b1w=%boat1%*2000
set b2w=%boat2%*20000
set b3w=%boat3%*60000
set b4w=%boat4%*150000
set b5w=%boat5%*500000
set b6w=%boat6%*1000000
set b7w=%boat7%*3000000
set b8w=%boat8%*15000000
set /a networth=%money%+%f1w%+%f2w%+%f3w%+%f4w%+%f5w%+%f6w%+%b1w%+%b2w%+%b3w%+%b4w%+%b5w%+%b6w%+%b7w%+%b8w%
echo Disclaimer, does not include anything
echo purchased in the rich store.
echo.
echo Gold:%money%
echo.
echo Shrimp:%shrimp%
echo Crab:%crab%
echo Trout:%trout%
echo Salmon:%salmon%
echo Flounder:%flounder%
echo Shark:%shark%
echo.
echo Shrimp'n boat: %boat1%
echo Small boat:    %boat2%
echo Large boat:    %boat3%
echo Rich boat:     %boat4%
echo Pro boat:      %boat5%
echo Dream boat:    %boat6%
echo Elegant boat:  %boat7%
echo Titanic:       %boat8%
echo.
echo Net worth:%networth% Gold.
pause >nul
goto menu


:richstore
if %boat8% equ 0 (
echo.
echo Sorry, but you need atleast 1 titanic to enter . . .
echo.
pause
goto menu
)
cls
echo  ---Rich Store---
echo.
echo Gold:                %money%
echo Squid:               %squid%
echo Giant Squid:         %gsquid%
echo Great White Shark:   %gwshark%
echo Medal of Achievement:%moa%
echo.
echo 1) Price of squid:          50,000,000 Gold or 5,000,000 Salmon.
echo 2) Price of Giant squid:     350,000,000 Gold or 8 squid.
echo 3) Price Of Great White Shark: 900,000,000 Gold
echo                                4 Giant squid
echo.
echo 4) Price of Medal: 5 Great White Sharks
echo.                   10 Giant squid
echo.                   10,000,000 Flounder
echo.                   All your boats...
echo.
set /p rxx=">> "
if not %rxx% geq 1 goto menu
if not %rxx% leq 4 goto menu
if %rxx% equ 1 goto buysq
if %rxx% equ 2 goto buygsq
if %rxx% equ 3 goto buygws
if %rxx% equ 4 goto buymedal
goto menu

:buysq
echo.
echo 1) pay with gold
echo 2) pay with salmon
set /p sqb=">> "
if %sqb% equ 1 goto bbuysq
if %sqb% equ 2 goto bbbuysq
goto richstore

:bbuysq
if %money% lss 50000000 (
echo You don't have enough gold..
pause >nul
goto richstore
)
set /a money=%money%-50000000
set /a squid+=1
goto richstore

:bbbuysq
if %salmon% lss 5000000 (
echo You don't have enough salmon.
pause >nul
goto richstore
)
set /a salmon=%salmon%-5000000
set /a squid+=1
goto richstore

:buygsq
echo.
echo 1) pay with gold
echo 2) pay with squid
set /p sqb=">> "
if %sqb% equ 1 goto bbuygsq
if %sqb% equ 2 goto bbbuygsq
goto richstore

:bbuygsq
if %money% lss 350000000 (
echo You don't have enough gold..
pause >nul
goto richstore
)
set /a money=%money%-350000000
set /a gsquid+=1
goto richstore

:bbbuygsq
if %squid% lss 8 (
echo You don't have enough squid.
pause >nul
goto richstore
)
set /a squid=%squid%-8
set /a gsquid+=1
goto richstore

:buygws
if %money% lss 900000000 (
echo You don't have enough gold..
pause >nul
goto richstore
)
if %gsquid% lss 4 (
echo You don't have enough giant squid..
pause >nul
goto richstore
)
set /a money=%money%-900000000
set /a gsquid=%gsquid%-4
set /a gwshark+=1
goto richstore

:buymedal
if %gwshark% lss 5 (
echo You cannot afford this yet..
pause >nul
goto richstore
)
if %gsquid% lss 10 (
echo You cannot afford this yet..
pause >nul
goto richstore
)
if %flounder% lss 10000000 (
echo You cannot afford this yet..
pause >nul
goto richstore
)
set /a gwshark=%gwshark%-5
set /a gsquid=%gsquid%-10
set /a flounder=%flounder%-10000000
set /a moa+=1
set boat1=0
set boat2=0
set boat3=0
set boat4=0
set boat5=0
set boat6=0
set boat7=0
set boat8=0
goto richstore
