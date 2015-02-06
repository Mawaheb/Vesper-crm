`import Ember from 'ember'`
MeetingRoute = Ember.Route.extend
  model: (params) -> @store.find('meeting', params.meeting_id)

  setupController: (controller, model) ->
    controller = @controllerFor('meetings.new').set('content',model)
    controller.set 'clients',   @store.find('client')
    controller.set 'sReps',     @store.find('sales-rep')

  renderTemplate: ->
    @render('meetings.new')
`export default MeetingRoute`