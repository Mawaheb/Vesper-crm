`import Ember from 'ember'`
SalesRepEditController = Ember.ObjectController.extend
  actions:
    setSex: (sex)->
      @get('model').set('sex', sex)

    saveChanges: ->
      @get('model').save().then =>
        @transitionToRoute 'sales-rep'

    cancel: ->
      @get('model').rollback()
      @transitionToRoute 'sales-rep'

`export default SalesRepEditController`