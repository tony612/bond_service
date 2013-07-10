PlanIndexCtrl = ($scope, Plans, Plan) ->
  $scope.plans = Plans.index()
  $scope.orderProp = "id"

  $scope.destroy = (planId) ->
    new Plan.delete({planId: planId}, (resource) ->
      # Ajax success
      $('tr#plan_'+planId).fadeOut()
    , (response) ->
      # Ajax fail
      console.log(response)
    )

PlanIndexCtrl.$inject = ['$scope', 'Plans', 'Plan']

PlanNewCtrl = ($scope, $location, Plans, CustomerCategories) ->
  $scope.plan = {}
  CustomerCategories.index((categories) ->
    cc = for cat in categories
      {id: cat.id, name: cat.name, desc: cat.desc}
    $scope.categories = [{id: 0, name: ""}].concat cc
  )

  $scope.create = (plan) ->
    u = new Plans({plan: plan})
    u.$save (plan) ->
      $location.path("/plans/#{plan.id}")

PlanNewCtrl.$inject = ['$scope', '$location', 'Plans', 'CustomerCategories']

PlanCtrl = ($scope, $routeParams, Plan) ->
  $scope.plan = Plan.show({planId: $routeParams.planId})

PlanCtrl.$inject = ['$scope', '$routeParams', 'Plan']

PlanEditCtrl = ($scope, $routeParams, $location, Plan, CustomerCategories) ->
  planId = $routeParams.planId
  #$scope.categories = CustomerCategories.index()
  CustomerCategories.index((categories) ->
    cc = for cat in categories
      {id: cat.id, name: cat.name, desc: cat.desc}
    $scope.categories = [{id: 0, name: ""}].concat cc
  )

  plan = new Plan.show({planId: planId}, (plan) ->
    $scope.plan = {name: plan.name, category: plan.category, desc: plan.desc, content: plan.content, customer_category_ids: plan.customer_category_ids}
  )

  $scope.update = (plan) ->
    new Plan({plan: plan}).$update({planId: planId}, (plan) ->
      $location.path("/plans/#{planId}")
    )


PlanEditCtrl.$inject = ['$scope', '$routeParams', '$location', 'Plan', 'CustomerCategories']

window.PlanIndexCtrl = PlanIndexCtrl
window.PlanNewCtrl = PlanNewCtrl
window.PlanCtrl = PlanCtrl
window.PlanEditCtrl = PlanEditCtrl
