`import Ember from 'ember'`

ClientsEditController = Ember.ObjectController.extend
  actions:
    saveChanges: ->
      id = @get('model').get('id')
      @get('model').save().then =>
        @transitionToRoute('/clients/' + id )       

    cancel: ->
      id = @get('model').get('id')
      @get('model').rollback()      
      @transitionToRoute('/clients/' + id )


`export default ClientsEditController`