App.SongsRoute = Ember.Route.extend
  model: ->
    @store.findAll 'song'

