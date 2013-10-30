# Description:
#   Chances of Coffee

needCoffeePercentage = 33;
needBeerPercentage = 2;

module.exports = (robot) ->
  robot.hear /I (need|want) (a )?coffee/i, (msg) ->
    chanceOfCoffeePercentage = Math.random()*100;
    if (needBeerPercentage > chanceOfCoffeePercentage)
      msg.send "Coffee? Coffee… How about a beer? (beer)"
    else if (needCoffeePercentage > chanceOfCoffeePercentage)
      msg.send "Yes, it looks like you need a coffee. (coffee)"
    else
      msg.send "No, I think you'll be ok for now. How about a water instead?"

