from django.utils.translation import ugettext_lazy as _

from cms.plugin_pool import plugin_pool

import os
from django import dispatch
from django.conf import settings
from django.utils.translation import ugettext_lazy as _
from django.forms.fields import CharField
from django import forms
from django.core.mail import EmailMessage
from django.template.loader import render_to_string, find_template, TemplateDoesNotExist
from django.http import HttpResponseRedirect

from models import SearchPluginConfig
from .forms import SearchPluginForm

from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from cmsplugin_contact.utils import class_for_path

class GuardiantSearchPlugin(CMSPluginBase):
    name = _("Guardiant Search")
    
    model = SearchPluginConfig
    contact_form = SearchPluginForm
    
    # We're using the original cmsplugin_contact templates here which
    # works fine but requires that the original plugin is in INSTALLED_APPS.
    # render_template = "cmsplugin_custom_contact/contact.html"
    # email_template = "cmsplugin_custom_contact/email.txt"
    render_template = 'cmsplugin_search/gallery.html'

    def render(self, context, instance, placeholder):
        # context.update({
        #     'images': instance.image_set.all(),
        #     'gallery': instance,
        #     })
        self.render_template = instance.template
        return context
    


plugin_pool.register_plugin(GuardiantSearchPlugin)
