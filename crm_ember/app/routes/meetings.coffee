`import Ember from 'ember'`

MeetingsRoute = Ember.Route.extend
  model: -> @store.find('meeting')

  actions:

    delete: (meeting) ->
      meeting = meeting
      if confirm('are you sure you want to delete this meeting?')
        meeting.destroyRecord().then =>
          meeting.save()
`export default MeetingsRoute`