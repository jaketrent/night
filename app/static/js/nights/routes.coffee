App.NightsRoute = Ember.Route.extend
  model: ->
    @store.findAll 'night'
