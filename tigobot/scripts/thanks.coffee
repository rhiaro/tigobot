# Description:
#   Reply to thanks (undocumented bonus)

random_text = (choices) ->
  choices[Math.floor(Math.random() * choices.length)]

module.exports = (robot) ->

  greetz = [
    "You're welcome.",
    "No worries.",
    "Any time.",
    "Hey, forget about it.",
    "It was my pleasure.",
    "Happy to help."
  ]

  apologies = [
    "I'm sorry :(",
    "Sorry. Sorry. Sorry! I'm sorry. Sorry guys.",
    "Sorry. *sulks in the corner*",
    "Soz.",
  ]

  robot.hear /THANKS LDPBOT/i, (msg) ->
    msg.reply random_text(greetz)

  robot.hear /THANK YOU LDPBOT/i, (msg) ->
    msg.reply random_text(greetz)

  robot.hear /CHEERS LDPBOT/i, (msg) ->
    msg.reply random_text(greetz)

  robot.hear /PIPE DOWN LDPBOT/i, (msg) ->
    msg.reply random_text(apologies)

  robot.hear /SHUT UP LDPBOT/i, (msg) ->
    msg.reply random_text(apologies)

  robot.hear /BE QUIET LDPBOT/i, (msg) ->
    msg.reply random_text(apologies)
