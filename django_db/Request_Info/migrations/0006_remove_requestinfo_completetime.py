# Generated by Django 4.1.6 on 2023-02-16 05:40

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Request_Info', '0005_alter_requestinfo_mycarid'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='requestinfo',
            name='CompleteTime',
        ),
    ]