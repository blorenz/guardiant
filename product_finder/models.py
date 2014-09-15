from django.db import models

from autoslug import AutoSlugField
def products_image_upload_to(instance, filename):
    if hasattr(instance, 'category'):
        prefix = 'products/%s/%s' % (
            instance.category.id,
            instance.id,
        )
    else:
        prefix = 'products/%s' % (
            instance.id,
        )
    return "%s/%s" % (prefix, filename)

class ProductCategory(models.Model):
    title = models.CharField(max_length=128)
    slug = AutoSlugField(populate_from='title', unique=True)
    ordering = models.IntegerField(default=0)
    img = models.ImageField(upload_to=products_image_upload_to, null=True, blank=True)

    def __unicode__(self):
        return "%s" % self.title

class Product(models.Model):
    name = models.CharField(max_length=128)
    category = models.ForeignKey(ProductCategory)
    description = models.TextField(default=None, null=True, blank=True)
    slug = AutoSlugField(populate_from='name', unique='category')
    front_img = models.ImageField(upload_to=products_image_upload_to, null=True, blank=True)
    back_img = models.ImageField(upload_to=products_image_upload_to, null=True, blank=True)
    ortho_img = models.ImageField(upload_to=products_image_upload_to, null=True, blank=True)
    download_file = models.FileField(upload_to=products_image_upload_to, null=True, blank=True)

    class Meta:
        ordering = ['name',]

    def __unicode__(self):
        return "%s" % self.name
