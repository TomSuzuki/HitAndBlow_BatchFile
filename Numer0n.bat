@echo off

set /a i=0
set /a flg=0
set /a p=0

:SetAns
set /a var[%i%]=(%random%*10/32767)
rem call echo %%var[%flg%]%%
call set /a n=%%var[%i%]%%
if %i% == 0 (
	if not %n% == 0 ( set /a i=1+%i% )
) else (
	echo ------------
	set /a flg=1
	set /a p=-1+%i%
	echo i=%i%
	echo p=%p%
	for /l %%j in (0,1,%p%) do (
		set /a j2=%%j
		call set /a m=%%var[%j2%]%%]
		call echo var[%j2%]=%%var[%j2%]%%
		if %n% == %m% ( set /a flg=0 )
	)
	echo flg=%flg%
	if %flg% == 1 ( set /a i=1+%i% )
)

if not %i% == 4 ( GOTO SetAns )

call set ans=%%var[0]%%%%var[1]%%%%var[2]%%%%var[3]%%
echo %ans%

rem pause
