App.ClientsNewRoute = Ember.Route.extend({
	model: function() {
		return App.Client.createRecord();
	}

});