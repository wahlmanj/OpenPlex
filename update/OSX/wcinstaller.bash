cd /Library/WebServer/CGI-Executables
sed -i '' 's/__INSTALLER__/http:\/\/192.168.2.30:1234\/cgi-bin\/installer.cgi/g' webconnect.cgi
