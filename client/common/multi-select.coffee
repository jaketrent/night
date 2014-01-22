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
    labelPath = Ember.get(this, 'parentView.optionLabelPath') # todo: try other syntax
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
    options = @$('input[type=checkbox]')

    if options
      options.each ->
        # todo: what is @index for?? and does this function need bound?
        adjusted = if @index > -1 then @index else -1  # todo: better name (this is for if prompt offset)
        @selected = Ember.EnumerableUtils.indexOf(selectedIndexes, adjusted) > -1
  ).observes 'selection.@each'

  _triggerChange: (->
    selection = @get('selection')
    @selectionDidChange() if not Ember.isNone(selection)

    @_change()
  ).on('didInsertElement')

  _change: (->
    options = this.$('input[type=checkbox]:checked')
    content = @get('content')
    selection = @get('selection')

    return if not content

    if options
      selectedIndexes = options.map((indx) -> indx).toArray()
      newSelection = content.objectsAt selectedIndexes

      if Ember.isArray selection
        Ember.EnumerableUtils.replace selection, 0, Ember.get(selection, 'length'), newSelection
      else
        @set('selection', newSelection)
  ).on('change')
