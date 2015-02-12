`import Ember from 'ember'`

MeetingsNewView = Ember.View.extend
  isSelected:((object) ->
    meeting = @get('meeting')
    sales_reps = meeting.get('salesReps')
    console.log(sales_reps)
    console.log(@get('sr'))
    if sales_reps
      sales_reps.contains(@get('sr'))
  ).property('meeting.salesReps')
`export default MeetingsNewView`