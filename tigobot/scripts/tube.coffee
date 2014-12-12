# Description:
#   Shows the status of tube lines
#
# Dependencies:
#   "xml2js": "0.1.14"
#
# Configuration:
#   None
#
# Commands:
#   hubot tube me - Show the status of tube lines

xml2js = require "xml2js"

module.exports = (robot) ->

  robot.respond /tube me/i, (msg) ->
    term = msg.match[1]
    msg.http("http://cloud.tfl.gov.uk/TrackerNet/LineStatus")
      .get() (err, res, body) ->
        parser = new xml2js.Parser()
        lines = {}
        parser.parseString body.replace("\ufeff", ""), (err, result) ->
          for linestatus in result["LineStatus"]
            line = linestatus["Line"]["@"]["Name"]
            status = {
              short: linestatus["Status"]["@"]["Description"],
              detail: linestatus["@"]["StatusDetails"]
            }
            if status.short != "Good Service"
              lines[line] = status
        if Object.keys(lines).length == 0
          msg.send "There is a good service on all lines."
        else
          for line, status of lines
            msg.send line + ": " + status.detail
