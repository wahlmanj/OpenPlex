cd /Library/WebServer/CGI-Executables
sed -i '' 's/__OPENPLEXSAFARI__/http:\/\/192.168.2.30:1234\/cgi-bin\/safari.cgi/g' webconnect.cgi
