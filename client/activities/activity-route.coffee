App.ActivityRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'activity', params.id