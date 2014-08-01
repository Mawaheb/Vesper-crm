`import Ember from 'ember'`
ClientsShowController = Ember.ObjectController.extend
  
  actions:
    saveChanges: -> 
      @get('model').save() if @get('model.isDirty')

    delete: ->

      if window.confirm("Are you sure you want to delete this client?")
        if @get('model').get('contacts.length') > 0
          unless window.confirm("This Clinet has some Contacts, Are you sure you want to delete?")
            return false        
        @get('model').destroyRecord().then =>
          @transitionToRoute 'clients'

`export default ClientsShowController`
