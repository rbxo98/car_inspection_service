from django.db import models

class ContractInfo(models.Model):
    id=models.AutoField(primary_key=True)
    AgentUserSNSKey=models.TextField()
    RequestInfoID=models.ForeignKey("Request_Info.RequestInfo",on_delete=models.CASCADE,db_column="RequestInfoID",related_name="RequestInfo",unique=True)
    CompleteTime=models.TextField(null=True)
    FinalPay=models.IntegerField(default=0,null=True)
    ReservationNum=models.IntegerField(null=True)
    PickedTime=models.DateTimeField(null=True)
    ContractProgress=models.IntegerField()