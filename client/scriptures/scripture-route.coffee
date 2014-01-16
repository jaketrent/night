App.ScriptureRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'scripture', params.id