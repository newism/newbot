# Description:
#   Posts an animated gif of eastbound and down https://i.imgur.com/2pqWmsF.gif

module.exports = (robot) ->

  robot.hear /(ye+ha+)/i, (msg) ->
    msg.send "https://i.imgur.com/2pqWmsF.gif"
