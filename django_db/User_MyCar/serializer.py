from rest_framework import serializers

from .models import MyCar,MyCarImage

class MyCarSerializer(serializers.ModelSerializer):
    class Meta:
        model = MyCar
        fields = '__all__'

class MyCarImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = MyCarImage
        fields = '__all__'