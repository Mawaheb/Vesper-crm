`import Ember from 'ember'`

MeetingsNewView = Ember.View.extend
  isSelected:((object) ->
    meeting = @get('meeting')
    obj     = @get('obj')
    relationName = @get('relationName')
    children     = meeting.get(relationName)
    if children
      children.contains(@get('obj'))
  ).property('meeting.salesReps')
`export default MeetingsNewView`