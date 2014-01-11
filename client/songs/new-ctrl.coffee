App.SongsNewController = Ember.ObjectController.extend
  actions:
    add: ->
      @get('model').save()
        .then =>
          @transitionTo 'song', @get('model')