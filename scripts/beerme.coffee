# Description
#   Beer me is the most important thing in your life. Hubot will search http://www.brewerydb.com/ for random beers
#
# Configuration:
#   HUBOT_OPENBEERDATABASE_API_KEY
#
# Commands:
#   hubot beer me - Looks up a random beer in the open beer database
#   hubot beer me <search> - Searches for a beer
#
# Notes:
#   To access the full http://www.brewerydb.com/ api you'll need a api key
#
# Author:
#   leevigraham

apiKey = process.env.HUBOT_OPENBEERDATABASE_API_KEY
url = "http://api.brewerydb.com/v2"

module.exports = (robot) ->
  robot.respond /beer me(.*)?/i, (msg) ->
    query = msg.match[1] || "";
    query = query.trim()
    if(query)
      endpoint = "#{url}/search?key=#{apiKey}&type=beer&q=#{query}&hasLabels=Y&withBreweries=Y"
    else
      endpoint = "#{url}/beer/random?key=#{apiKey}&withBreweries=Y"

    robot.http(endpoint).get() (err, res, body) ->

      console.log endpoint
  
      if err
        msg.send "Im'd drunk :( #{err}"
        return
  
      data = JSON.parse(body).data || false
  
      if(!data)
        return msg.send "No beer found matching: #{query}"
  
      beer = if(query) then msg.random(data) else data
      brewery = msg.random beer.breweries || false
      msgText = "How about:\n#{beer.name}"

      if beer.abv
        msgText += " #{beer.abv}%"  
        
      if beer.style and beer.style.name
        msgText += " (#{beer.style.name})"

      if beer.description
        msgText += "\n\n#{beer.description}\n"
        
      if brewery and brewery.name
        msgText += "\n#{brewery.name}"
        if brewery.website
          msgText += " - #{brewery.website}"

      msg.send msgText
  
      if beer.labels
        msg.send beer.labels.large
  
      return
