# Description:
#   Falafel? Falafel.

module.exports = (robot) ->

  positive_replies = [
    'Yes.',
    'Well duh!',
    'Definitely.',
    'AYE.',
    'Always.',
    'Without a doubt.',
    'Of course.',
    'Foreverfalafel.',
    'You NEED falafel.',
    'Let\'s face it, you won\'t make it through the day without falafel.',
    'More like falaf-lol, am I right?',
    'EXTRA SPICY POTATOES',
    'Pro tip: ask for extra hummus.'
  ]

  negative_replies = [
    'Best not.',
    'Not for you.',
    'Why doesn\'t everyone else go without you, and you can meet them in the park?',
    'Seriously?'
  ]

  too_late_replies = [
    'At this hour? It\'s a bit late.',
    'Alright - but it\'s late, so don\'t come crying to me if there\'s a massive queue.',
    'You\'d better run, it\'s past 12:30!',
    'Hmm. Late falafel!',
    'The early bird catches the falafel.',
    'Let\'s just hope someone from Media Centre hasn\'t ordered about 100 falafels. Nightmare.',
    'Hope you\'ve got an hour to kill, everyone else in Shepherd\'s Bush is on their way by now.'
  ]

  d = new Date
  day = d.getDay()
  hour = d.getHours()
  minute = d.getMinutes()

  robot.hear /FALAFEL/i, (msg) ->

    is_sam = msg.message.user.name == "samstarling"
    is_bbq_day = day == 5
    is_too_late = hour > 13 || (hour == 12 && minute >= 30)

    if is_sam
      msg.reply negative_replies[Math.floor(Math.random() * negative_replies.length)]
    #else if is_too_late
    #  msg.reply too_late_replies[Math.floor(Math.random() * too_late_replies.length)]
    #else if is_bbq_day
    #  msg.reply "If only it was summer, it might be BBQ day. Go on then."
    else
      msg.reply positive_replies[Math.floor(Math.random() * positive_replies.length)]
