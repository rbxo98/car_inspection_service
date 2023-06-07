from django.db import models

class UserInfo(models.Model):
    SNSKey=models.CharField(max_length=45,primary_key=True)
    Name=models.TextField()
    BirthDay=models.TextField()
    Tel=models.TextField()