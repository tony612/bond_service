angular.module('bondDirectives', [])
.directive('uploadFile', () ->
  debugger
  console.log('Set directive')
  {
    restrict: 'A',
    link: (scope, element, attrs, controller) ->
      element.bind('change', (event) ->
        debugger
        console.log('File changed')
      )
  }
)
