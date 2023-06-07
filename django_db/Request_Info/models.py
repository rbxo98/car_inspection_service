from django.db import models

class RequestInfo(models.Model):
    id=models.AutoField(primary_key=True)
    SNSKey=models.ForeignKey("User_Info.UserInfo",on_delete=models.CASCADE,max_length=45,db_column="SNSKey",related_name="RequestInfo",null=True,)
    MyCarID=models.IntegerField()
    PickupPlace=models.TextField()
    PickupTime=models.DateTimeField()
    Garage=models.TextField(null=True)
    CompleteTime = models.DateTimeField(null=True)
    ServiceCharge=models.IntegerField()
    ReturnPlace=models.TextField()
    Description=models.TextField()