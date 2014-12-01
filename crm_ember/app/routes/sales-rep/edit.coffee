`import Ember from 'ember'`
SalesRepEditRoute = Ember.Route.extend
  model: -> @modelFor('sales-rep')
  
`export default SalesRepEditRoute`