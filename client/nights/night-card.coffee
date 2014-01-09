App.NightCardComponent = Ember.Component.extend
  classNames: ['card']
  classNameBindings: ['isFacedown', 'isOnTable', 'isHighlighted']

  actions:
    flip: ->
      if @get 'isHighlighted'
        @set 'isOnTable', true
        @set 'isHighlighted', false
        @set 'isFacedown', true
      else
        @toggleProperty 'isFacedown'

    highlight: ->
      @set 'isOnTable', false
      @set 'isHighlighted', true

  didInsertElement: ->
    @set 'isFacedown', true
    @set 'isOnTable', true