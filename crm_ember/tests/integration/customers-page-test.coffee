`import startApp from 'crm-ember/tests/helpers/start-app';`

App = null
server = null

module 'Integeration - Customers page', 
  setup: -> 
    App = startApp()
    customers = [
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
      @get "/api/customers", (request) ->
        [200, {"Content-Type": "application/json" }, JSON.stringify(customers: customers)]

      @get "/api/customers/:id", (request) ->
        customer = customers.find((customer) ->
          customer  if customer.id is parseInt(request.params.id, 10)
        )
        [200, {"Content-Type": "application/json"}, JSON.stringify(customer: customer)]
    
  teardown: -> 
    Ember.run(App, 'destroy')
    server.shutdown()

test 'Should allow navigation to the Customers page from the home page', ->
  visit('/').then ->
    click('a:contains("Customers")').then ->
      equal(find('h3').text(), 'Customers')

test 'Should list all Customers', ->
  visit('/customers').then ->
    equal(find('a:contains("Mark Twain")').length, 1)
    equal(find('a:contains("Can Atilla")').length, 1)
    equal(find('a:contains("Charbel Rouhana")').length, 1)


test 'Should be able to navigate to a Customer page', ->
  visit('/customers').then ->
    click('a:contains("Mark Twain")').then ->
      equal(find('h4').text(), 'Mark Twain')


test 'Should be able to visit a speaker page', ->
  visit('/customers/1').then ->
    equal(find('h4').text(), 'Mark Twain')