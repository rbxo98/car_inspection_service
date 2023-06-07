from django.db import models
from User_Info.models import UserInfo

class MyCar(models.Model):
    id=models.AutoField(primary_key=True)
    SNSKey=models.ForeignKey("User_Info.UserInfo",on_delete=models.CASCADE,max_length=45,db_column="SNSKey",related_name="myCarInfo",null=True)
    Name=models.TextField()
    CarNumber=models.TextField()
    VehicleRegistrationCertificateURL=models.TextField(null=True)
    isPermitted=models.BooleanField(default=False)

class MyCarImage(models.Model):
    VehicleRegistrationCertificateImg=models.ImageField(null=True)