App.Client = DS.Model.extend({
	name: DS.attr('string'),
});

App.Client.FIXTURES = [{
	id: 1,
	name: "Open Table"
},{
	id: 2,
	name: "Akasa"
}];