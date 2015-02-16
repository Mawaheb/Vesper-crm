`import Ember from 'ember'`
FollowUpComponent = Ember.Component.extend
  templateName: 'components/follow-up'
  actions:
    test:->
      alert('component test action triggered')
      # @remove()
      @create().append()

`export default FollowUpComponent`