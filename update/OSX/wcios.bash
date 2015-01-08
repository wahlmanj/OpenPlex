cd /Library/WebServer/CGI-Executables
sed -i '' 's/__IOS__/http:\/\/192.168.2.30:1234\/cgi-bin\/ios.cgi/g' webconnect.cgi
