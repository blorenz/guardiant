from django import forms
from cmsplugin_contact.forms import ContactForm

class CustomContactForm(forms.Form):
    email = forms.EmailField()
    content = forms.CharField(widget=forms.Textarea())
    first_name = forms.CharField()
    last_name = forms.CharField()