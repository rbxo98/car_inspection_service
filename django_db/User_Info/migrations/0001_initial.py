# Generated by Django 4.1.6 on 2023-02-13 02:53

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='UserInfo',
            fields=[
                ('SNSKey', models.CharField(max_length=45, primary_key=True, serialize=False)),
                ('Name', models.TextField()),
                ('BirthDay', models.TextField()),
                ('Tel', models.TextField()),
            ],
        ),
    ]
