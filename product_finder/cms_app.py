from cms.app_base import CMSApp
from cms.apphook_pool import apphook_pool
from django.utils.translation import ugettext_lazy as _

class ProductFinderApphook(CMSApp):
    name = _("Product Finder")
    urls = ["product_finder.urls"]

apphook_pool.register(ProductFinderApphook)