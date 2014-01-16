# This is actually the exact same as the generated route; not needed; for reference
App.SongRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'song', params.id