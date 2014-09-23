from django import forms
from django.utils.translation import ugettext_lazy as _

class GuardiantContactForm(forms.Form):
    email = forms.EmailField(label=_("Email"))
    first = forms.CharField(label=_("First"), required=False)
    last = forms.CharField(label=_("Last"), required=False)
    content = forms.CharField(label=_("Content"), widget=forms.Textarea())

    template = "cmsplugin_contact/contact.html"