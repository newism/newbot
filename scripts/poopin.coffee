# Description:
#   Sends a poopin synonym

poopin = [
  "Clearing the cache",
  "The act of taking a number two.",
  "Clearing the backlog",
  "Farting up a storm",
  "Flush Permissions",
  "Playing Angry Birds… ummm what?",
  "Saxmans grabbing his shoes"
]

module.exports = (robot) ->
  robot.hear /poopin/i, (msg) ->
    msg.send msg.random poopin

