`import DS from 'ember-data'`

SalesRep = DS.Model.extend
  name: DS.attr('string')

  FIXTURES: [
    {id: 1, name: "Steeve Jobs"},
    {id: 2, name: "Stefan Penar"}
  ]
`export default SalesRep`