App.ClientsRoute = Ember.Route.extend({
  model: function() {
  	return App.Client.find();
  }
  // setupController: function(controller, context) {
  //   this._super(controller, context);
  //   this.controllerFor('clientNew').set('model', App.Client.create({
  //     name: "new client" }));
  // }

});