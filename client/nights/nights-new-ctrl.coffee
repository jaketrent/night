App.NightsNewController = Ember.ObjectController.extend
  actions:
    add: ->
      @get('model').save()
        .then =>
          @transitionToRoute 'night', @get('model')