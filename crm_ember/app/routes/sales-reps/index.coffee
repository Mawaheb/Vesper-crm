`import Ember from 'ember'`

SalesRepsRoute = Ember.Route.extend
  model: ->
    @store.find('sales-rep')

`export default SalesRepsRoute`