# Description:
#   Posts an animated gif of eastbound and down https://i.imgur.com/2pqWmsF.gif
#
# Commands:
#   hubot yeeehaaaaa
#   hubot awwwwwwwyeah
#
# Author:
#   leevigraham

module.exports = (robot) ->

  robot.hear /(ye+ha+|aw+yeah)/i, (msg) ->
    msg.send "https://i.imgur.com/2pqWmsF.gif"
