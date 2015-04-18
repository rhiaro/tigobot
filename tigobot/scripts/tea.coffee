# Description:
#   Record tea preferences
#
# Commands:
#   I like my tea <description> - Records your tea preference
#   ?tea <user> - Announces your tea preference

module.exports = (robot) ->
  robot.respond /I LIKE MY TEA (.*)$/i, (msg) ->
    person = msg.message.user.name
    preference = msg.match[1]
    robot.brain.set person + ':tea', preference
    msg.reply "Thanks, I've noted that down."

  robot.respond /\?TEA (.*)$/i, (msg) ->
    person = msg.match[1]
    preference = robot.brain.get person + ':tea'
    if preference
      msg.reply person + ' likes their tea ' + preference + '.'
    else
      msg.reply person + ' hasn\'t expressed a tea preference.'
