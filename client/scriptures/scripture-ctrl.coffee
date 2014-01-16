App.ScriptureController = Ember.ObjectController.extend
  actions:
    add: ->
      @get('model').save()
    destroy: ->
      scripture = @get('model')
      scripture.deleteRecord()
      scripture.save()
        .then =>
          @transitionToRoute 'scriptures'