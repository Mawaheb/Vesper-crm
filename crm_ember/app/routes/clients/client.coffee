`import Ember from 'ember'`

ClientsClientRoute = Ember.Route.extend
  model: (params) -> @store.find 'client', params.id
  
`export default ClientsClientRoute`