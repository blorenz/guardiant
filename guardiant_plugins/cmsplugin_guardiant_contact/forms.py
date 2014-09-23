from django import forms
from django.utils.translation import ugettext_lazy as _
#import settings
from .nospam.forms import HoneyPotForm, RecaptchaForm, AkismetForm
  
class GuardiantContactForm(forms.Form):
    email = forms.EmailField(label=_("Email"))
    first = forms.CharField(label=_("First"), required=True)
    last = forms.CharField(label=_("Last"), required=True)
    content = forms.CharField(label=_("Content"), widget=forms.Textarea())

    template = "cmsplugin_guardiant_contact/contact.html"
  
class HoneyPotContactForm(HoneyPotForm):
    pass

class AkismetContactForm(AkismetForm):
    akismet_fields = {
        'comment_author_email': 'email',
        'comment_content': 'content'
    }
    akismet_api_key = None
    

class RecaptchaContactForm(RecaptchaForm):
    recaptcha_public_key = None
    recaptcha_private_key = None
    recaptcha_theme = None
