# Description:
#  Give karma to anything.
#
# Commands:
#  <name>++ - adds karma to a user
#  <name>-- - removes karma from a user
#  karma <name> - shows karma for the named user
#  karma - shows your own karma.

module.exports = (robot) ->

    robot.hear /^@?(.*?)(\+\+|--)\s*$/, (msg) ->
        target = msg.match[1]
        if target is msg.message.user.name
            msg.reply "That's cheating"
        else
            if msg.match[2] is "++"
                val = 1
            else if msg.match[2] is "--"
                val = -1
            
            current = robot.brain.get target + ":karma"
            karma = current + val

            robot.brain.set target + ":karma", karma
            msg.reply target + " has " + karma + " karma."

    robot.hear /^karma(?:\s+@?(.*))?$/i, (msg) ->
        target = msg.match[1] or msg.message.user.name
        msg.reply tellKarma target

    robot.hear /HOW COOL AM I\?$/i, (msg) ->
        msg.reply tellKarma msg.message.user.name

    robot.hear /(HOW COOL IS )(.*?)\?$/i, (msg) ->
        msg.reply tellKarma msg.match[2]

    tellKarma = (target) ->
        karma = robot.brain.get target + ":karma"
        if not target
            karma = robot.brain.get msg.message.user.name + ":karma"
            response = "You have "
        else
            response = target + " has "
    
        if karma is null
            karma = 0
        return response + karma + " karma."