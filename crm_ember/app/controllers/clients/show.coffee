`import Ember from 'ember'`
ClientsShowController = Ember.ObjectController.extend
  
  actions:
    saveChanges: -> 
      @get('model').save() if @get('model.isDirty')

`export default ClientsShowController`
