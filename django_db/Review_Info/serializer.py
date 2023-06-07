from rest_framework import serializers
from .models import ReviewInfo




class ReviewInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReviewInfo
        fields = '__all__'

