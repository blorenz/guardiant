from rest_framework import generics, permissions
from .models import Product, ProductCategory
from .serializers import ProductCategorySerializer, ProductSerializer
from django.shortcuts import render, get_object_or_404


class ProductList(generics.ListAPIView):
    model = Product
    serializer_class = ProductSerializer
    lookup_field = 'slug'
    permission_classes = [permissions.AllowAny]

class ProductDetail(generics.RetrieveAPIView):
    model = Product
    serializer_class = ProductSerializer
    lookup_field = 'slug'
    permission_classes = [permissions.AllowAny]

    # def get_object(self):
    #     queryset = self.get_queryset()
    #     filter = {}
    #     for field in self.multiple_lookup_fields:
    #         filter[field] = self.kwargs[field]
    #
    #     obj = get_object_or_404(queryset, **filter)
    #     self.check_object_permissions(self.request, obj)
    #     return obj

class ProductCategoryList(generics.ListAPIView):
    model = ProductCategory
    serializer_class = ProductCategorySerializer
    permission_classes = [
        permissions.AllowAny
    ]

def index(request):
    return render(request, 'product_finder/index.html')