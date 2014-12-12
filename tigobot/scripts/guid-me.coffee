# Description:
#   Returns a GUID
#
# Commands:
#   hubot guid me - Returns a GUID

uuid = require 'node-uuid'

module.exports = (robot) ->
  robot.respond /guid me/i, (msg) ->
    guid = uuid.v4()
    msg.send guid
