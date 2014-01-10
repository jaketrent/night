index = require './index'
api = require './api'
auth = require './auth'

exports.route = (app) ->

  app.post '/token', auth.token
  app.get '/api', api.index

  app.get '*', index.home
