import threading

from cms.models import CMSPlugin
from django.db import models
from django.utils.translation import ugettext_lazy as _
from inline_ordering.models import Orderable

import utils

localdata = threading.local()
localdata.TEMPLATE_CHOICES = utils.autodiscover_templates()
TEMPLATE_CHOICES = localdata.TEMPLATE_CHOICES


class FileGalleryPlugin(CMSPlugin):

    title = models.CharField(_("Gallery Title"), max_length=255)
    # slide_duration = models.FloatField(default="3")
    # fade_duration = models.FloatField(default="1")

    def copy_relations(self, oldinstance):
        for f in oldinstance.downloadablefile_set.all():
            new_img = DownloadableFile()
            new_img.gallery=self
            new_img.src = f.src
            new_img.src_height = f.src_height
            new_img.src_width = f.src_width
            new_img.title = f.title
            new_img.alt = f.alt
            new_img.link = f.link
            new_img.extended_content = f.extended_content
            new_img.downloadable_file = f.downloadable_file
            new_img.author = f.author
            new_img.subtitle = f.subtitle
            new_img.save()

    template = models.CharField(max_length=255,
                                choices=TEMPLATE_CHOICES,
                                default='cmsplugin_file_gallery/gallery.html',
                                editable=len(TEMPLATE_CHOICES) > 1)

    def __unicode__(self):
        return _(u'%(count)d file(s) in gallery') % {'count': self.downloadablefile_set.count()}



class DownloadableFile(Orderable):

    def get_media_path(self, filename):
        pages = self.gallery.placeholder.page_set.all()
        return pages[0].get_media_path(filename)

    gallery = models.ForeignKey(FileGalleryPlugin, verbose_name=_("Gallery"))
    src = models.ImageField(_("Poster image file"), upload_to=get_media_path,
                            height_field='src_height',
                            width_field='src_width',
                            blank=True, null=True)
    src_height = models.PositiveSmallIntegerField(_("Poster image height"), editable=False, null=True)
    src_width = models.PositiveSmallIntegerField(_("Poster image height"), editable=False, null=True)

    title = models.CharField(_("Title"), max_length=255, blank=True, null=True)
    alt = models.TextField(_("Alt text"), blank=True, null=True)
    link = models.CharField(_("Link"), max_length=255, blank=True, null=True)
    extended_content = models.TextField(_("Extended Content"), blank=True, null=True)
    author = models.CharField(_("Author"), max_length=255, blank=True, null=True)
    subtitle = models.CharField(_("Subtitle"), max_length=255, blank=True, null=True)

    downloadable_file = models.FileField(_("Downloadable file"), upload_to=get_media_path, max_length=255)

    def __unicode__(self):
        return self.title or self.alt or str(self.pk)
