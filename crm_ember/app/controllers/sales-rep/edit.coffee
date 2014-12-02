`import Ember from 'ember'`
SalesRepEditController = Ember.ObjectController.extend
  actions:
    saveChanges: ->
      @get('model').save().then =>
        @transitionToRoute 'sales-rep'

    cancel: ->
      @get('model').rollback()
      @transitionToRoute 'sales-rep'

`export default SalesRepEditController`