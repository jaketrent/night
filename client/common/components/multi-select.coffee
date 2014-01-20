App.MultiSelectComponent = Ember.Component.extend

  toggles: (-> Ember.A []).property()

  actions:
    registerToggle: (toggle) ->
#      toggle.set 'isChecked', @_isSelected toggle
      @get('toggles').addObject toggle

    deregisterToggle: (toggle) ->
      @get('toggles').removeObject toggle

  selectedObserver: (->
    console.log 'selected'
    console.log @get('selected')
  ).observes('selected')

#  setSelected: (->
#    console.log 'settng'
#    console.log @.selected
#    for toggle in @get('toggles')
#      toggle.set 'isChecked', @_isSelected toggle
#  ).observes('selected').on('didInsertElement')

  _isSelected: (toggle) ->
    optToFind = toggle.get('model')

    (_.find @get('selected'), (opt) ->
      console.log "opt.get('id'): #{opt.get('id')}"
      opt.get('id') is optToFind.get('id')
    )?

# based on http://emberjs.jsbin.com/EbOZIBa/1/edit
App.ToggleController = Ember.ObjectController.extend
  isChecked: false
  registerOnParent: (->
    @send 'registerToggle', @
  ).on 'init'
  willDestroy: ->
    @send 'deregisterToggle', @