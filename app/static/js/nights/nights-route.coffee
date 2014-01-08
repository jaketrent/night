App.NightsRoute = Ember.Route.extend
  model: ->
    @store.findAll 'night'

  actions:
    highlightNight: (night) ->
      console.log 'route action'
      console.log night
      @controllerFor('night-detail').set 'model', night
      @render 'night-detail',
        into: 'nights'
        outlet: 'night-detail'

    dehighlightNight: ->
      @disconnectOutlet
        outlet: 'night-detail'
        parentView: 'nights'

