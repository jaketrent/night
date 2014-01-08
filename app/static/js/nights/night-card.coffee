App.NightCardComponent = Ember.Component.extend
  classNames: ['card']
  classNameBindings: ['isFacedown', 'isOnTable']

  highlightAction: 'highlightNight'

  actions:
    flip: ->
      @toggleProperty 'isFacedown'

    detailsClick: ->
      console.log 'action for compo'
      console.log @get 'night'
      @sendAction 'highlightAction', @get 'night'

  didInsertElement: ->
    @set 'isFacedown', true
    @set 'isOnTable', true