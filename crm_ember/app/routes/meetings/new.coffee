`import Ember from 'ember'`

MeetingsNewRoute = Ember.Route.extend
  model: -> 
    model = @store.createRecord 'meeting'
    model

  setupController: (controller, model) ->
    controller.set 'model',     model
    controller.set 'clients',   @store.find('client')
    controller.set 'sReps',     @store.find('sales-rep')

  
`export default MeetingsNewRoute`