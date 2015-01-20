`import Ember from 'ember'`

ClientsEditController = Ember.ObjectController.extend
  actions:
    id: null
    saveChanges: ->
      id = @get('model').get('id')
      @get('model').save().then =>
        @transitionToRoute('/clients/' + id )       

    cancel: ->
      @get('model').rollback()      
      @transitionToRoute('/clients/' + id )


`export default ClientsEditController`