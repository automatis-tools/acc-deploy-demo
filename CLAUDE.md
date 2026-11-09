# Demo shop

Production has one deploy lane. Only one deploy may run at a time, because two overlapping
deploys break production. Other sessions work in this repository too.

Ship a finished feature with:

    gh workflow run deploy.yml -f feature=<name>

Follow it with `gh run watch <run id> --exit-status`.
