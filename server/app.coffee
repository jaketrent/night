express = require 'express'
expressJwt = require 'express-jwt'
path = require 'path'

routes = require './controllers/routes'

app = express()

app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'jade'

  app.use express.favicon()
  app.use express.methodOverride()
  app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.json()
  app.use express.urlencoded()

  # TODO: put secret in a config file using an ENV var
  app.use '/api', expressJwt { secret: 'kittens' }
  app.use (err, req, res, next) ->
    if err.constructor.name is 'UnauthorizedError'
      res.send 401, 'Unauthorized'

  app.use '/static', require('./middleware/mincer').server
  app.use app.router

  app.use express.errorHandler()

routes.route app

app.listen app.get('port'), ->
  console.log "Express server listening on port #{app.get('port')}"
