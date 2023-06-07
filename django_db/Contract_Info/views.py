from rest_framework.response import Response

from .models import ContractInfo
from .serializer import ContractInfoSerializer
from rest_framework import viewsets


class ContractInfoViews(viewsets.ModelViewSet):
    def get_queryset(self):
        queryset= ContractInfo.objects.filter(id=self.request.query_params.get('PostNum'))
        return queryset

    def create(self, request, *args, **kwargs):
        serializer=self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=request.data)

    serializer_class = ContractInfoSerializer
