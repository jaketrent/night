App.SongRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'song', params.id