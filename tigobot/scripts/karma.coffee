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

    robot.respond /karma(?:\s+@?(.*))?/i, (msg) ->
        target = msg.match[1] or msg.message.user.name
        msg.reply tellKarma target

    robot.respond /HOW COOL AM I\?$/i, (msg) ->
        target = msg.message.user.name
        karma = robot.brain.get target + ":karma"
        msg.reply karmaMessage karma

    robot.respond /(HOW COOL IS )(.*?)\?$/i, (msg) ->
        target = msg.match[2]
        karma = robot.brain.get target + ":karma"
        msg.reply karmaMessage karma

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

    karmaMessage = (karma) ->
        if karma > 1000
            return "OUT. THERE."
        else if karma > 100
            return "Cool as a cucumber."
        else if karma > 50
            return "Rad, yo."
        else if karma > 10
            return "Pretty cool."
        else if karma > 1
            return "Well, somebody cares."
        else if karma > -2
            return "A bit lame."
        else if karma > -10
            return "Proper shit."
        else if karma > -50
            return "Largely hated."
        else
            return "Literally the worst."
