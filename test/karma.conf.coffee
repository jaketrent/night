path = require 'path'

module.exports = (config) ->
  isTest = process.env.NODE_ENV is 'test'
  bowerPath = path.join 'server', 'static', 'js', 'components'

  console.log "bowerPath: #{bowerPath}"

  config.set
    basePath: './..'

    frameworks: [ 'mocha' ]

    files: [
      # vendor
      path.join bowerPath, 'jquery/jquery.js'
      path.join bowerPath, 'handlebars/handlebars.js'
      path.join bowerPath, 'ember/ember.js'
      path.join bowerPath, 'ember-data/ember-data.js'
      path.join bowerPath, 'underscore/underscore.js'

      # source
      'server/static/js/app.coffee'
      'server/static/js/**/*.coffee'

      # test helpers
      'node_modules/chai/chai.js'
      'node_modules/sinon/pkg/sinon.js'
      'node_modules/sinon-chai/lib/sinon-chai.js'

      # tests
      'test/browser/**/*.spec.coffee'
    ]

    exclude: []

    preprocessors:
      '**/*.coffee': ['coffee']

    reporters: if isTest then ['spec'] else ['progress']

    port: 8080

    runnerPort: 9100

    colors: true

    captureTimeout: 5000

    autoWatch: not isTest

    singleRun: isTest

    browsers: if isTest then ['PhantomJS'] else ['Chrome']
