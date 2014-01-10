App.SongsNewController = Ember.ObjectController.extend
  actions:
    add: ->
      song = @store.createRecord 'song',
        number: @get 'number'
        title: @get 'title'

      song.save()
        .then =>
          @set 'number', ''
          @set 'title', ''