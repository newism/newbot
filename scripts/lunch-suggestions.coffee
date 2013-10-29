# Description:
#   Sends a lunch suggestion

lunchSuggestions = [
  "Sad food court",
  "Sad food court",
  "Harrys Pies",
  "Harrys Schnitzels",
  "Sushi",
  "Sushi",
  "Subway",
  "Subway",
  "Subway",
  "Kebabs",
  "Kebabs",
  "Bread shop sandwhich",
  "Bread shop sandwhich",
  "Mall Thai (Thursdays, Fridays)",
  "Mall Thai (Thursdays, Fridays)",
  "Salad from place next to kebab place",
  "Salad from place next to kebab place",
  "Salad from place next to kebab place",
  "Salad from place next to kebab place",
  "Salad from place next to kebab place"
]

module.exports = (robot) ->
  robot.hear /What\'?s for lunch\?/i, (msg) ->
    msg.send msg.random lunchSuggestions

