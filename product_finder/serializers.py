from rest_framework import serializers
from .models import Product, ProductCategory

class ProductSerializer(serializers.ModelSerializer):

    class Meta:
        model = Product
        fields = ('category', 'id', 'description', 'slug', 'front_img', 'back_img', 'ortho_img', 'download_file')


class ProductCategorySerializer(serializers.ModelSerializer):
    choices = ProductSerializer(many=True)

    class Meta:
        model = ProductCategory
        fields = ('title', 'slug', 'id', 'ordering', 'img')