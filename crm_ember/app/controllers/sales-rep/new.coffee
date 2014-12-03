`import Ember from 'ember'`
SalesRepsNewController = Ember.ObjectController.extend
  content: {}
  actions:
    saveChanges: ->
      newSalesRep = @store.createRecord('sales-rep', @get('model'))
      newSalesRep.save().then =>
        @transitionToRoute('sales-rep', newSalesRep)

`export default SalesRepsNewController`