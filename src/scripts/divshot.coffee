# Description:
#   Exposes Divshot commands to hubot
#
# Dependencies:
#   "divshot-api": "^0.8.1"
#
# Configuration:
#   DIVSHOT_AUTH_TOKEN
#
# Commands:
#   hubot divshot promote <app> - Promotes the app from staging to production
#
# Notes:
#   Very alpha
#
# Author:
#   matteodepalo

require('dotenv').load()
Divshot = require("divshot-api")
api = Divshot.createClient(token: process.env.DIVSHOT_AUTH_TOKEN)

module.exports = (robot) ->
  robot.respond /divshot promote (.*)/i, (msg) ->
    appName = msg.match[1]

    msg.reply "Promoting #{appName} from staging to production"

    api.apps.id(appName).get().then (app) ->
      app.releases.env("production").promote "staging", (err, callback) ->
        msg.reply "Promoted #{appName} to production"
