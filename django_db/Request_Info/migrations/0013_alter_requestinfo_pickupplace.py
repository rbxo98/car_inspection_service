# Generated by Django 4.1.6 on 2023-02-28 08:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Request_Info', '0012_remove_requestinfo_pickuplat_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='requestinfo',
            name='PickupPlace',
            field=models.TextField(),
        ),
    ]
