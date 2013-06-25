angular.module('bondserviceServices', ['ngResource'])
.factory('Users', ($resource) ->
  $resource('/users.json', {}, {
    index: {method: 'GET', isArray: true},
    create: {method: 'POST'}
  })
)
.factory('User', ($resource) ->
  $resource('users/:userId.json', {}, {
    show: {method:'GET'},
    update: {method: 'PUT'}
  })
)
