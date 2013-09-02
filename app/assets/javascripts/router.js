// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
	this.resource('clients', function () {
		this.route('new');
	});
	this.route('sales_reps');
	this.route('meetings');
});
