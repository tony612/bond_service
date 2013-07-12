PlanIndexCtrl = ($scope, $http, Plans, Plan) ->
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

  $scope.publish = (planId) ->
    debugger
    $http.get("/plans/#{planId}/publish.json").success (data, status) ->
      debugger
      console.log(data)
      console.log(status)

PlanIndexCtrl.$inject = ['$scope', '$http', 'Plans', 'Plan']

PlanNewCtrl = ($scope, $location, Plans, CustomerCategories) ->
  $scope.plan = {}
  CustomerCategories.index((categories) ->
    cc = for cat in categories
      {id: cat.id, name: cat.name, desc: cat.desc}
    $scope.categories = [{id: 0, name: ""}].concat cc
  )

  $scope.create = (plan) ->
    p = new Plans({plan: plan})
    p.$save (plan) ->
      if plan.id?
        $location.path("/plans/#{plan.id}") if plan.id?
      else
        debugger
        errors = ""
        for key, msgs of plan.error_msg
          errors = errors.concat msgs.map((msg) -> "<li>#{key} #{msg}</li>")
        error_html = '<div class="alert alert-block alert-error fade in error-msgs">
          <a href="javascript:void(0)" data-dismiss="alert" class="close">×</a>
          <h4 class="alert-heading">Some errors were raised!</h4>
          <ul>'
        $('.error-msgs').html(error_html + errors + '</ul></div>')

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
