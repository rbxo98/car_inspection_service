# Generated by Django 4.1.6 on 2023-02-16 05:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('User_AgentInfo', '0002_alter_agentinfo_snskey'),
    ]

    operations = [
        migrations.AlterField(
            model_name='agentinfo',
            name='SNSKey',
            field=models.CharField(max_length=45),
        ),
    ]