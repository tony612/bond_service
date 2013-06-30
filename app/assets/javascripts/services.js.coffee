angular.module('bondserviceServices', ['ngResource'])
.factory('Users', ($resource) ->
  $resource('/users.json', {}, {
    index: {method: 'GET', isArray: true}
  })
)
.factory('User', ($resource) ->
  $resource('/users/:userId.json', {}, {
    show: {method:'GET'},
    update: {method: 'PUT'}
  })
)
.factory('Plans', ($resource) ->
  $resource('/plans.json', {}, {
    index: {method: 'GET', isArray: true}
  })
)
.factory('Plan', ($resource) ->
  $resource('/plans/:planId.json', {}, {
    show: {method:'GET'},
    update: {method: 'PUT'}
  })
)
