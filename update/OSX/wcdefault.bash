cd /Library/WebServer/CGI-Executables
sed -i '' 's/__DEFAULT__/http:\/\/192.168.2.30:1234\/cgi-bin\/bash.cgi/g' webconnect.cgi
