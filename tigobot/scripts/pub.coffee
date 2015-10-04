# Description:
#   Pub!

module.exports = (robot) ->
  robot.hear /^p+u+b+\??$/i, (msg) ->
    msg.reply "http://tardis.pub"

