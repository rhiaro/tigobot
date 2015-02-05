# Description:
#   'No officer with false teeth should attempt oral sex in zero gravity.'

module.exports = (robot) ->

  dirs = {}
  dirs[5] = "Gross negligence, leading to the endangerment of personnel."
  dirs[112] = "A living crew member always out-ranks a mechanical."
  dirs[142] = "In a hostage demand situation, a hologrammatic personality is entirely expendable."
  dirs[147] = "Crew members are expressly forbidden from leaving their vessel except on permission of a permit. Permits can only be issued by the Chief Navigation Officer, who is expressly forbidden from issuing them except on production of a permit."
  dirs[195] = "In an emergency power situation, a hologrammatic crewmember must lay down his life in order that the living crew-members might survive."
  dirs[312] = "Crew members in quarantine must be provided with minimum leisure facilities (a chess set with 31 missing pieces, a knitting magazine with a pull-out special on crocheted hats, a puzzle magazine with all the crosswords completed and a video of the excellent cinematic treat, Wall-Papering, Painting, And Stippling — A DIY Guide.)"
  dirs[497] = "When a crewmember has run out of credits, food may not be supplied until the balance is restored."
  dirs[595] = "Any crew member who has been in direct contact with diseases must enter quarantine."
  dirs[596] = "Crew files are for the eyes of the Captain only."
  dirs[597] = "One berth per registered crew member."
  dirs[699] = "Crew members may demand a rescreening after five days in quarantine showing no ill effect."
  dirs[1742] = "No member of the Corps should ever report for active duty in a ginger toupee."
  dirs[1743] = "No registered vessel should attempt to traverse an asteroid belt without deflectors."
  dirs[5796] = "No officer above the rank of mess sergeant is permitted to go into combat with pierced nipples."
  dirs[5797] = "No crew member may be allowed aboard if they may, in fact, be a brain-sucking psychotic temporal lobe slurper."
  dirs[34124] = "No officer with false teeth should attempt oral sex in zero gravity."
  dirs[68250] = "...which is known to be impossible without at least one live chicken and a rabbi."
  dirs[196156] = "Any officer caught sniffing the saddle of the exercise bicycle in the women's gym will be discharged without trial."
  dirs[1947945] = "A mechanoid may issue orders to human crew members if the lives of said crew members are directly or indirectly under threat from a hitherto unperceived source and there is inadequate time to explain the precise nature of the enormous and most imminent death threat."
  dirs["39436175880932/B"] = "All nations attending the conference are only allocated one car parking space."
  dirs["39436175880932/C"] = "POWs have a right to non-violent constraint."
  dirs[1947946] = "Space Corps super chimps performing acts of indecency in zero-gravity will lose all banana privileges."
  dirs[3] = "By joining Star Corps each individual tacitly consents to give up his inalienable rights to life, liberty and adequate toilet facilities."
  dirs[349] = "Any officer found to have been slaughtered and replaced by a shape-changing chameleonic life form shall forfeit all pension rights."
  dirs[723] = "Terraformers are expressly forbidden from recreating Swindon."
  dirs[592] = "In an emergency situation involving two or more officers of equal rank, seniority will be given to whichever officer can programme a VCR."
  dirs[997] = "Work done by an officer's doppelgänger in a parallel universe cannot be claimed as overtime."
  dirs[1694] = "During temporal disturbances, no questions shall be raised about any crew member whose timesheet shows him or her clocking off 187 years before he clocked on."
  dirs[7214] = "To preserve morale during long-haul missions, all male officers above the rank of First Technician must, during panto season, be ready to put on a dress and a pair of false breasts."
  dirs[7713] = "the log must be kept up to date at all times with current service records, complete mission data and a comprehensive and accurate list of all crew birthdays so that senior officers may avoid bitter and embarrassing silences when meeting in the corridor with subordinates who have not received a card."
  dirs[43872] = "Suntans will be worn during off-duty hours only."
  dirs[98247] = "No officer should be left behind on an inhabited planet unless he is missing two or more limbs."

  dirnos = [5, 112, 142, 147, 195, 312, 497, 595, 596, 597, 699, 1742, 1743, 5796, 5797, 34124, 68250, 196156, 1947945, "39436175880932/B", "39436175880932/C", 1947946, 3, 349, 723, 592, 997, 1694, 7214, 7713, 43872, 98247]
  

  robot.hear /(SPACE CORPS DIRECTIVE |DIRECTIVE )(.*)/i, (msg) ->

    #msg.reply msg.match[2]

    dirno = msg.match[2]
    
    if dirno of dirs
      rep = "Directive " + dirno + "? " + dirs[dirno] + ".? Really, I don't think that's relevant right now."
    else
      newno = dirnos[Math.floor(Math.random() * dirnos.length)]
      rep = dirno + "? I think you mean Space Corps Directive " + newno + ": " + dirs[newno]
    
    msg.reply rep

