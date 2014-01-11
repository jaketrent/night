App.SongRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'song', { number: params.number }