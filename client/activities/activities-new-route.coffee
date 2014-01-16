App.ActivitiesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'activity'