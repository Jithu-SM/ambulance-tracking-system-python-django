# Generated by Django 3.2.22 on 2024-03-17 04:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ambulance_app', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='amb_location',
            name='status',
            field=models.CharField(default=1, max_length=100),
            preserve_default=False,
        ),
    ]
