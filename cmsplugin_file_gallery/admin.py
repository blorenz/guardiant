from inline_ordering.admin import OrderableStackedInline
import forms
import models


class FileInline(OrderableStackedInline):

    model = models.DownloadableFile
    fieldsets = (
        (None,
         {
             'fields': ( 'src','downloadable_file'),
             }
        ),
        ('Advanced',
         {
             'fields': ( 'title','extended_content','subtitle', 'author', 'alt','inline_ordering_position',),
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
        return super(FileInline, self).\
            formfield_for_dbfield(db_field, **kwargs)
