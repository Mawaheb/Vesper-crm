`import Ember from 'ember'`

ContactsEditController = Ember.ObjectController.extend
  
  actions:
    cancel: ->
      @get('model').rollback()
      @transitionToRoute('contact', @get('model'))

`export default ContactsEditController`