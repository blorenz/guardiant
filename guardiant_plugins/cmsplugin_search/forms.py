from django import forms

class SearchPluginForm(forms.Form):
    search_query = forms.CharField()