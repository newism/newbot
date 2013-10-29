# Description:
#   Sends a lunch suggestion

# Lunch suggestions and weighting
lunchSuggestions = {
  "Sad food court": 1,
  "Harrys Pies": 1,
  "Pub Lunch": 1,
  "Harrys Schnitzels": 1,
  "Sushi": 2,
  "Subway": 3,
  "Kebabs": 1,
  "Pide": 1,
  "Bread shop sandwhich": 3,
  "Mall Thai (Thursdays, Fridays)": 2,
  "Salad from place next to kebab place": 2
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
  robot.hear /What\'?s for lunch\?/i, (msg) ->
    # Pull an item out of the bag
    index = Math.floor(Math.random() * bag.length)
    suggestion = bag[index]
    # Suggest it
    msg.send "How about: #{suggestion}"

