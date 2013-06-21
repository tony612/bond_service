@UsersCtrl = ($scope, $http) ->
  $http.get('/users.json').success (data) ->
    $scope.users = data

    #$scope.users = [
    #  {
    #    id: 1,
    #    email: "foo@e.com"
    #  },
    #  {
    #    id: 2,
    #    email: "bar@e.com"
    #  },
    #  {
    #    id: 3,
    #    email: "foobar@e.com"
    #  }
    #]

@UsersCtrl.$inject = ['$scope', '$http']

