App.ScripturesNewController = Ember.ObjectController.extend
  actions:
    add: ->
      @get('model').save()
        .then =>
          @transitionToRoute 'scripture', @get('model')