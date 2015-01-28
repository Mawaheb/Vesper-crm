`import Ember from 'ember'`

MeetingsNewRoute = Ember.Route.extend
  model: -> @store.createRecord 'meeting'
  
`export default MeetingsNewRoute`