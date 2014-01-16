App.ScripturesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'scripture'