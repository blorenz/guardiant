app = angular.module('productFinder', [
  'ngRoute'
  'productFinder.services'
  'productFinder.controllers'

])

#app.config(($interpolateProvider, $stateProvider, $urlRouterProvider) ->
#  #Play nice with django's template
#  $interpolateProvider.startSymbol('[[')
#  $interpolateProvider.endSymbol(']]')
#  #Default to question list
#  $urlRouterProvider.otherwise('/');
#
#  $stateProvider
#  .state('categoryList'
#    url: '/'
#    templateUrl: 'categoryList'
#    controller: 'categoryListController'
#    resolve:
#      categories : (Categories)->
#        Categories.fetch()
#        return Categories.data()
#  )
#  .state('productsList'
#    url: '/{categorySlug:[\w-]+}/'
#    templateUrl: 'productsList'
#    controller: 'productsListController'
#    resolve:
#      products : ($scope, $stateParams, Products)->
#        debugger
#        Products.fetch()#get($stateParams.categorySlug)
#        return products.data()
#  )
#  .state('productDetailDetail'
#    url: '/{categorySlug:[\w-]+}/{productSlug:[\w-]+}/'
#    templateUrl: 'productDetail'
#    controller: 'productDetailController'
#    resolve:
#      product : ($stateParams, $log, Product)->
#        product = new Product(null)
#        product.get($stateParams.categorySlug, $stateParams.productSlug)
#        return product
#  )
#)

app.config(($interpolateProvider) ->
  #Play nice with django's template
  $interpolateProvider.startSymbol('[[')
  $interpolateProvider.endSymbol(']]')
)



app.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/',
      templateUrl: "categoryList"
      controller: 'categoryListController'
    )
#    .
#      when('/c/:categorySlug',
#        templateUrl: "productsList"
#        controller: 'productsListController'
#      ).
#      when('/c/:categorySlug/:productSlug',
#        templateUrl: "productDetail"
#        controller: 'productDetailController'
#      ).
  otherwise(
    redirectTo: '/'
  )
])

app.config(($httpProvider) ->
  getCookie = (name) ->
    for cookie in document.cookie.split ';' when cookie and name is (cookie.trim().split '=')[0]
      return decodeURIComponent cookie.trim()[(1 + name.length)...]
    null
  # Add Header to comply with Django's CSRF implementation
  $httpProvider.defaults.headers.common['X-CSRFToken'] = getCookie("csrftoken")
)