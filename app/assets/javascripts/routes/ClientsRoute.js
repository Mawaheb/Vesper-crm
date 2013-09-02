App.ClientsRoute = Ember.Route.extend({
  model: function() {
  	return App.Client.find();
  }

});