@echo off
setlocal
TITLE Utilidad de actualizac�n Eswow2� (catalysm)
COLOR 6
SET rev=BETA 1

:inicio
CLS
echo.
echo  888888b  .d8888b. Y8b      d8Y      Y8b      d8Y .d8888b.  �
echo  888     d88P  Y88b Y8b db d8Y        Y8b db d8Y d88P""Y88b
echo  888     Y88b.       Y888888Y .d8888b. Y888888Y         888
echo  888888D  "Y888b      Y8''8Y d88P""Y88b Y8''8Y         d88"
echo  888         "Y88b.          888    888              .d88"
echo  888           "888          888    888            .d888"
echo  888     Y88b..d88P          Y88b..d88P          .d888"
echo  8888888P "Y8888P" CATACLYSM  "Y8888P"  %rev%  d88888888b          
echo.
ECHO   Por favor introduce los datos relativos a tu Mysql DB,
ECHO   �, pulsa intro si los que hay entre [ ] son correctos.
echo.
set /p host=�Cual es el nombre del host MySQL?       [localhost]   : 
if %host%. == . set host=localhost
set /p user=�Cual es el nombre del usuario MySQL?    [root]        : 
if %user%. == . set user=root
set /p pass=�Cual es el password de MySQL?           [ ]           : 
if %pass%. == . set pass=
set /p port=�Cual es el puerto de MySQL?             [3306]        : 
if %port%. == . set port=3306
echo --------------------------------------------------------------------------------
set /p world_db=�Cual es el nombre de la DB World?       [world]       : 
if %world_db%. == . set world_db=world

REM rutas de archivos
SET rutapsdb=.\PSDB\
SET backsql=.\PSDB_back\
SET mysql=.\mysql\
SET volcadopsdb=.\volcado\PSDB\

REM comprobaciones
IF NOT EXIST %mysql%mysql.exe GOTO errordearchivos
IF NOT EXIST %mysql%mysqldump.exe GOTO errordearchivos
IF NOT EXIST "%rutapsdb%" GOTO errordearchivos
GOTO opciones

:opciones
CLS
SET O=""
ECHO.
ECHO        ��������������������������������ͻ
ECHO        �                                �
ECHO        �     Opciones del Instalador    �
ECHO        �                                �
ECHO        ��������������������������������ͼ
ECHO.
ECHO    I - Instalar la revisi�n %rev% para PSDB.
ECHO.
ECHO    G - Guardar tablas afectadas de la DB.
ECHO.
ECHO    R - Reponer copia de tablas a la DB.
ECHO.     
ECHO    C - Cambiar ajustes iniciales.
ECHO.
ECHO    S - Salir de esta Utilidad.
ECHO.
echo    ---------------- A V I S O ------------------
ECHO    Es aconsejable que salves las tablas de tu DB
ECHO    antes de iniciar el proceso de actualizaci�n.
ECHO.
SET /p O= 	Introduce una Letra: 
IF %O%==i GOTO PSDB
IF %O%==I GOTO PSDB
IF %O%==G GOTO volcado
IF %O%==g GOTO volcado
IF %O%==r GOTO rvolcado
IF %O%==R GOTO rvolcado
IF %O%==c GOTO inicio
IF %O%==C GOTO inicio
IF %O%==s GOTO salir
IF %O%==S GOTO salir
IF %O%=="" GOTO opciones
GOTO error

:PSDB
CLS
ECHO.
ECHO  ���������������������������������ͻ
ECHO  �                                 �
ECHO  �        Actualizando PSDB        �
ECHO  �                                 �
ECHO  ���������������������������������ͼ
ECHO.
ECHO  Proceso en marcha ten paciencia...
ECHO.
FOR %%C IN (%rutapsdb%\*.sql) DO (
	ECHO actualizando: %%~nxC
	%mysql%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %world_db% < "%%~fC"
	ECHO %%~nxC se ha actualizado 
	ECHO --------------------------------------------------
)
ECHO.
ECHO El proceso se ha completado, revisa si hay errores.
ECHO.
ECHO Tu DB deber�a estar actualizada a la rev %rev% de LoESc.
ECHO.
ECHO -------------------------- PSDB -------------------------
ECHO.
ECHO.
PAUSE
GOTO opciones

