# Description:
#   Team status

module.exports = (robot) ->
  robot.router.get '/team-status', (req, res) ->
    res.send robot.brain.get('teamstatus')

  robot.respond /STATUS SET (.*)$/i, (msg) ->
    status = msg.match[1]
    statuses = robot.brain.get('teamstatus') || {}
    statuses[msg.message.user.name] = status
    robot.brain.set 'teamstatus', statuses
    msg.reply 'Thanks!'
