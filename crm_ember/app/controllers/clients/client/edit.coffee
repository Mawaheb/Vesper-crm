`import Ember from 'ember'`

ClientEditController = Ember.ObjectController.extend
  actions:
    saveChanges: ->
      @get('model').save().then =>
        @transitionToRoute 'clients.client'
      
        

    cancel: ->
      @get('model').rollback()
      @transitionToRoute 'clients.client'


`export default ClientEditController`