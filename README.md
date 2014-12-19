hubot-divshot
=============

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
