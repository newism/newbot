# tableflip
#
# Description: Hubot feels your rage
#
# Commands:
#
# Author:
# jl23889
# https://github.com/paulsfds/hubot/blob/master/scripts/tableflip.coffee

mood = "happy"

module.exports = (robot) ->
    robot.hear /(fuck|shit|damn|damm|suck|cunce|cunt)/i, (msg) ->
        mood = "mad"
        msg.send "(╯°□°)╯︵ ┻━┻"
    robot.respond /sorry/i, (msg) ->
        if mood == "mad"
            msg.send('┬──┬ ノ( ゜-゜ノ)')
            mood = "happy"
