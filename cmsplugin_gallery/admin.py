from inline_ordering.admin import OrderableStackedInline
import forms
import models


class ImageInline(OrderableStackedInline):

    model = models.Image
    form = forms.ImageForm

    fieldsets = (
        (None,
         {
             'fields': ( 'src', 'title',),
         }
        ),
        ('Advanced',
         {
             'fields': ('inline_ordering_position','extended_content','alt','link',),
             'classes': ('collapse',),
        }
        )

    )
    class Media:
        js = ('js/jqueryFix.js','js/jquery-ui-1.10.3.custom.min.js',)
        css = {
            "all": ("css/jquery-ui-1.10.3.custom.min.css",)
        }

    def formfield_for_dbfield(self, db_field, **kwargs):
        if db_field.name == 'src':
            kwargs.pop('request', None)
            kwargs['widget'] = forms.AdminImageWidget
            return db_field.formfield(**kwargs)
        return super(ImageInline, self).\
            formfield_for_dbfield(db_field, **kwargs)
