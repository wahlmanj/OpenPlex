cd /Library/WebServer/CGI-Executables
sed -i '' 's/__OPENPLEX__/http:\/\/192.168.2.30:1234\/cgi-bin\/openplex.cgi/g' webconnect.cgi
