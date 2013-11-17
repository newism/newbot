# Description
#   Beer me is the most important thing in your life. Hubot will search http://www.brewerydb.com/ for random beers
#
# Configuration:
#   HUBOT_UNTAPPED_CLIENT_ID
#   HUBOT_UNTAPPED_CLIENT_SECRET
#
# Commands:
#   hubot untapped me <search> - Searches for a beer
#
# Notes:
#   Api Docs: https://untappd.com/api/docs/v4
#
# Author:
#   leevigraham

clientId = process.env.HUBOT_UNTAPPED_CLIENT_ID
clientSecret = process.env.HUBOT_UNTAPPED_CLIENT_SECRET

url = "http://api.untappd.com/v4"

module.exports = (robot) ->
  robot.respond /(untapped|ut)( me)? (.*)/i, (msg) ->
    query = msg.match[3]

    if !query
      msg.reply "Can I have a clue what you want to drink? Try 'beer me ale or beer me australia'"
      return

    endpoint = "#{url}/search/beer?client_id=#{clientId}&client_secret=#{clientSecret}&q=#{query}"

    robot.http(endpoint).get() (err, res, body) ->

      console.log endpoint
  
      if err
        msg.reply "Im'd drunk :( #{err}"
        return

      response = JSON.parse(body).response || false
      beers = response.beers

      if beers.count == 0
        return msg.reply "No beer found matching: #{query}"
  
      item = msg.random beers.items
      beer = item.beer
      brewery = item.brewery
      
      msgText = "How about:\n#{beer.beer_name}"

      if beer.beer_abv
        msgText += " #{beer.beer_abv}%"  
        
      if beer.beer_style
        msgText += " (#{beer.beer_style})"

      if beer.beer_description
        msgText += "\n\n#{beer.beer_description}\n"
        
      if brewery
        msgText += "\n#{brewery.brewery_name}"
        if brewery.contact && brewery.contact.url
          msgText += " - #{brewery.contact.url}"

      msg.reply msgText

      if beer.beer_label && beer.beer_label != "https://untappd.s3.amazonaws.com/site/assets/images/temp/badge-beer-default.png"
        msg.send beer.beer_label
  
      return
