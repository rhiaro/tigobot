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

    bwark = (msg) ->
        probability = Math.random()
        if probability > 0.96
            msg.send msg.random noise

    robot.hear /(.*)$/, (msg) ->
        setTimeout -> bwark msg, 2000
        

    robot.respond /WHOSABIRD/i, (msg) ->
        msg.send msg.random noise