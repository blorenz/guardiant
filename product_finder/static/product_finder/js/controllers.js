// Generated by CoffeeScript 1.7.1
var controllers;

controllers = angular.module('productFinder.controllers', []);

controllers.controller('categoryListController', [
  '$scope', 'Categories', function($scope, Categories) {
    debugger;
    return $scope.categories = Categories.query();
  }
]);

controllers.controller('productsListController', function($scope, $state, $log, products) {
  return $scope.products = products;
});

controllers.controller('productDetailController', function($scope, $state, $log, product) {
  return $scope.product = product;
});

//# sourceMappingURL=controllers.map
