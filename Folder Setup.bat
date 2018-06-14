@echo off
setlocal enabledelayedexpansion
for %%f in (config\*.xml) do call :folderfile %%f
goto done
:folderfile
find /i "name=""saves""" %1
if %errorlevel%==1 goto notfound
echo found
goto :eof
:notfound
SET origfile=%1
SET tempfile=temporary_file.xml
SET insertbefore=3
SET "folder=  <Folder name="Saves" icon="folder" position="3" />"
FOR /F %%C IN ('FIND /C /V "" ^<%origfile%') DO SET totallines=%%C
<%origfile% (FOR /L %%i IN (1,1,%totallines%) DO (
  SETLOCAL EnableDelayedExpansion
  SET /P L=
  IF %%i==%insertbefore% ECHO !folder!
  ECHO(!L!
  ENDLOCAL
)
) >%tempfile%
COPY /Y %tempfile% %origfile% >NUL
DEL %tempfile%
goto :eof
:done