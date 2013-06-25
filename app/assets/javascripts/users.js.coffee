UserIndexCtrl = ($scope, Users) ->
  $scope.users = Users.index()
  $scope.orderProp = "id"

UserIndexCtrl.$inject = ['$scope', 'Users']

UserNewCtrl = ($scope, $location, Users, User) ->
  $scope.user = {}

  $scope.create = (user) ->
    u = new Users({user: user})
    u.$save (user) ->
      $location.path("/users/#{user.id}")

UserNewCtrl.$inject = ['$scope', '$location', 'Users']

UserCtrl = ($scope, $routeParams, User) ->
  $scope.user = User.show({userId: $routeParams.userId})

UserCtrl.$inject = ['$scope', '$routeParams', 'User']

UserEditCtrl = ($scope) ->
  {}

UserEditCtrl.$inject = ['$scope']

window.UserIndexCtrl = UserIndexCtrl
window.UserNewCtrl = UserNewCtrl
window.UserCtrl = UserCtrl
window.UserEditCtrl = UserEditCtrl
