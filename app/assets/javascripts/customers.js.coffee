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

CustomerNewCtrl = ($scope, $location, Customers, CustomerCategories) ->
  $scope.customer = {}
  $scope.categories = CustomerCategories.index()

  $scope.create = (customer) ->
    u = new Customers({customer: customer})
    u.$save (customer) ->
      $location.path("/customers/#{customer.id}")

CustomerNewCtrl.$inject = ['$scope', '$location', 'Customers', 'CustomerCategories']

CustomerCtrl = ($scope, $routeParams, Customer) ->
  $scope.customer = Customer.show({customerId: $routeParams.customerId})

CustomerCtrl.$inject = ['$scope', '$routeParams', 'Customer']

CustomerEditCtrl = ($scope, $routeParams, $location, Customer, CustomerCategories) ->
  $scope.categories = CustomerCategories.index()
  customerId = $routeParams.customerId
  customer = new Customer.show({customerId: customerId}, (customer) ->
    $scope.customer = {name: customer.name, category: customer.category, desc: customer.desc, content: customer.content, customer_category_id: customer.category.id}
  )

  $scope.update = (customer) ->
    new Customer({customer: customer}).$update({customerId: customerId}, (customer) ->
      $location.path("/customers/#{customerId}")
    )


CustomerEditCtrl.$inject = ['$scope', '$routeParams', '$location', 'Customer', 'CustomerCategories']

CustomerImportCtrl = ($scope) ->
  $scope.customer = {}
  $scope.upload = (customer) ->
    debugger
    customer.file.submit()

CustomerImportCtrl.$inject = ['$scope']


CustomerCategoryIndexCtrl = ($scope, CustomerCategory, CustomerCategories) ->
  $scope.categories = CustomerCategories.index()
  $scope.orderProp = "id"

  $scope.destroy = (categoryId) ->
    new CustomerCategory.delete({categoryId: categoryId}, (resource) ->
      # Ajax success
      $('tr#category_'+categoryId).fadeOut()
    , (response) ->
      # Ajax fail
      console.log(response)
    )

CustomerCategoryIndexCtrl.$inject = ['$scope', 'CustomerCategory', 'CustomerCategories']
window.CustomerIndexCtrl = CustomerIndexCtrl
window.CustomerNewCtrl = CustomerNewCtrl
window.CustomerCtrl = CustomerCtrl
window.CustomerEditCtrl = CustomerEditCtrl
window.CustomerImportCtrl = CustomerImportCtrl
window.CustomerCategoryIndexCtrl = CustomerCategoryIndexCtrl
