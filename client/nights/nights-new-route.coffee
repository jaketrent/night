App.NightsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'night'

  setupController: (controller, model) ->
    @_super controller, model
    @_getAllSongs controller
    @_getAllScriptures controller
    @_getAllActivities controller

  _getAllSongs: (controller) ->
    @store.findAll('song')
      .then (songs) ->
        controller.set 'allSongs', songs

  _getAllScriptures: (controller) ->
    @store.findAll('scripture')
      .then (scriptures) ->
        controller.set 'allScriptures', scriptures

  _getAllActivities: (controller) ->
    @store.findAll('activity')
      .then (activities) ->
        controller.set 'allActivities', activities

