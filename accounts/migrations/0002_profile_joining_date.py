# Generated by Django 2.2.6 on 2020-06-28 17:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='joining_date',
            field=models.DateField(blank=True, null=True),
        ),
    ]