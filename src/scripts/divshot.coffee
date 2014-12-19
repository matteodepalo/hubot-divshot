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
divshot = require('divshot-api')
api = divshot.createClient(token: process.env.DIVSHOT_AUTH_TOKEN)
organizationName = process.env.ORGANIZATION_NAME

module.exports = (robot) ->
  robot.respond /divshot promote (.*)/i, (msg) ->
    appName = msg.match[1]

    msg.reply "Promoting #{appName} from staging to production"

    api.apps.list().then (apps) ->
      appNames = apps["org:#{organizationName}"].map (app) -> app.name

      if appNames.indexOf(appName) >= 0
        api.apps.id(appName).releases.env('production').promote 'staging', (err, callback) ->
          if err?
            msg.reply err
          else
            msg.reply "Promoted #{appName} to production"
      else
        msg.reply "I don't know anything about #{appName}"
