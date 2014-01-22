# todo: test, see select_test.js in ember as a model

App.MultiSelectOption = Ember.View.extend
  tagName: 'div'
  templateName: 'multi-select-option'

  selected: Ember.computed(->
    content = @get('content')
    selection = @get('parentView.selection')
    selection and Ember.EnumerableUtils.indexOf(selection, content.valueOf()) > -1
  # if didn't add isFulfilled, true values were never shown
  ).property('content', 'parentView.selection', 'parentView.selection.isFulfilled')

  labelPathDidChange: (->
    labelPath = @get('parentView.optionLabelPath')
    return if not labelPath

    Ember.defineProperty(@, 'label', Ember.computed(->
      @get(labelPath)
    ).property(labelPath))
  ).on('init').observes 'parentView.optionLabelPath'

  valuePathDidChange: (->
    valuePath = @get('parentView.optionValuePath')
    return if not valuePath

    Ember.defineProperty(@, 'value', Ember.computed(->
      @get(valuePath)
    ).property(valuePath))
  ).on('init').observes 'parentView.optionValuePath'


App.MultiSelect = Ember.View.extend
  tagName: 'div'
  classNames: ['multi-select']
  templateName: 'multi-select'

  content: null
  selection: null

  optionLabelPath: 'content'

  optionView: App.MultiSelectOption

  selectionDidChange: (->
    selection = @get('selection')
    if not Ember.isArray(selection)
      @set('selection', Ember.A([selection]))
      return

    content = @get('content')
    selection = @get('selection')
    selectedIndexes = if content then Ember.EnumerableUtils.indexesOf(content, selection) else [-1]
    $checkboxes = @$('input[type=checkbox]')

    _setCheckboxesInDom = ->
      $checkboxes.each (indx) ->
        @checked = Ember.EnumerableUtils.indexOf(selectedIndexes, indx) > -1

    _setCheckboxesInDom() if $checkboxes
  ).observes 'selection.@each'

  triggerChange: (->
    selection = @get('selection')
    @selectionDidChange() if not Ember.isNone(selection)

    @domDidChange()
  ).on('didInsertElement')

  domDidChange: (->
    $checkboxes = @$('input[type=checkbox]')
    content = @get('content')
    selection = @get('selection')

    return if not content

    _findNewSelection = ->
      selectedIndexes = $checkboxes.map((indx, checkbox) ->
        indx if $(checkbox).is(':checked')
      ).toArray()
      content.objectsAt selectedIndexes

    _updateSelection = ->
      if Ember.isArray selection
        Ember.EnumerableUtils.replace selection, 0, Ember.get(selection, 'length'), newSelection
      else
        @set('selection', newSelection)

    if $checkboxes
      newSelection = _findNewSelection()
      _updateSelection()
  ).on('change')
