App.SalesRepsController = Ember.ArrayController.create({
	refresh: function(){
		App.SalesRepsController.set('content',App.SalesRep.find());
	}
});