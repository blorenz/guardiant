from django.db import models
from django.utils.translation import ugettext_lazy as _
from cms.models import CMSPlugin
from django.utils.translation import ugettext_lazy as _
import threading

import utils

localdata = threading.local()
localdata.TEMPLATE_CHOICES = utils.autodiscover_templates()
TEMPLATE_CHOICES = localdata.TEMPLATE_CHOICES

class SearchPluginConfig(CMSPlugin):
    search_identifier = models.CharField(
        _('Search Identifier'),
        default=_('some_id'), max_length=50)

    template = models.CharField(max_length=255,
                                choices=TEMPLATE_CHOICES,
                                default='cmsplugin_search/gallery.html',
                                editable=len(TEMPLATE_CHOICES) > 1)

