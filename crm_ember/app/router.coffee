`import Ember from 'ember'`

Router = Ember.Router.extend 
  location: CrmEmberENV.locationType


Router.map () ->
  @route 'about'
  @resource 'clients', ->
    @route 'show', path: ':client_id'

  # @resource "sales-reps", ->
  #   @route 'show', path: ':srep_id'



`export default Router`
