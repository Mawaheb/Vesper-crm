`import Ember from 'ember'`
SalesRepsNewController = Ember.ObjectController.extend
  actions:
    save: ->
      newSalesRep = @store.createRecord('sales-rep', @get('model'))
      newSalesRep.save()
      @transitionToRoute('sales-rep', newSalesRep)

`export default SalesRepsNewController`