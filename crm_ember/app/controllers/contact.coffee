`import Ember from 'ember'`

ContactController = Ember.ObjectController.extend
  
  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'contacts'

`export default ContactController`