`import Ember from 'ember'`

ContactController = Ember.ObjectController.extend
  
  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'contacts'
        
    edit: ->
      @transitionToRoute('contacts.edit', @get('model'))
`export default ContactController`