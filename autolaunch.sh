#!/bin/bash
COUNTER=1
while(true) do
./megareborn.sh
curl "https://api.telegram.org/bot279192153:AAE6V2Stk0lEZPdV1kK5NmQMzPQcDHnLc1s/sendmessage" -F "chat_id=308444837" -F "text=#NEWCRASH-#TeleBeyond-Reloaded-${COUNTER}-times"
let COUNTER=COUNTER+1 
done
