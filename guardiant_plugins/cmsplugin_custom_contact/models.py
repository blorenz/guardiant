from django.db import models
from cmsplugin_contact.models import BaseContact
from django.utils.translation import ugettext_lazy as _

class CustomContact(BaseContact):
    first_name = models.CharField(
        _('First Name'),
        default=_('First Name'), max_length=50)
    last_name = models.CharField(
        _('Last Name'),
        default=_('Last Name'), max_length=50)
    # name_label = models.CharField(
    #     _('Name label'),
    #     default=_('Name'), max_length=20)
    # company_label = models.CharField(
    #     _('Company label'),
    #     default=_('Company'), max_length=20)
