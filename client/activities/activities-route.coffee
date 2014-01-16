App.ActivitiesRoute = Ember.Route.extend
  model: ->
    @store.findAll 'activity'
