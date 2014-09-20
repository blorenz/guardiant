services = angular.module('productFinder.services', ['ngResource'])


services.factory 'Categories', ['$resource', ($resource) ->
  $resource("/product_finder/categories", {},
    query:
      method:'GET'
#      params:
#        phoneId: 'phones'
      isArray: true
  )
]

#services.factory('Product', ($http, $log)->
#  class Product
#    constructor: (data) ->
#      @name = data.name
#      @description = data.description
#      @front_img = data.front_img
#      @back_img = data.back_img
#      @ortho_img = data.ortho_img
#      @download_file = data.download_file
#      @id = data.id
#
#    get : (categorySlug, productSlug) ->
#      $http({method: 'GET', url: "/product_finder/categories/#{categorySlug}/#{productSlug}/"})
#      .success (data) =>
#        @init(data)
#        $log.info("Succesfully fetched question")
#      .error (data) =>
#        $log.info("Failed to fetch question.")
#
#  return Product
#)

#
#services.factory('Products', ( $http, $log, Product) ->
#  class Products
#
#    constructor : (data) ->
#      if data != null
#        @init(data)
#    init : (data) ->
#      @title = data.title
#      @id = data.id
#      @ordering = data.ordering
#      @img = data.img
#      @slug = data.slug
#      @collection = []
#
##      for product in data.collection
##        c = new Product(product)
##        @collection.push(new Product(product))
#
##    get : (categorySlug) ->
##      $http({method: 'GET', url: "/product_finder/categories/#{categorySlug}/"})
##      .success (data) =>
##        @init(data)
##        $log.info("Succesfully fetched question")
##      .error (data) =>
##        $log.info("Failed to fetch question.")
#
#    fromServer: (data) ->
#      @collection.length = 0
#      for product in data
#        @collection.push(new Product(product))
#
#    fetch: ->
#      $http({method: 'GET', url: "/product_finder/categories/#{@slug}"})
#      .success (data) =>
#        @fromServer(data)
#        $log.info("Succesfully fetched products.")
#      .error (data) =>
#        $log.info("Failed to fetch products.")
#  return Products
#)

#services.factory('Categories', ($log, $http, Products) ->
#  categories = {
#    all : []
#  }
#
#  fromServer: (data) ->
#    categories['all'].length = 0
#    for category in data
#      categories['all'].push(new Products(category))
#
#  fetch: ->
#    debugger
#    $http({method: 'GET', url: '/product_finder/categories'})
#    .success (data) =>
#      @fromServer(data)
#      $log.info("Succesfully fetched questions.")
#    .error (data) =>
#      $log.info("Failed to fetch questions.")
#
#  data : ->
#    return categories
#)