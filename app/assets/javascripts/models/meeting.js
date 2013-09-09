App.Meeting = DS.Model.extend({
  client: DS.belongsTo('App.Client'),
  memo: DS.attr("string"),
  
});

App.Meeting.FIXTURES = [{
    id: 1,    
    memo: "this is a Memo of Meeting:1",    
},{
    id: 2,
    memo: "this is an outcome",    
}];