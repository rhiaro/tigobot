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
        "Schweep schweep schwiggle."
    ]

    action = [
       "is a bird.", "has a bath.", "puts his face on something", "brutally murders a raspberry.", "wants a cuddle", "comes in for a face-scratch", "is a bird you know.", "jangles his bell, ding ding ding squawk!", "hides in his box", "destroys something", "rubs his face with a biscuit.", "eats something as big as his head.", "is like a tiny tiny dinosaur."
    ]

    bwark = (msg) ->
        probability = Math.random()
        if probability > 0.96
          p2 = Math.random()
          if p2 > 0.5
            msg.send msg.random noise
          else
            msg.emote msg.random action

    robot.hear /(.*)$/, (msg) ->
        setTimeout -> bwark msg, 2000
        

    robot.hear /(WHOSA)?BIRD/i, (msg) ->
      p2 = Math.random()
      if p2 > 0.5
        msg.send msg.random noise
      else
        msg.emote msg.random action
