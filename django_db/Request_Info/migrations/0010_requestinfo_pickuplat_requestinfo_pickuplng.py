# Generated by Django 4.1.6 on 2023-02-28 06:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Request_Info', '0009_alter_requestinfo_completetime'),
    ]

    operations = [
        migrations.AddField(
            model_name='requestinfo',
            name='PickupLat',
            field=models.FloatField(null=True),
        ),
        migrations.AddField(
            model_name='requestinfo',
            name='PickupLng',
            field=models.FloatField(null=True),
        ),
    ]
