App.SongsRoute = Ember.Route.extend
  model: ->
    @store.find 'song'

