App.NightController = Ember.ObjectController.extend
  actions:
    destroy: ->
      night = @get 'model'
      night.deleteRecord()
      night.save()
        .then =>
          @transitionToRoute 'nights'
    save: ->
      @get('model').save()
