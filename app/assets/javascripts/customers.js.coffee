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

CustomerNewCategoryCtrl = ($scope, $location, CustomerCategories) ->
  $scope.category = {}

  $scope.create = (category) ->
    u = new CustomerCategories({customer_category: category})
    u.$save (category) ->
      $location.path("/customers")

CustomerNewCategoryCtrl.$inject = ['$scope', '$location', 'CustomerCategories']

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

CustomerCategoryEditCtrl = ($scope, $routeParams, $location, CustomerCategory) ->
  categoryId = $routeParams.categoryId
  category = new CustomerCategory.show({categoryId: categoryId}, (category) ->
    $scope.category = {name: category.name, desc: category.desc}
  )

  $scope.update = (category) ->
    new CustomerCategory({customer_category: category}).$update({categoryId: categoryId}, (category) ->
      $location.path("/customers/categories")
    )

CustomerCategoryEditCtrl.$inject = ['$scope', '$routeParams', '$location', 'CustomerCategory']

window.CustomerIndexCtrl = CustomerIndexCtrl
window.CustomerNewCtrl = CustomerNewCtrl
window.CustomerCtrl = CustomerCtrl
window.CustomerEditCtrl = CustomerEditCtrl
window.CustomerImportCtrl = CustomerImportCtrl
window.CustomerNewCategoryCtrl = CustomerNewCategoryCtrl
window.CustomerCategoryIndexCtrl = CustomerCategoryIndexCtrl
window.CustomerCategoryEditCtrl = CustomerCategoryEditCtrl
