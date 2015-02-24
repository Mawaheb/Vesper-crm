`import Ember from 'ember'`

MeetingsNewRoute = Ember.Route.extend
  model: -> 
    model = @store.createRecord 'meeting'
    model

  setupController: (controller, model) ->
    controller.set 'model',     model
    controller.set 'clients',   @store.find('client')
    controller.set 'sReps',     @store.find('sales-rep')

  actions:

    willTransition: (transition) ->
      meeting = @get('controller.model')
      if (meeting.get('isDirty') &&
          !confirm('Are you sure you want to abandon this?'))
        transition.abort()
      else
        meeting.deleteRecord()

  
`export default MeetingsNewRoute`