:volcado
CLS
IF NOT EXIST "%volcadopsdb%" MKDIR %volcadopsdb%
ECHO.
ECHO      �������������������������������������ͻ
ECHO      �                                     �
ECHO      �   Guardando tablas afectadas PSDB   �
ECHO      �                                     �
ECHO      �������������������������������������ͼ
ECHO.
ECHO  Se estan salvando tablas de %world_db% ten paciencia...
ECHO.
FOR %%a IN ("%backsql%\*.sql") DO SET /A Count+=1
setlocal enabledelayedexpansion
FOR %%C IN (%backsql%\*.sql) DO (
	SET /A Count2+=1
	ECHO [!Count2!/%Count%] Salvando: %%~nC
	%mysql%\mysqldump --host=%host% --user=%user% --password=%pass% --port=%port% --routines --skip-comments %world_db% %%~nC > %volcadopsdb%\%%~nxC
	ECHO %%~nC se ha guardado.
	ECHO -----------------------------------------------
)
endlocal
ECHO. 
ECHO  Las tablas enunciadas se han guardado en la carpeta %volcadopsdb%
ECHO  Asegurate de que no est�n vac�as antes de iniciar la acutaclizaci�n.
ECHO.
ECHO  --------------- Salvado de tablas de PSDB concluido ----------------
ECHO.
PAUSE
SET /A Count=0
SET /A Count2=0
GOTO opciones

:rvolcado
IF NOT EXIST "%volcadopsdb%" GOTO errorderuta
CLS
ECHO.
ECHO   ��������������������������������������ͻ
ECHO   �                                      �
ECHO   �     Reponer copia de tablas PSDB     �
ECHO   �                                      �
ECHO   ��������������������������������������ͼ
ECHO.
ECHO  Proceso en marcha ten paciencia...........
ECHO.
FOR %%C IN (%backsql%\*.sql) DO (
	ECHO Reponiendo: %%~nxC
	%mysql%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %world_db% < "%%~fC"
	ECHO %%~nxC se ha restituido.
	ECHO -----------------------------------------------
)
ECHO.
ECHO El proceso se ha completado, revisa si hay errores.
ECHO.
ECHO ----- Restituidas las tablas de la DB de PSDB -----
ECHO.
PAUSE
GOTO opciones

:errorderuta
echo    ---------------- E R R O R ------------------
ECHO	La carpeta %volcadopsdb% no existe, se ha borrado,
ECHO  o a�n no se ha realizado ning�n respaldo de tablas.
ECHO.
PAUSE
GOTO opciones

:errordearchivos
CLS
echo.
echo --------------------------------------ERROR-------------------------------------
echo No se encuentran los archivos necesarios, por favor comprueba no haber borrado
echo    accident�lmente alg�n archivo, si fuese necesario descompr�melo de nuevo.
echo.
pause
goto :eof

:error
ECHO	Por favor introduce la opci�n correcta.
ECHO.
PAUSE
GOTO opciones

:salir
ECHO.
ECHO	 Staff de Eswow2�:
ECHO ===================================================
ECHO	 Durotar
ECHO	    Nomad
ECHO	        Trargos
ECHO	            Vink
ECHO	                Mrbytes
ECHO	                    Gravitaferro
EcHO.
ECHO	 Miembros retirados del Staff, veteranos de guerra.
ECHO - - - - - - - - - - - - - - - - - - - - - - - - - -
ECHO	    Eragon
ECHO.
ECHO.
ECHO	 Y nuestro agradecimiento al precursor.
ECHO	                                         CrazyEs
ECHO.
ECHO	      --- Gracias por confiar en Eswow2� ---
ECHO.
PAUSE
REM � � � � �
