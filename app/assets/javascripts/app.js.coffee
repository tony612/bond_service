angular.module('bondservice', ['bondserviceServices'])
  .config(['$routeProvider', ($routeProvider) ->
    $routeProvider
    .when('/users', {templateUrl: '/users.html', controller: UserIndexCtrl})
    .when('/users/new', {templateUrl: '/users/new.html', controller: UserNewCtrl})
    # The templateUrl param(func) method is available in the unstable of angular
    .when('/users/:userId', {templateUrl: (params) ->
      "/users/#{params.userId}"
    , controller: UserCtrl})
    .when('/users/:userId/edit', {templateUrl: '/users/modify.html', controller: UserEditCtrl})
  ])
  .config(['$routeProvider', ($routeProvider) ->
    $routeProvider
    .when('/plans', {templateUrl: '/plans.html', controller: PlanIndexCtrl})
    .when('/plans/new', {templateUrl: '/plans/new.html', controller: PlanNewCtrl})
    # The templateUrl param(func) method is available in the unstable of angular
    .when('/plans/:planId', {templateUrl: (params) ->
      "/plans/#{params.planId}"
    , controller: PlanCtrl})
    .when('/plans/:planId/edit', {templateUrl: (params) ->
      "/plans/#{params.planId}/edit.html"
    , controller: PlanEditCtrl})
  ])
  .config(["$httpProvider", (provider) ->
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  ])
