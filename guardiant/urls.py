# from django.conf.urls import patterns, include, url
#
# from django.contrib import admin
# admin.autodiscover()
#
# urlpatterns = patterns('',
#     # Examples:
#     # url(r'^$', 'guardiant.views.home', name='home'),
#     # url(r'^blog/', include('blog.urls')),
#
#     url(r'^admin/', include(admin.site.urls)),
# )



from django.conf.urls import include, patterns, url
# from django.conf.urls.i18n import i18n_patterns
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static

admin.autodiscover()

urlpatterns = patterns('',
                            url(r'^admin/', include(admin.site.urls)),
                            url(r'^', include('cms.urls')),
                            )

if settings.DEBUG:
    urlpatterns = patterns('',
                           url(r'^media/(?P<path>.*)$', 'django.views.static.serve',
                               {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
                           url(r'', include('django.contrib.staticfiles.urls')),
                           )  + urlpatterns