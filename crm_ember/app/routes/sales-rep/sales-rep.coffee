`import Ember from 'ember'`

SalesRepRoute = Ember.Route.extend
  model: (params) -> @store.find('sales-rep', params.salesrep_id)

`export default SalesRepRoute`