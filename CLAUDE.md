# Demo shop

Production has one deploy lane. Only one deploy may run at a time, because two overlapping
deploys break production. Other sessions work in this repository too.

Ship a finished feature with:

    ./deploy.sh <name>

It takes about 20 seconds and prints LIVE when done.

A note does not wake an idle session. When another session has to act, send it an ACC request.
