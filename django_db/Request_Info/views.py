from rest_framework.response import Response

from .models import RequestInfo
from .serializer import RequestInfoSerializer
from rest_framework import viewsets


class RequestInfoViews(viewsets.ModelViewSet):
    def get_queryset(self):
        print(self.request.query_params.get('Time'))
        if self.request.query_params.get('Time')!=None:
            queryset= RequestInfo.objects.filter(PickupTime__range=[self.request.query_params.get('Time'), "2099-12-31 23:59"])
        else:
            queryset = RequestInfo.objects.all()
        return queryset

    def create(self, request, *args, **kwargs):
        serializer=self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=request.data)

    serializer_class = RequestInfoSerializer

'''


'''