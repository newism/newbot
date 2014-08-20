# Description
#   Scrape http://google.com/movies for showtimes
#
# Configuration:
#   HUBOT_MOVIES_DEFAULT_LOCATION
#
# Commands:
#   hubot movie me - Lists cinemas and showtimes for all movies near your default location
#   hubot movie me <search> - Lists cinemas and showtimes for a movie near yout default location
#   hubot movie me <search> near <location> - Lists cinemas and showtimes for a movie near a location
#
# Author:
#   leevigraham

$ = require('cheerio');
url = "http://google.com/movies"
defaultLocation = process.env.HUBOT_MOVIES_DEFAULT_LOCATION || "Newcastle, Australia"


module.exports = (robot) ->
    robot.respond /movie me(.*)/i, (msg) ->

        parts = msg.match[1].split("near")
        query = parts[0]
        location = parts[1] || defaultLocation

        moviesData = {
            movies: []
        }

        responseData = []

        robot.http(url).query({
            q: query.trim(),
            near: location.trim(),
            sort: 1
        }).get() (error, response, html) ->

            if error
                msg.reply "We couldn't load the url: #{err}"
                return

            movies = $('.movie', html).each ->
                movie = $(this)
                movieName = $('.header h2', movie)
                movieUrl = $('.header h2 a', movie)
                movieTrailer = $('.header .info.links a.fl', movie)
                movieData = {
                    name: movieName.text()
                    url: movieUrl.attr('href') || false,
                    trailer: movieTrailer.attr('href') || false,
                    theaters: []
                }

                responseData.push(movieData.name);
                responseData.push(Array(movieData.name.length + 1).join("="))

                theaters = $('.theater', movie).each ->
                    theater = $(this)
                    theaterName = $("> div .name a", theater)
                    theaterAddress = $("> div .address", theater)
                    theaterData = {
                        name: theaterName.text(),
                        address: theaterAddress.text()
                        showTimes: []
                    }

                    theaterShowTimes = $("> .times > span", theater).each ->
                        theaterShowTime = $(this)
                        theaterData.showTimes.push(theaterShowTime.text().trim())
                        theaterData

                    # responseData.push(theaterData.name + " - " + theaterData.address);
                    # responseData.push(theaterData.showTimes.join(", "));
                    # responseData.push("");

                    responseData.push(theaterData.name + " - " + theaterData.showTimes.join(", "));

                    movieData.theaters.push(theaterData);
                    movieData

                responseData.push("");
                moviesData.movies.push(movieData)

            msg.send responseData.join("\n");
