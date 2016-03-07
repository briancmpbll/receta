receta = angular.module('receta', [
  'templates'
  'ngRoute'
  'ngResource'
  'angular-flash.service'
  'angular-flash.flash-alert-directive'
  'controllers'
])

receta.config(['$routeProvider', 'flashProvider'
  ($routeProvider, flashProvider)->
    flashProvider.errorClassnames.push('alert-danger')
    flashProvider.warnClassnames.push('alert-warning')
    flashProvider.infoClassnames.push('alter-info')
    flashProvider.successClassnames.push('alert-success')

    $routeProvider
      .when('/',
        templateUrl: 'index.html'
        controller: 'RecipesController'
      ).when('/recipes/new',
        templateUrl: 'form.html'
        controller: 'RecipeController'
      ).when('/recipes/:recipeId',
        templateUrl: "show.html",
        controller: 'RecipeController'
      ).when('/recipes/:recipeId/edit',
        templateUrl: 'form.html'
        controller: 'RecipeController'
      )
])

controllers = angular.module('controllers', [])
