module.exports = (robot) ->
	robot.respond /shorten\s?(me)?\s?(.+)$/i, (msg) ->
		data = { url: msg.match[2] }
		strdata = JSON.stringify(data)
		msg.http("http://butts.so/api/v1/create")
			.headers('Content-Type': 'application/json')
			.post(strdata) (err, res, body) ->
				returned = JSON.parse(body)
				msg.send "Here you go! http://butts.so/" + returned.shortcode
