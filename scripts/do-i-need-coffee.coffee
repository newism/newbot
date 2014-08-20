# Description:
#   Do you need a coffee?
#
# Commands:
#   hubot I need coffee - Suggests a coffee alternative
#   hubot do I need coffee? - Suggests a coffee alternative
#   hubot do I want coffee? - Suggests a coffee alternative
#
# Author:
#   leevigraham


needCoffeePercentage = 33;
needBeerPercentage = 2;

module.exports = (robot) ->
  robot.hear /(do )?I (need|want) (a )?coffee\??/i, (msg) ->
    chanceOfCoffeePercentage = Math.random()*100;
    if (needBeerPercentage > chanceOfCoffeePercentage)
      msg.send "Coffee? Coffee… How about a beer?"
    else if (needCoffeePercentage > chanceOfCoffeePercentage)
      msg.send "Yes, it looks like you need a coffee."
    else
      msg.send "No, I think you'll be ok for now. How about a water instead?"

