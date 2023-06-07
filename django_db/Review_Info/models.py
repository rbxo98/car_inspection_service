from django.db import models

class ReviewInfo(models.Model):
    id=models.AutoField(primary_key=True)
    ContractPostNum=models.ForeignKey("Contract_Info.ContractInfo", on_delete=models.CASCADE, db_column="PostNum",related_name="ContractInfo" )
    Content=models.TextField(null=True)
    Date=models.TextField()
    StarRating=models.IntegerField()
    WriteType=models.IntegerField()
