`import Ember from 'ember'`

SalesRepRoute = Ember.Route.extend
  model: (params) -> @store.find('sales-rep', params.sales_rep_id)

`export default SalesRepRoute`