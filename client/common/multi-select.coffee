# todo: test, see select_test.js in ember as a model

App.MultiSelectOption = Ember.View.extend
  tagName: 'div'
  templateName: 'multi-select-option'

  init: ->
    @labelPathDidChange()
    @valuePathDidChange()

    @_super()

  # todo: make checked?
  selected: Ember.computed(->
    content = Ember.get(@, 'content')
    selection = Ember.get(@, 'parentView.selection')
    selection and Ember.EnumerableUtils.indexOf(selection, content.valueOf()) > -1
  # if didn't add isFulfilled, true values were never shown
  ).property('content', 'parentView.selection', 'parentView.selection.isFulfilled')

  labelPathDidChange: Ember.observer('parentView.optionLabelPath', ->
    labelPath = Ember.get(this, 'parentView.optionLabelPath') # todo: try other syntax
    return if not labelPath

    Ember.defineProperty(@, 'label', Ember.computed(->
      Ember.get(@, labelPath) # bound to caller or not?
    ).property(labelPath))
  )

  # todo try other syntax
  valuePathDidChange: Ember.observer('parentView.optionValuePath', ->
    valuePath = Ember.get(@, 'parentView.optionValuePath')
    return if not valuePath

    Ember.defineProperty(@, 'value', Ember.computed(->
      Ember.get(@, valuePath)
    ).property(valuePath))
  )


App.MultiSelect = Ember.View.extend
  tagName: 'div'
  classNames: ['multi-select']
  templateName: 'multi-select'

  content: null
  selection: null

  optionLabelPath: 'content'

  optionView: App.MultiSelectOption

  init: ->
    @_super()
    @on('didInsertElement', @, @_triggerChange) # todo, try inline listener
    # todo: change was for select. Now, a list of checkboxes
    @on('change', @, @_change)

  selectionDidChange: Ember.observer('selection.@each', ->
    selection = Ember.get(@, 'selection') # todo other syntax
    if not Ember.isArray(selection)
      Ember.set(@, 'selection', Ember.A([selection]))
      return
    @_selectionDidChangeMultiple()
  )

  # todo: consider consolidating all private "multiple" fns that are needed
  _selectionDidChangeMultiple: ->
    content = Ember.get(@, 'content') # todo other syntax
    selection = Ember.get(@, 'selection')
    selectedIndexes = if content then Ember.EnumerableUtils.indexesOf(content, selection) else [-1]
    options = @$('input[type=checkbox]')

    if options
      options.each ->
        # todo: what is @index for?? and does this function need bound?
        adjusted = if @index > -1 then @index else -1  # todo: better name (this is for if prompt offset)
        @selected = Ember.EnumerableUtils.indexOf(selectedIndexes, adjusted) > -1

  _triggerChange: ->
    selection = Ember.get(@, 'selection') # todo try other syntax
    @selectionDidChange() if not Ember.isNone(selection)

    @_change()

  _change: ->
    # todo: get rid of this proxy fn
    @_changeMultiple()

  _changeMultiple: ->
    options = this.$('input[type=checkbox]:checked')
    content = Ember.get(@, 'content')
    selection = Ember.get(@, 'selection')

    return if not content

    if options
      selectedIndexes = options.map((indx) -> indx).toArray()
      newSelection = content.objectsAt selectedIndexes

      if Ember.isArray selection
        Ember.EnumerableUtils.replace selection, 0, Ember.get(selection, 'length'), newSelection
      else
        Ember.set(@, 'selection', newSelection)
