from rest_framework import serializers

from User_AgentInfo.models import AgentInfo


class AgentInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = AgentInfo
        fields = '__all__'