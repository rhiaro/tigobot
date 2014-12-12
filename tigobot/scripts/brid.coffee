# Description:
#  brid

random_text = (choices) ->
  choices[Math.floor(Math.random() * choices.length)]

module.exports = (robot) ->

    probability = Math.random()
    noise = [
        "BIRDBIRDBIRDBIRDBIRDBIRDBIRD",
        "BIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRD",
        "BIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRDBIRD",
        "BIRDBIRDBIRD",
        "BIRD",
        "schwah."
        "squik",
        "quak",
        "squak",
        "BWARK",
        "IAMABIRDYOUKNOW",
        "/me is a bird.",
        "/me has a bath",
        "/me brutally murders a raspberry."
        "/me puts his face on something."
    ]

    robot.hear /(.*)$/, (msg) ->
        if probability > 0.9
            msg.send random_text(noise)

    robot.respond /WHOSABIRD/i, (msg) ->
        msg.send random_text(noise)