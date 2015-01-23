`import Ember from 'ember'`

Router = Ember.Router.extend 
  location: CrmEmberENV.locationType


Router.map () ->
  @route 'about'

  @resource 'clients', ->
    @route 'new'
    @resource 'client', path: '/:client_id', ->
      @resource 'contacts', ->
        @resource 'contact', path: '/:contact_id', ->
        @route 'edit', path: '/:contact_id/edit'
        @route 'new'
    @route 'edit', path: '/:client_id/edit'

  @resource "sales-reps", ->
    @route 'new'
    @resource 'sales-rep', path: '/:sales_rep_id', ->
      @route 'edit'



`export default Router`
