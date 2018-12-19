@echo off
setlocal ENABLEDELAYEDEXPANSION

for /l %%i in (0,1,9) do (set /a arr[%%i]=%%i)
set /a flg=0

:SetAns
set /a flg=%flg%+1
set /a n=%random%*10/32767
set /a m=%random%*10/32767
call set /a l=%%arr[%n%]%%
call set /a arr[%n%]=%%arr[%m%]%%
set /a arr[%m%]=l
if %arr[0]% == 0 (goto SetAns)
if %flg% leq 99 (goto SetAns)
set ans=%arr[0]%%arr[1]%%arr[2]%%arr[3]%

set /a cnt=0
:Game
set /a cnt=%cnt%+1
set /p input="Enter answer [%cnt%]: "
if %input% == 0000 ( exit )
if %input% == %ans% ( goto End )
set /a eat=0
set /a byte=0
for /l %%c in (0,1,3) do (
	set n=!input:~%%c,1!
	set m=!arr[%%c]!
	if !n! == !m! (
		set /a eat=!eat!+1
	) else (
		for /l %%d in (0,1,3) do (
			set m=!arr[%%d]!
			if !n! == !m! ( set /a byte=!byte!+1 )
		)
	)
)

echo %eat% EAT - %byte% BYTE
goto Game

:End
echo Game Clear
echo Result: cnt=!cnt!
pause
