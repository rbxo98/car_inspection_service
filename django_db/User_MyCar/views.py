from django.core.files.storage import FileSystemStorage
from rest_framework.response import Response

from .models import MyCar
from .serializer import MyCarSerializer,MyCarImageSerializer
from rest_framework import viewsets
from PIL import Image


class MyCarInfoViews(viewsets.ModelViewSet):
    def get_queryset(self):
        print(4)
        if self.request.query_params.get('id') != None:
            queryset = MyCar.objects.filter(id=self.request.query_params.get('id'))
            return queryset
        if self.request.query_params.get('SNSKey') != None:
            print(3)
            if self.request.query_params.get('permit') != None:
                print(self.request.query_params.get('permit'))
                queryset = MyCar.objects.filter(SNSKey=self.request.query_params.get('SNSKey'),isPermitted=self.request.query_params.get('permit'))
            else:
                print(1)
                queryset = MyCar.objects.filter(SNSKey=self.request.query_params.get('SNSKey'))
            return queryset

    def create(self, request, *args, **kwargs):
        print(request.data)
        imageData=request.FILES['VehicleRegistrationCertificateImg']
        fs = FileSystemStorage()
        fs.save(request.data['VehicleRegistrationCertificateURL'],imageData)
        data=request.data
        del data['VehicleRegistrationCertificateImg']
        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=request.data)

    serializer_class = MyCarSerializer
