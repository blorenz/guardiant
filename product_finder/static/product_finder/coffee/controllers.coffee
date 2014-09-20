controllers = angular.module('productFinder.controllers', [])

controllers.controller 'categoryListController', ['$scope', 'Categories', ($scope, Categories) ->
  $scope.categories = Categories.query()
]

#controllers.controller('productsListController', ($scope, $state, $log, products) ->
#  $scope.products = products
#)
#
#
#controllers.controller('productDetailController', ($scope, $state, $log, product) ->
#  $scope.product = product
#  $scope.voted = false
#  $scope.voteChoice = 0
#
#  $scope.vote = ->
#    for choice in $scope.question.choices
#      if choice.id == parseInt($scope.voteChoice)
#        choice.votes+=1
#        $scope.question.totalVotes+=1
#        choice.update()
#        break
#    $scope.voted = true
)