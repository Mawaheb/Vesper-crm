`import Ember from 'ember'`

ContactsNewController = Ember.ObjectController.extend
  
  actions:
    createContact: ->
      # console.log("This contact's Client is :" + @get('model').get('client'))
      contact = @get('model')
      contact.save().then =>
        @transitionToRoute('client')
    cancel: ->
      @transitionToRoute 'contacts'
`export default ContactsNewController`