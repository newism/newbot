# Description:
#   Posts an animated gif of eastbound and down https://i.imgur.com/2pqWmsF.gif

module.exports = (robot) ->

  robot.hear /(yeeha)\?/i, (msg) ->
    msg.send "https://i.imgur.com/2pqWmsF.gif"
