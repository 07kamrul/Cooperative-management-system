# Generated by Django 2.2.6 on 2020-12-18 18:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0008_auto_20201127_0015'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='relation',
            field=models.CharField(blank=True, default='', max_length=200),
        ),
    ]
