from django.contrib.admin.widgets import AdminFileWidget
from django.utils.translation import ugettext as _
from django.utils.safestring import mark_safe
from django import forms
from tinymce.widgets import TinyMCE
import models


class AdminImageWidget(AdminFileWidget):
    def render(self, name, value, attrs=None):
        output = []
        if value and getattr(value, "url", None):
            image_url = value.url
            file_name = str(value)
            output.append(u' <a href="%s" target="_blank"><img src="%s" alt="%s" style="height: 50px;" /></a><br /> %s ' % \
                (unicode(image_url), unicode(image_url), unicode(file_name), _('Change:')))
        output.append(super(AdminFileWidget, self).render(name, value, attrs))
        return mark_safe(u''.join(output))

class ImageForm(forms.ModelForm):
    extended_content = forms.CharField(widget=TinyMCE(
        # attrs={'cols': 80, 'rows': 30},
        mce_attrs={
            'plugins': "fullscreen,table,spellchecker,paste,searchreplace",
            'theme': "advanced",
            'theme_advanced_buttons1_add' : "fullscreen",
            },
        ))

    class Meta:
        model = models.Image