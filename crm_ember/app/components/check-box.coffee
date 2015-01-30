`import Ember from 'ember'`
CheckBoxComponent = Ember.Component.extend
  attributeBindings: ['type', 'value'],
  tagName: 'input',
  type: 'checkbox',
  checked: false,

  _updateElement: ->
    @set('checked', @.$().prop('checked')).on('didInsertElement')

  change:(event) ->
    @._updateElement()
    @sendAction('action', @get('value'), @get('checked'), @get('id'))
`export default CheckBoxComponent`