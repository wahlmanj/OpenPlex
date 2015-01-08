cd /Library/WebServer/CGI-Executables
sed -i '' 's/__PLEXWEB__/http:\/\/192.168.2.30:32400\/web\/index.html#!\/dashboard/g' bash.cgi
