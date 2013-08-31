// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
	this.route('clients');
	this.resource('sales_reps');
	this.route('meetings');
});
