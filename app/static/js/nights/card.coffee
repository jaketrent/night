App.NightCardComponent = Ember.Component.extend
  actions:
    toggleFacedown: ->
      @toggleProperty 'isFacedown'

  didInsertElement: ->
    @set 'isFacedown', true