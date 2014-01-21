App.NightRoute = Ember.Route.extend

  model: (params) ->
    @store.find 'night', params.id