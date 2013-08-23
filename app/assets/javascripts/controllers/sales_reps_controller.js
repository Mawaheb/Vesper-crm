App.SalesRepsController = Ember.ArrayController.create({
	refresh: function(){
		$.getJSON(
			//URL:
			'/sales_reps',
			//Success Handler:
			function(data){
				$.each(data,function(index, value){
				  myObject = Ember.Object.create({name: value.first_name +' '+ value.last_name , id: value.id});
				  App.salesReps.pushObject(myObject);

				  });
			}
		);
	}
});