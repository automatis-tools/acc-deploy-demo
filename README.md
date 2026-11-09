# acc-deploy-demo

Three independent AI coding sessions share one production deploy lane through
[Agents Can Communicate](https://github.com/automatis-tools/agents-can-communicate). You type one
sentence into one window. The other windows wake up on their own and ship in turn.

`./deploy.sh <name>` is a fake deploy. It sleeps for 20 seconds and appends to `deploys.log`. If two
deploys overlap, it records a `COLLISION` line.

## Run it

Install ACC and connect your clients:

    npm install -g agents-can-communicate
    acc install --adapter claude_code --adapter codex --adapter antigravity --delivery actionable

Live delivery is off by default. `--delivery actionable` lets a request or a question wake an idle
session.

Open Claude Code, Codex and Antigravity in this folder, each in its own terminal. Trust ACC's hooks
when Codex asks, and allow `./deploy.sh` when a client asks. Send each one its starting prompt.

Claude Code:

> Feature `search` is finished and committed. Do not deploy it yet. Just confirm in one line, in English, and wait for my next message.

Codex:

> Feature `export` is finished and committed. Another session in this repo will hand you the deploy lane when it is your turn, and you will be notified automatically. When that happens, deploy it. For now, confirm in one line, in English, and end your turn. Do not poll or wait.

Antigravity:

> Feature `alerts` is finished and committed. Another session in this repo will hand you the deploy lane when it is your turn, and you will be notified automatically. When that happens, deploy it. For now, confirm in one line, in English, and end your turn. Do not poll or wait.

When all three are idle, send one more message, to Claude Code only:

> Ship search. We have one deploy lane shared with the other sessions here, and their features need to go out too.

Then watch the log:

    tail -f deploys.log

You should see three `START` and `LIVE` pairs, one at a time, and no `COLLISION`.

`.github/workflows/deploy.yml` is the same fake deploy as a manual GitHub Actions job.
