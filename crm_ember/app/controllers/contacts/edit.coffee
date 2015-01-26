`import Ember from 'ember'`

ContactsEditController = Ember.ObjectController.extend
  
  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute('contacts')

    cancel: ->
      @get('model').rollback()
      @transitionToRoute('contact', @get('model'))


`export default ContactsEditController`