# Generated by Django 4.1.6 on 2023-02-14 02:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Request_Info', '0002_alter_requestinfo_snskey'),
    ]

    operations = [
        migrations.RenameField(
            model_name='requestinfo',
            old_name='SNSKey',
            new_name='SNSKey_id',
        ),
    ]
