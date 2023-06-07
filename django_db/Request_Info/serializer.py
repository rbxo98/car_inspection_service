from rest_framework import serializers
from .models import RequestInfo




class RequestInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = RequestInfo
        fields = '__all__'

class RequestInfoCarIDSerializer(serializers.ModelSerializer):
    class Meta:
        model = RequestInfo
        fields = ('MyCarID',)
