express = require 'express'
express-namespace = require 'express-namespace'

exports.port = 3234
exports.name = "Stats test"
exports.createServer = ->
  app = express.createServer()
  app.use express.bodyParser()
  app.use "/public", express.static(__dirname + '/public')

  app.get '/health', (req, res) -> res.send 200


  app.get '/stats/interactions', (req, res) ->
    interactions = [
      {
        count: 45
        title: "Memes"
      },
      {
        count: 100
        title: "Comments"
      },
      {
        count: 73
        title: "Search"
      },
      {
        count: 40
        title: "Emotes"
      },
      {
        count: 58
        title: "Doodles"
      }
    ]
    res.json interactions

  app

app = exports.createServer()
app.listen exports.port
console.log """
Running PublicAPI on #{exports.port}
#{exports.name}
"""