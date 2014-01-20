App.NightRoute = Ember.Route.extend

  model: (params) ->
    @store.find 'night', params.id

  afterModel: (model) ->
    allPromises =
      allSongs: @store.findAll 'song'
      allScriptures: @store.findAll 'scripture'
      allActivities: @store.findAll 'activity'
    Ember.RSVP.hash(allPromises).then (hash) =>
      model.setProperties hash

