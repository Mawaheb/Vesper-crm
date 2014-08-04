`import Ember from 'ember'`

ClientsNewRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set 'fields', {}
    
`export default ClientsNewRoute`