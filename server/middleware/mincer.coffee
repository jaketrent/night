Mincer = require 'mincer'
emblemEngine = require 'mincer-emblem-engine'
nib = require 'nib'

Mincer.StylusEngine.configure (style) ->
  style.use nib()

environment = new Mincer.Environment()
emblemEngine.register environment
environment.appendPath "#{__dirname}/../../client"

Mincer.logger.use
  log: (level, msg) ->
    console.log "MINCER: #{level}: #{msg}"

exports.server = Mincer.createServer environment
