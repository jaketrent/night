App.SongController = Ember.ObjectController.extend
  actions:
    destroy: ->
      song = @get('model')
      song.deleteRecord()
      song.save()
        .then =>
          @transitionToRoute 'songs'
    add: ->
      @get('model').save()
        .then =>
          @transitionToRoute 'song', @get('model')