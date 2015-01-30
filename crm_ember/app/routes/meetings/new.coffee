`import Ember from 'ember'`

MeetingsNewRoute = Ember.Route.extend
  model: -> @store.createRecord 'meeting'

  setupController: (controller, model) ->
    controller.set 'model',     model
    controller.set 'clients',   @store.find('client')
    controller.set 'sReps',     @store.find('sales-rep')

  
`export default MeetingsNewRoute`