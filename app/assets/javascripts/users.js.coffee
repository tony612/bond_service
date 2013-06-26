UserIndexCtrl = ($scope, Users, User) ->
  $scope.users = Users.index()
  $scope.orderProp = "id"

  $scope.destroy = (userId) ->
    new User.delete({userId: userId}, (resource) ->
      # Ajax success
      $('tr#user_'+userId).fadeOut()
    , (response) ->
      # Ajax fail
      console.log(response)
    )

UserIndexCtrl.$inject = ['$scope', 'Users', 'User']

UserNewCtrl = ($scope, $location, Users) ->
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
