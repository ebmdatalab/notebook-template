SET mypath=%~dp0

docker build -t datalab-jupyter -f Dockerfile .

SET pid=
for /f "delims=" %%a in ('docker run --detach --rm -ti --mount source=%mypath:~0,-1%,dst=/home/app/notebook,type=bind --publish-all datalab-jupyter') do $set PID=%%a
docker port %pid

if errorlevel 1 (
   echo Press ENTER to close this window
   echo Stop Jupyter using the File -> Shutdown menu option in Jupyterlab
   pause > nul
)
