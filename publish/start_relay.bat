@echo off
REM Set environment variables temporarily
set OB_URL="https://10.1.3.130/app/org.openbravo.mobile.core.service.jsonrest/org.openbravo.retail.posterminal.ExternalOrderLoader?user=microsexport&password=openbravo&synchronizedProcessing=true"
set DATABASE_URL="mysql://datauser:Mr\$0200097a@localhost:3306/checkpostingdb"
set HOST=0.0.0.0
set PORT=3002

REM Run your executable
shayona-kiosk-relay.exe