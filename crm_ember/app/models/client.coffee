`import DS from 'ember-data'`

client = DS.Model.extend
  contacts: DS.hasMany('contact'),
  name: DS.attr('string')

`export default client`