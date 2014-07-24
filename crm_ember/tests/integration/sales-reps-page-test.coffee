`import startApp from 'crm-ember/tests/helpers/start-app';`

App = null
server = null

module 'Integeration - SalesReps page', 
  setup: -> 
    App = startApp()
    sales_reps = [
      {
        id: 1,
        name: 'Mark Twain'
      },
      {
        id: 2,
        name: 'Can Atilla'
      },
      {
        id: 3,
        name: 'Charbel Rouhana'
      }
    ]

    server = new Pretender ->
      @get "/api/sales-reps", (request) ->
        [200, {"Content-Type": "application/json" }, JSON.stringify(sales_reps: sales_reps)]

      @get "/api/sales-reps/:srep_id", (request) ->
        sales_rep = sales_reps.find((sales_rep) ->
          sales_rep  if sales_rep.id is parseInt(request.params.srep_id, 10)
        )
        [200, {"Content-Type": "application/json"}, JSON.stringify(sales_rep: sales_rep)]
    
  teardown: -> 
    Ember.run(App, 'destroy')
    server.shutdown()


test 'Should allow navigation to the sales_reps page from home page', ->
  visit('/').then ->
    click('a:contains("Sales reps")').then ->
      equal(find('h3').text(), 'Sales Reps')


test 'Should list all sales reps', -> 
  visit('/sales-reps').then ->
    equal(find('a:contains("Mark Twain")').length, 1)
    equal(find('a:contains("Can Atilla")').length, 1)
    equal(find('a:contains("Charbel Rouhana")').length, 1)

# test 'Should be able to navigate to a sales_rep page', ->
#   visit('sales_reps').then ->
#     click('a:contains("Mark Twain")').then ->
#       equal(find('h4').text(), 'Mark Twain')


# test 'Should be able to visit a sales_rep page', ->
#   visit('/sales_reps/1').then ->
#     equal(find('h4').text(), 'Mark Twain')