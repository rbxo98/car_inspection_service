from django.core.files.storage import FileSystemStorage
from rest_framework import viewsets
from rest_framework.response import Response

from .models import AgentInfo
from .serializer import AgentInfoSerializer


class AgentInfoViews(viewsets.ModelViewSet):
    def get_queryset(self):
        params = self.request.query_params

        if params.get('SNSKey') != None and params.get('permit') != None:
            queryset = AgentInfo.objects.filter(SNSKey=params.get('SNSKey'),isPermitted=params.get('permit'))
            print(1)
        elif params.get('SNSKey'):
            queryset = AgentInfo.objects.filter(SNSKey=params.get('SNSKey'))
        else:
            queryset = AgentInfo.objects.all()
        return queryset

    def create(self, request, *args, **kwargs):
        print(request.data)
        imageData = request.FILES['LicenseImg']
        fs = FileSystemStorage()
        fs.save(request.data['LicenseURL'], imageData)
        data = request.data
        del data['LicenseImg']
        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=request.data)

    serializer_class = AgentInfoSerializer
