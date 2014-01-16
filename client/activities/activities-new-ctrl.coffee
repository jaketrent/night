App.ActivitiesNewController = Ember.ObjectController.extend
  actions:
    add: ->
      @get('model').save()
        .then =>
          @transitionToRoute 'activity', @get('model')
