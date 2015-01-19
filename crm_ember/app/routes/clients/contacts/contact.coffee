`import Ember from 'ember'`
ContactRoute = Ember.Roue.extend
  model: (params) -> @store.find 'contact', params.contact_id
  
`export default ContactRoute`