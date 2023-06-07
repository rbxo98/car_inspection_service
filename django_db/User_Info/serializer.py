from rest_framework import serializers

from Request_Info.models import RequestInfo
from User_MyCar.models import MyCar
from User_Info.models import UserInfo


class UserInfoSerializer(serializers.ModelSerializer):
    RequestInfo = serializers.SerializerMethodField(method_name='get_RequestInfo',allow_null=True)
    myCarInfo = serializers.SerializerMethodField(method_name='get_myCarInfo',allow_null=True)

    def get_RequestInfo(self,request):
        idx=self.context['request'].GET.get('RequestID')
        queryset=RequestInfo.objects.filter(id=idx)
        return queryset.values()

    def get_myCarInfo(self,request):
        idx = self.context['request'].GET.get('MyCarID')
        queryset = MyCar.objects.filter(id=idx)
        return queryset.values()

    class Meta:
        model = UserInfo
        fields = '__all__'
