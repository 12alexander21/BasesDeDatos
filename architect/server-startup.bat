
rem SQL Power Architect Enterprise Edition Server Startup Script
rem Usage: sh server-startup.sh

echo "Starting SQL Power Architect Enterprise Edition Server"
echo "Using JRE Version:"
java -version

java -Xmx1000m -XX:MaxPermSize=128M -jar server-startup.jar