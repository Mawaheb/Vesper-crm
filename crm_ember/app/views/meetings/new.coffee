`import Ember from 'ember'`

MeetingsNewView = Ember.View.extend
  isSelected:((object) ->
    meeting = @get('meeting')
    sales_reps = meeting.get('salesReps')
    if sales_reps
      sales_reps.contains(@get('sr'))
  ).property('meeting.salesReps')
`export default MeetingsNewView`