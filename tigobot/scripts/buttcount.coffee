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

  addButts = (person, butts) ->
    if butts >= 0
      setButts person, (butts + getButts(person))

  getButtmaster = () ->
    buttmaster = {name: "Buttmaster", butt: 0}
    findButtmaster = (user) ->
      if user.butt > buttmaster.butt
        buttmaster.butt = getButts user.name
        buttmaster.name = user.name
    findButtmaster user for id, user of robot.brain.users()
    return buttmaster

  robot.hear /butt/i, (msg) ->
    person = msg.message.user.name
    addButts person, 1

  robot.hear /\?butt ?(.*)$/i, (msg) ->
    if msg.match[1]
      person = msg.match[1].trim()
    else
      person = msg.message.user.name
    butts = getButts person
    if butts == null
      setButts person, 0
      butts = 0
    msg.reply person + " has " + butts + " butts"

  robot.hear /^Who is the buttmaster\?$/i, (msg) ->
    buttmaster = getButtmaster()
    msg.reply "The buttmaster is " + buttmaster.name + " with " + buttmaster.butt + " butts"

  robot.hear /^Give (.*) (\d*(e\+\d*)?) butts$/i, (msg) ->
    buttmaster = getButtmaster()
    if msg.message.user.name == buttmaster.name
      person = msg.match[1].trim()
      award = Number msg.match[2].trim()
      if person == buttmaster.name
        return msg.reply "You can't award yourself butts"
      if award < 1
        return msg.reply "You can't steal butts"
      if award <= buttmaster.butt
        addButts person, award
        setButts buttmaster.name, (buttmaster.butt - award)
      else
        return msg.reply "You haven't got " + award + " butts"
      msg.reply "I have awarded " + person + " " + award + " butts"
    else
      msg.reply "Only the buttmaster, " + buttmaster.name + " can award butts"
