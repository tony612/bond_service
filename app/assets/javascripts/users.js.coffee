UserIndexCtrl = ($scope, Users) ->
  $scope.users = Users.index

UserIndexCtrl.$inject = ['$scope', 'Users']

UserNewCtrl = ($scope, $location, Users, User) ->
  $scope.user = {}
  debugger

  $scope.create = (user) ->
    u = new Users({user: user})
    u.$save (user) ->
      $location.path("/users/#{user.id}")

UserNewCtrl.$inject = ['$scope', '$location', 'Users']

UserCtrl = ($scope, User, $routeParams) ->
  $scope.user = User.show

UserNewCtrl.$inject = ['$scope', 'User']

UserEditCtrl = ($scope) ->
  {}

window.UserIndexCtrl = UserIndexCtrl
window.UserNewCtrl = UserNewCtrl
window.UserCtrl = UserCtrl
window.UserEditCtrl = UserEditCtrl
