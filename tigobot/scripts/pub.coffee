# Description:
#   Pub!

module.exports = (robot) ->
  robot.hear /^pub\??$/i, (msg) ->
    msg.reply "http://tardis.pub"

