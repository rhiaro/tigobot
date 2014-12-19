# Description:
#   Who says butt most?
#
# Commands:
#   butt - adds to your butt count
#   ?butt [user] - finds out your (or the user you specify) butt count
#   who is the buttmaster? - who says butt the most

module.exports = (robot) ->
  getButts = (person) ->
    if robot.brain.userForName(person)
      if not robot.brain.userForName(person).butt
        setButts person, 0
      return robot.brain.userForName(person).butt

  setButts = (person, butts) ->
    if robot.brain.userForName(person)
      return robot.brain.userForName(person).butt = butts

  robot.hear /butt/i, (msg) ->
    person = msg.message.user.name
    butt = getButts person
    setButts person, butt + 1

  robot.hear /\?butt ?(.*)$/i, (msg) ->
    if msg.match[1]
      person = msg.match[1]
    else
      person = msg.message.user.name
    butts = getButts person
    if butts == null
      setButts person, 0
      butts = 0
    msg.reply person + " has " + butts + " butts"

  robot.hear /^Who is the buttmaster\?$/i, (msg) ->
    buttmaster = {name: "Buttmaster", butt: 0}
    findButtmaster = (user) ->
      if user.butt > buttmaster.butt
        buttmaster.butt = getButts user.name
        buttmaster.name = user.name
    findButtmaster user for id, user of robot.brain.users()
    msg.reply "The buttmaster is " + buttmaster.name + " with " + buttmaster.butt + " butts"
