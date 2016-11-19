@echo off
set "AAA=!"
setlocal enabledelayedexpansion
set tmppath=D:\paper\--[ ENW ]--\tmp\
set paperpath=D:\paper\
set enwpath=D:\paper\--[ ENW ]--\
set importedpath=D:\paper\--[ ENW ]--\imported\
set prcpath=D:
mkdir "%tmppath%" 
cd "%paperpath%"
echo File miss >"%enwpath%miss.txt"
for  /R %%i in (*.pdf) do (
	REM set dd=%%~dpi
	REM if !dd! NEQ !prcpath!	(
		REM echo !dd!
		REM set prcpath=!dd!
	REM )
	REM echo     %%~nxi
	set name=%%~nxi
	set var=!name:.pdf=.enw!
	cd "%enwpath%"
	
	if not exist "%importedpath%!var!" ( 
		if exist "%enwpath%!var!" (
			
			copy "!var!" "%tmppath%!var!">>log.txt
			
			set str=%%Z ???
			@echo %%Z ??? >> "%tmppath%!var!"
			@echo %%!AAA! ??? >> "%tmppath%!var!"
			@echo %%^> %%i >> "%tmppath%!var!"
			@echo. >>"%tmppath%!var!"
			move "%enwpath%!var!" "%importedpath%!var!">>log.txt
			
		)   else (
			set dd=%%~dpi
			if !dd! NEQ !prcpath!	(
				@echo. >>%enwpath%miss.txt 
				@echo ------------------------------- >>%enwpath%miss.txt
				@echo !dd! >>%enwpath%miss.txt
				@echo. >>%enwpath%miss.txt 
				set prcpath=!dd!
			)
			@echo %%~nxi >>%enwpath%miss.txt
		)
	
	)  else (
	echo NO....
	)
)

cd %tmppath%
copy *.enw do.enw 
do.enw
del *.enw
rd %tmppath%
del %enwpath%log.txt
pause