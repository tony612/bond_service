angular.module('bondserviceServices', ['ngResource'])
.factory('Users', ['$resource', ($resource) ->
  $resource('/users.json', {}, {
    index: {method: 'GET', isArray: true}
  })
])
.factory('User', ['$resource', ($resource) ->
  $resource('/users/:userId.json', {}, {
    show: {method:'GET'},
    update: {method: 'PUT'}
  })
])
.factory('Plans', ['$resource', ($resource) ->
  $resource('/plans.json', {}, {
    index: {method: 'GET', isArray: true}
  })
])
.factory('Plan', ['$resource', ($resource) ->
  $resource('/plans/:planId.json', {}, {
    show: {method:'GET'},
    update: {method: 'PUT'}
  })
])
.factory('Customers', ['$resource', ($resource) ->
  $resource('/customers.json', {}, {
    index: {method: 'GET', isArray: true}
  })
])
.factory('Customer', ['$resource', ($resource) ->
  $resource('/customers/:customerId.json', {}, {
    show: {method:'GET'},
    update: {method: 'PUT'}
  })
])
.factory('CustomerCategories', ['$resource', ($resource) ->
  $resource('/customers/categories.json', {}, {
    index: {method:'GET', isArray: true}
  })
])
.factory('CustomerCategory', ['$resource', ($resource) ->
  $resource('/customers/categories/:categoryId.json', {}, {
    show: {method:'GET'},
    update: {method: 'PUT'}
  })
])
