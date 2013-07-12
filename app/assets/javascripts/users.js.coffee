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
      if user.id?
        $location.path("/users/#{user.id}") if user.id?
      else
        errors = ""
        for key, msgs of user.error_msg
          errors = errors.concat msgs.map((msg) -> "<li>#{key} #{msg}</li>")
        error_html = '<div class="alert alert-block alert-error fade in error-msgs">
          <a href="javascript:void(0)" data-dismiss="alert" class="close">×</a>
          <h4 class="alert-heading">Some errors were raised!</h4>
          <ul>'
        $('.error-msgs').html(error_html + errors + '</ul></div>')

UserNewCtrl.$inject = ['$scope', '$location', 'Users']

UserCtrl = ($scope, $routeParams, User) ->
  $scope.user = User.show({userId: $routeParams.userId})

UserCtrl.$inject = ['$scope', '$routeParams', 'User']

UserEditCtrl = ($scope, $routeParams, $location, User) ->
  userId = $routeParams.userId
  user = new User.show({userId: userId}, (user) ->
    $scope.user = {email: user.email, number: user.number, name: user.name, desc: user.desc}
  )

  $scope.update = (user) ->
    new User({user: user}).$update({userId: userId}, (user) ->
      $location.path("/users/#{userId}")
    )


UserEditCtrl.$inject = ['$scope', '$routeParams', '$location', 'User']

window.UserIndexCtrl = UserIndexCtrl
window.UserNewCtrl = UserNewCtrl
window.UserCtrl = UserCtrl
window.UserEditCtrl = UserEditCtrl
