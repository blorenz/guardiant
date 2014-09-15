from django.conf.urls import patterns, url, include
from .views import ProductCategoryList, ProductDetail, ProductList

urlpatterns = patterns('product_finder.views',
                       url(r'^categories$', ProductCategoryList.as_view(),
                           name='product_category_list'),

                       url(r'^categories/(?P<slug>[\w-]+)/$', ProductList.as_view(),

                           name="product_list"),

                       url(r'^categories/(?P<category_slug>[\w-]+)/(?P<slug>[\w-]+)/$', ProductDetail.as_view(),

                           name='product_detail'),
                       url(r'^$', 'index', name='product_finder_index'),
                       )