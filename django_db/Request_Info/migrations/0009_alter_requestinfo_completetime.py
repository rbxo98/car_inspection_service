# Generated by Django 4.1.6 on 2023-02-28 04:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Request_Info', '0008_alter_requestinfo_pickuptime'),
    ]

    operations = [
        migrations.AlterField(
            model_name='requestinfo',
            name='CompleteTime',
            field=models.DateTimeField(null=True),
        ),
    ]
