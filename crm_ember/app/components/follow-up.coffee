`import Ember from 'ember'`
FollowUpComponent = Ember.Component.extend
  templateName: 'components/follow-up'
  actions:
    deleteFollowUp:->
      if confirm("Are you sure you want to delete this FollowUp?")
        @get('followUp').destroyRecord()
        @remove()
      

`export default FollowUpComponent`