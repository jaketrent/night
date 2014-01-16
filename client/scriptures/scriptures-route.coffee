App.ScripturesRoute = Ember.Route.extend
  model: ->
    @store.findAll 'scripture'