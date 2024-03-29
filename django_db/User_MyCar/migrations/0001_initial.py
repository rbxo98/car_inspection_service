# Generated by Django 4.1.6 on 2023-02-13 04:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('User_Info', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='MyCar',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('Name', models.TextField()),
                ('CarNumber', models.TextField()),
                ('VehicleRegistrationCertificateURL', models.TextField()),
                ('isPermitted', models.BooleanField(default=False)),
                ('a', models.TextField(null=True)),
                ('SNSKey', models.ForeignKey(db_column='index', max_length=45, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='myCarInfo', to='User_Info.userinfo')),
            ],
        ),
    ]
