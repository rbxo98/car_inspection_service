from rest_framework.response import Response

from .models import ReviewInfo
from .serializer import ReviewInfoSerializer
from rest_framework import viewsets


class ReviewInfoViews(viewsets.ModelViewSet):
    def get_queryset(self):
        queryset= ReviewInfo.objects.filter(ContractPostNum=self.request.query_params.get('PostNum'))
        return queryset

    def create(self, request, *args, **kwargs):
        serializer=self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=request.data)

    serializer_class = ReviewInfoSerializer
