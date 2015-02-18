`import Ember from 'ember'`
`import FollowUpComponent from '../components/follow-up'`
FollowUpsContainerView = Ember.ContainerView.extend
  # childViews: ['firstFollowUp']
  # firstFollowUp: FollowUpComponent.create()
  childViews: [Ember.View.create()]
  
`export default FollowUpsContainerView`