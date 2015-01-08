cd /Library/WebServer/CGI-Executables
sed -i '' 's/__LIST__/http:\/\/192.168.2.30:1234\/cgi-bin\/list.cgi/g' webconnect.cgi
