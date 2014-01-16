App.SongsNewController = Ember.ObjectController.extend
  actions:
    add: ->
      @get('model').save()
        .then =>
          @transitionToRoute 'song', @get('model')