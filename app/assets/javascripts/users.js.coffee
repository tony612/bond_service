UserIndexCtrl = ($scope, Users) ->
  $scope.users = Users.index

UserIndexCtrl.$inject = ['$scope', 'Users']

UserNewCtrl = ($scope) ->
  {}

UserNewCtrl.$inject = ['$scope']

UserCtrl = ($scope, User, $routeParams) ->
  $scope.user = User.show

UserNewCtrl.$inject = ['$scope', 'User']

UserEditCtrl = ($scope) ->
  {}

window.UserIndexCtrl = UserIndexCtrl
window.UserNewCtrl = UserNewCtrl
window.UserCtrl = UserCtrl
window.UserEditCtrl = UserEditCtrl
