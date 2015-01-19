`import Ember from 'ember'`

ContactsNewRoute = Ember.Route.extend
  
  model: -> 
    parentClient = @modelFor('client')
    contact      = @store.createRecord('contact')
    contact.set('client', parentClient)
    return contact


`export default ContactsNewRoute`