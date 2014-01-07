App.NightCardComponent = Ember.Component.extend
  classNames: ['card']
  classNameBindings: ['isFacedown', 'isOnTable']
  actions:
    flip: ->
      @toggleProperty 'isFacedown'

  didInsertElement: ->
    @set 'isFacedown', true
    @set 'isOnTable', true