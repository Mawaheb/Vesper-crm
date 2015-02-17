`import Ember from 'ember'`
`import FollowUpComponent from '../components/follow-up'`
FollowUpsContainerView = Ember.ContainerView.extend
  childViews: ['firstFollowUp']
  firstFollowUp: FollowUpComponent.create()
  
`export default FollowUpsContainerView`