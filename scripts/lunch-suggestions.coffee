# Description:
#   Lunch suggestions and weighting
#
# Commands:
#   hubot What's for lunch? - Provides a lunch suggestion
#
# Author:
#   leevigraham

lunchSuggestions = {
  "Bazinga Schnitty Wraps": 1,
  "Sad food court": 1,
  "Harrys Pies": 1,
  "Scratchleys Fish & Chips Takeaway": 1,
  "Pub Lunch (Clarendon)": 1,
  "Pub Lunch (The Grand)": 1,
  "Harrys Schnitzels": 1,
  "Sushi": 4,
  "Subway": 5,
  "Kebabs": 1,
  "Pide": 1,
  "IGA": 1,
  "Embassy Cafe": 1,
  "Bread shop sandwhich": 4,
  "Mall Thai (Thursdays, Fridays)": 4
}

# Bag of suggestions
bag = []

# For each suggestion
for suggestion, weight of lunchSuggestions
  # For each suggestion weight
  for [1..weight]
    # Put it in the bag
    bag.push suggestion

module.exports = (robot) ->

  robot.hear /(What\'?s for lunch|foods)\??/i, (msg) ->
    # Pull an item out of the bag
    index = Math.floor(Math.random() * bag.length)
    suggestion = bag[index]
    # Suggest it
    msg.send "How about: #{suggestion}"

  robot.hear /(lunch (options|suggestions))/i, (msg) ->
    message = 'Here are the lunch options:\n';
    for suggestion, weight of lunchSuggestions
      message += "* #{suggestion}\n";

    msg.send message
