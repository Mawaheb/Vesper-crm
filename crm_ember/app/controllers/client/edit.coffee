`import Ember from 'ember'`

ClientEditController = Ember.ObjectController.extend
  actions:
    saveChanges: ->
      @get('model').save().then =>
        @transitionToRoute 'client'
      
        

    cancel: ->
      @get('model').rollback()
      @transitionToRoute 'client'


`export default ClientEditController`