`import Ember from 'ember'`

ClientRoute = Ember.Route.extend
  model: (params) -> @store.find 'client', params.client_id
  
`export default ClientRoute`