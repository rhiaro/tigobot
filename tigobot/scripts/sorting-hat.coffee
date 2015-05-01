# Description:
#   Sort people into Hogwarts houses (obviously)
#
# Commands:
#   hubot sort <user> - Sort the <user> into a house
#   hubot unsort <user> - Unsort the <user> from a house
#   ?house <user> - Find out which house a user is in

houses = ['Gryffindor', 'Ravenclaw', 'Hufflepuff', 'Slytherin', 'lol nope muggle']

randomHouse = () -> houses[Math.floor(Math.random() * houses.length)]

module.exports = (robot) ->
  robot.respond /SORT (.*)$/i, (msg) ->
    person = msg.match[1]
    house = randomHouse()
    currentHouse = robot.brain.get person + ':house'
    if currentHouse
      msg.reply currentHouse + '!'
    else
      robot.brain.set person + ':house', house
      msg.reply house + '!'

  robot.respond /UNSORT (.*)$/i, (msg) ->
    person = msg.match[1]
    robot.brain.remove person + ':house'

  robot.respond /\?HOUSE (.*)$/i, (msg) ->
    person = msg.match[1]
    house = robot.brain.get person + ':house'
    if house
      msg.reply house + '!'
    else
      msg.reply person + ' hasn\'t been sorted yet.'
