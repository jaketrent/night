App.SongRoute = Ember.Route.extend
  model: (params) ->
    _.find App.Song.FIXTURES, (song) ->
      song.number is parseInt(params.number, 10)
#    @store.findQuery 'song', { number: parseInt(params.number, 10) }