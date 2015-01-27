`import Ember from 'ember'`

MeetingsRoute = Ember.Route.extend
  model: -> @store.find('meeting')

`export default MeetingsRoute`