`import Ember from 'ember'`
CheckBoxComponent = Ember.Component.extend
  attributeBindings: ['type', 'value', 'checked'],
  tagName: 'input',
  type: 'checkbox',
  checked: false,

  _updateElement:(->
    @set( 'checked', @$().prop('checked') )
  ).on('didInsertElement')

  change:(event) ->
    @_updateElement()
    # @sendAction('action', @get('value'), @get('checked'), @get('id'))
    @sendAction('action', @get('value'), @get('checked'))
`export default CheckBoxComponent`