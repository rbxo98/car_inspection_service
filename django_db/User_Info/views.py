from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets
from rest_framework.response import Response

from Request_Info.models import RequestInfo
from .models import UserInfo
from .serializer import UserInfoSerializer
from User_MyCar.models import MyCar


class UserInfoViews(viewsets.ModelViewSet):
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['SNSKey', 'RequestInfo__id']
    queryset = UserInfo.objects.all()

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=request.data)

    serializer_class = UserInfoSerializer
