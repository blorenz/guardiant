# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Changing field 'Image.title'
        db.alter_column(u'cmsplugin_gallery_image', 'title', self.gf('django.db.models.fields.CharField')(max_length=255, null=True))

        # Changing field 'Image.link'
        db.alter_column(u'cmsplugin_gallery_image', 'link', self.gf('django.db.models.fields.CharField')(max_length=255, null=True))

        # Changing field 'Image.alt'
        db.alter_column(u'cmsplugin_gallery_image', 'alt', self.gf('django.db.models.fields.TextField')(null=True))

        # Changing field 'Image.extended_content'
        db.alter_column(u'cmsplugin_gallery_image', 'extended_content', self.gf('django.db.models.fields.TextField')(null=True))

    def backwards(self, orm):

        # Changing field 'Image.title'
        db.alter_column(u'cmsplugin_gallery_image', 'title', self.gf('django.db.models.fields.CharField')(default='', max_length=255))

        # Changing field 'Image.link'
        db.alter_column(u'cmsplugin_gallery_image', 'link', self.gf('django.db.models.fields.CharField')(default='', max_length=255))

        # Changing field 'Image.alt'
        db.alter_column(u'cmsplugin_gallery_image', 'alt', self.gf('django.db.models.fields.TextField')(default=''))

        # Changing field 'Image.extended_content'
        db.alter_column(u'cmsplugin_gallery_image', 'extended_content', self.gf('django.db.models.fields.TextField')(default=''))

    models = {
        'cms.cmsplugin': {
            'Meta': {'object_name': 'CMSPlugin'},
            'changed_date': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'creation_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language': ('django.db.models.fields.CharField', [], {'max_length': '15', 'db_index': 'True'}),
            'level': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'lft': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'parent': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['cms.CMSPlugin']", 'null': 'True', 'blank': 'True'}),
            'placeholder': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['cms.Placeholder']", 'null': 'True'}),
            'plugin_type': ('django.db.models.fields.CharField', [], {'max_length': '50', 'db_index': 'True'}),
            'position': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'rght': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'tree_id': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'})
        },
        'cms.placeholder': {
            'Meta': {'object_name': 'Placeholder'},
            'default_width': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'slot': ('django.db.models.fields.CharField', [], {'max_length': '50', 'db_index': 'True'})
        },
        u'cmsplugin_gallery.galleryplugin': {
            'Meta': {'object_name': 'GalleryPlugin', 'db_table': "u'cmsplugin_galleryplugin'", '_ormbases': ['cms.CMSPlugin']},
            u'cmsplugin_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['cms.CMSPlugin']", 'unique': 'True', 'primary_key': 'True'}),
            'fade_duration': ('django.db.models.fields.FloatField', [], {'default': "'1'"}),
            'slide_duration': ('django.db.models.fields.FloatField', [], {'default': "'3'"}),
            'template': ('django.db.models.fields.CharField', [], {'default': "'cmsplugin_gallery/gallery.html'", 'max_length': '255'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        u'cmsplugin_gallery.image': {
            'Meta': {'ordering': "('inline_ordering_position',)", 'object_name': 'Image'},
            'alt': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'extended_content': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'gallery': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['cmsplugin_gallery.GalleryPlugin']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'inline_ordering_position': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'link': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'}),
            'src': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'src_height': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True'}),
            'src_width': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['cmsplugin_gallery']