`import Ember from 'ember'`

Router = Ember.Router.extend 
  location: CrmEmberENV.locationType


Router.map () ->
  @route 'about'

  @resource 'clients', ->
    @resource 'clients.show', path: '/:id'

  # @resource "sales-reps", ->
  #   @route 'show', path: ':srep_id'



`export default Router`
