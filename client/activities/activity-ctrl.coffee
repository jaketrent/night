App.ActivityController = Ember.ObjectController.extend
  actions:
    update: ->
      @get('model').save()

    destroy: ->
      activity = @get 'model'
      activity.deleteRecord()
      activity.save()
        .then =>
          @transitionToRoute 'activities'