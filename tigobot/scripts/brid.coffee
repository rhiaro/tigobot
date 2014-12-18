# Description:
#  brid

module.exports = (robot) ->

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
        probability = Math.random()
        if probability > 0.9
            msg.send msg.random noise

    robot.respond /WHOSABIRD/i, (msg) ->
        msg.send random_text(noise)