`import Ember from 'ember'`
ClientNewController = Ember.ObjectController.extend
  content: {}
  actions:
    createClient: ->
      client = @store.createRecord 'client', @get('fields')
      client.save().then =>
        @transitionToRoute 'clients.client', client

    cancel: ->
      @transitionToRoute 'clients.index'
      
`export default ClientNewController`