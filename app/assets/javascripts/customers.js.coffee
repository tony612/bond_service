CustomerIndexCtrl = ($scope, Customers, Customer) ->
  $scope.customers = Customers.index()
  $scope.orderProp = "id"

  $scope.destroy = (customerId) ->
    new Customer.delete({customerId: customerId}, (resource) ->
      # Ajax success
      $('tr#customer_'+customerId).fadeOut()
    , (response) ->
      # Ajax fail
      console.log(response)
    )

CustomerIndexCtrl.$inject = ['$scope', 'Customers', 'Customer']

CustomerNewCtrl = ($scope, $location, Customers) ->
  $scope.customer = {}

  $scope.create = (customer) ->
    debugger
    u = new Customers({customer: customer})
    u.$save (customer) ->
      $location.path("/customers/#{customer.id}")

CustomerNewCtrl.$inject = ['$scope', '$location', 'Customers']

CustomerCtrl = ($scope, $routeParams, Customer) ->
  $scope.customer = Customer.show({customerId: $routeParams.customerId})

CustomerCtrl.$inject = ['$scope', '$routeParams', 'Customer']

CustomerEditCtrl = ($scope, $routeParams, $location, Customer) ->
  customerId = $routeParams.customerId
  customer = new Customer.show({customerId: customerId}, (customer) ->
    $scope.customer = {name: customer.name, category: customer.category, desc: customer.desc, content: customer.content}
  )

  $scope.update = (customer) ->
    new Customer({customer: customer}).$update({customerId: customerId}, (customer) ->
      $location.path("/customers/#{customerId}")
    )


CustomerEditCtrl.$inject = ['$scope', '$routeParams', '$location', 'Customer']

window.CustomerIndexCtrl = CustomerIndexCtrl
window.CustomerNewCtrl = CustomerNewCtrl
window.CustomerCtrl = CustomerCtrl
window.CustomerEditCtrl = CustomerEditCtrl
