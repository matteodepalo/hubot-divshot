hubot-divshot
=============

## Installation
1. `npm install hubot-divshot --save`
2. Add `hubot-divshot` to `external-scripts.json` (e.g. `["hubot-divshot", "some-other-plugin"]`)
3. Before deployment, set `DIVSHOT_AUTH_TOKEN` to a Divshot account's API key. This user must have access to the apps you want to use this script on.

## Usage

`hubot divshot promote appname` will promote appname from staging to production

## Debugging

### Get Node Inspector working
```bash
npm install -g node-inspector
node-inspector --no-preload --web-port 8123
```

### Get hubot to run with debugging on
```bash
coffee --nodejs --debug node_modules/.bin/hubot
```

Visit `http://127.0.0.1:8123/debug?port=5858` and use `debugger` statements to pause execution.
