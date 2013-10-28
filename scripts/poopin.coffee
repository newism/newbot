# Description:
#   Sends a poopin synonym

poppin = [
  "Clearing the cache",
  "The act of taking a number two.",
  "Clearing the backlog",
  "Farting up a storm",
  "Flush Permissions"
]

module.exports = (robot) ->
  robot.hear /poopin/i, (msg) ->
    msg.send msg.random poppin

