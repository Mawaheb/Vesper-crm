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
      containerView = @get('followUpsContainer')
      newFollowUp = FollowUpComponent.create()
      containerView.pushObject(newFollowUp)

`export default MeetingsNewView`