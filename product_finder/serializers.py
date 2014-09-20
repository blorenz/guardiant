from rest_framework import serializers
from .models import Product, ProductCategory

class ProductSerializer(serializers.ModelSerializer):
    category_slug = serializers.CharField(source='category.slug')

    class Meta:
        model = Product
        fields = ('name', 'category', 'category_slug', 'id', 'description', 'slug', 'front_img', 'back_img', 'ortho_img', 'download_file')


class ProductCategorySerializer(serializers.ModelSerializer):
    choices = ProductSerializer(many=True)

    class Meta:
        model = ProductCategory
        fields = ('title', 'slug', 'id', 'ordering', 'img')