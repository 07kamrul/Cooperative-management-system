# Generated by Django 2.2.6 on 2020-06-30 05:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0002_profile_joining_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='amount',
            name='date',
            field=models.DateField(blank=True, null=True),
        ),
    ]
