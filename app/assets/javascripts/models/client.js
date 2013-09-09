App.Client = DS.Model.extend({
    meetings: DS.hasMany('App.Meeting'),
    name: DS.attr("string"),
    
});

App.Client.FIXTURES = [{
    id: 1,
    name: "Open Table",
    meetings: [1, 2]
},{
    id: 2,
    name: "Akasa",
    
}];