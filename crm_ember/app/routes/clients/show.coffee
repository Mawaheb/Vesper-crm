`import Ember from 'ember'`

ClientsShowRoute = Ember.Route.extend
  model: (params) -> @store.find 'client', params.id
  
`export default ClientsShowRoute`