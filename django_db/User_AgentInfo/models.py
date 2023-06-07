from django.db import models

class AgentInfo(models.Model):
    id=models.AutoField(primary_key=True)
    SNSKey=models.ForeignKey("User_Info.UserInfo",on_delete=models.CASCADE,max_length=45,db_column="SNSKey",related_name="AgentUserInfo",unique=True)
    LicenseURL=models.TextField(null=True)
    isPermitted=models.BooleanField(default=False)