# Generated by Django 4.1.6 on 2023-03-14 03:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('User_MyCar', '0002_remove_mycar_a_alter_mycar_snskey_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='MyCarImage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('VehicleRegistrationCertificateImg', models.ImageField(null=True, upload_to='')),
            ],
        ),
    ]
