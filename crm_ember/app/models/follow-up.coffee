`import DS from 'ember-data'`

FollowUp = DS.Model.extend
  meeting:  DS.belongsTo('meeting')
  salesRep: DS.belongsTo('sales-rep')

  type:         DS.attr()
  memo:         DS.attr('string')
  done:         DS.attr('boolean')
  status:       DS.attr()
  dueDate:      DS.attr('date')
  completeDate: DS.attr('date')

  types: [
    {text:'None',           value:'none'},
    {text:'Phone call',     value:'phone_call'},
    {text:'Email',          value:'email'},
    {text:'Client visit',   value:'client_visit'},
    {text:'Support',        value:'support'},
    {text:'Documentation',  value:'ocumentation'},
    {text:'Feature',        value:'feature'},
    {text:'Bug Fix',        value:'bug_fix'}
  ]

`export default FollowUp`