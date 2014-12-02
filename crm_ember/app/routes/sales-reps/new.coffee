`import Ember from 'ember'`
SalesRepsNewRoute = Ember.Route.extend

  model: ->
    Em.Object.create()

  renderTemplate: ->
    @render('sales-rep/edit',
      controller: 'sales-rep/new'
    )
`export default SalesRepsNewRoute`