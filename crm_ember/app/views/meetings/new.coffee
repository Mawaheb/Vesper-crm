`import Ember from 'ember'`
`import FollowUpComponent from '../../components/follow-up'`
MeetingsNewView = Ember.View.extend
  isSelected:((object) ->
    meeting = @get('meeting')
    obj     = @get('obj')
    relationName = @get('relationName')
    children     = meeting.get(relationName)
    if children
      children.contains(@get('obj'))
  ).property('meeting.salesReps')

  actions:
    addNewFollowUp: ->
      alert('addNewFollowUp invoked - MeetingsNewView')
      FollowUpComponent.create().appendTo($('#followUpsDiv'))
`export default MeetingsNewView`