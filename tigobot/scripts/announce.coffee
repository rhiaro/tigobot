# Description:
#   Update the message on the big screen
#
# Commands:
#   hubot announce <text> - Put <text> as a message on the big screen

module.exports = (robot) ->
  robot.respond /ANNOUNCE (.*)$/i, (msg) ->
    data = {
      message: msg.match[1],
      author: msg.message.user.name,
      auth_token: '4dc96858-7dd1-4e64-9d94-8f038382cd7e'
    }
    msg.http('http://ld-dashboard.herokuapp.com/widgets/message').post(JSON.stringify(data))
