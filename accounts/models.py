from django.db import models
from django.contrib.auth.models import User

from datetime import datetime, date

# Create your models here.
from pylint.checkers.typecheck import _


class Profile(models.Model):
    GENDER_STATUS = (
        ('Male', 'Male'),
        ('Female', 'Female'),
    )
    MARITAL_STATUS = (
        ('Single', 'Single'),
        ('Married', 'Married'),
    )
    RELIGION_STATUS = (
        ('Islam', 'Islam'),
        ('Hindu', 'Hindu'),
    )

    user = models.OneToOneField(User, null=True, blank=True, on_delete=models.CASCADE)
    name = models.CharField(max_length=200, null=True)
    profile_pic = models.ImageField(default="profile.jpg", null=True, blank=True)
    joining_date = models.DateField(auto_now_add=False, auto_now=False, null=True, blank=True)

    father_name = models.CharField(max_length=200, null=True)
    mother_name = models.CharField(max_length=200, null=True)
    nationality = models.CharField(max_length=200, null=True)
    gender = models.CharField(max_length=200, null=True, choices=GENDER_STATUS)

    occupation = models.CharField(max_length=200, null=True, blank=True)
    nid = models.CharField(max_length=200, null=True, blank=True)
    member_id = models.IntegerField(default=0, null=True, blank=True)
    phone = models.CharField(max_length=200, null=True, blank=True)
    email = models.CharField(max_length=200, null=True, blank=True)

    dob = models.DateField(auto_now_add=False, auto_now=False, null=True, blank=True)

    marital_status = models.CharField(max_length=200, null=True, choices=MARITAL_STATUS)
    religion = models.CharField(max_length=200, null=True, choices=RELIGION_STATUS)

    permanent_address = models.CharField(max_length=200, null=True, blank=True)
    present_address = models.CharField(max_length=200, null=True, blank=True)


    nominee_name = models.CharField(max_length=200, null=True, blank=True)
    relation = models.CharField(max_length=200, null=True, blank=True)
    nominee_father_name = models.CharField(max_length=200, null=True, blank=True)
    nominee_mother_name = models.CharField(max_length=200, null=True, blank=True)
    nominee_phone = models.CharField(max_length=15, null=True, blank=True)

    nominee_dob = models.DateField(auto_now_add=False, auto_now=False, null=True, blank=True)


    nominee_gender = models.CharField(max_length=200, null=True, choices=GENDER_STATUS)
    nominee_marital_status = models.CharField(max_length=200, null=True, choices=MARITAL_STATUS)
    nominee_religion = models.CharField(max_length=200, null=True, choices=RELIGION_STATUS)
    nominee_nid = models.CharField(max_length=200, null=True, blank=True)
    nominee_present_address = models.CharField(max_length=200, null=True, blank=True)
    nominee_permanent_address = models.CharField(max_length=200, null=True, blank=True)


    account_no = models.CharField(max_length=200, null=True, blank=True)
    bank_name = models.CharField(max_length=200, null=True, blank=True)
    branch_address = models.CharField(max_length=200, null=True, blank=True)


    def __str__(self):
        return self.name




class Amount(models.Model):
    STATUS = (
        ('Pending', 'Pending'),
        ('Complete', 'Complete'),
    )
    profile = models.ForeignKey(Profile, null=True, on_delete=models.SET_NULL)
    date = models.DateField(auto_now_add=True, auto_now=False, null=True, blank=True)
    amount = models.IntegerField(default=0, null=True, blank=True)
    status = models.CharField(max_length=200, null=True, choices=STATUS)

    def __str__(self):
        return self.profile.name


    #
    # @property
    # def get_total_amount(self):
    #     amountprofile = self.amount_set.all()
    #     total_amount = sum([item.amount for item in amountprofile])
    #     return total_amount

# no need

class Member(models.Model):
    profile = models.ForeignKey(Profile, null=True, on_delete=models.SET_NULL)
    amount = models.ForeignKey(Amount, null=True, on_delete=models.SET_NULL)
    activity = models.CharField(max_length=1000, null=True)

    def __str__(self):
        return self.profile.name

    # @property
    # def get_amount(self):
    #     amounts = self.amount
    #
    #     return amounts


