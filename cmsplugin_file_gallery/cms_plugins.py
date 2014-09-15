from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from django.utils.translation import ugettext_lazy as _

import admin
import models


class CMSFileGalleryPlugin(CMSPluginBase):

    model = models.FileGalleryPlugin
    inlines = [admin.FileInline, ]
    name = _('File gallery')
    render_template = 'cmsplugin_file_gallery/gallery.html'

    def render(self, context, instance, placeholder):
        context.update({
                        'files': instance.downloadablefile_set.all(),
                        'gallery': instance,
                       })
        self.render_template = instance.template
        return context


plugin_pool.register_plugin(CMSFileGalleryPlugin)
