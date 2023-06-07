from rest_framework import serializers

from Request_Info.models import RequestInfo
from User_AgentInfo.models import AgentInfo
from .models import ContractInfo

class ContractInfoSerializer(serializers.ModelSerializer):
    RequestInfoData = serializers.SerializerMethodField(method_name='get_RequestInfoData')
    AgentUserInfoData = serializers.SerializerMethodField(method_name='get_AgentUserInfoData')

    def get_RequestInfo(self, request):
        idx = self.context['request'].GET.get('RequestID')
        queryset = RequestInfo.objects.filter(id=idx)
        return queryset.values()

    def get_AgentUserInfoData(self, request):
        idx = self.context['request'].GET.get('AgentUserSNSKey')
        queryset = AgentInfo.objects.filter(SNSKey=idx)
        return queryset.values()
    class Meta:
        model = ContractInfo
        fields = '__all__'

