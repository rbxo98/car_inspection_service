# Generated by Django 4.1.6 on 2023-03-08 06:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Contract_Info', '0006_remove_contractinfo_a'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contractinfo',
            name='ContractProgress',
            field=models.IntegerField(),
        ),
    ]
