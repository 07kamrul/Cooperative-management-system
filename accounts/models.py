from django.db import models
from django.contrib.auth.models import User
import datetime

from datetime import datetime, date
from django.utils import timezone

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
    OCCUPATION_STATUS = (
        ('Govt.','Govt.'),
        ('Semi Govt.','Semi Govt.'),
        ('Service','Service'),
        ('Business','Business'),
        ('Student','Student'),
        ('House Wife','House Wife'),
    )
    MEMBER_STATUS = (
        ('Active','Active'),
        ('Left','Left'),
    )


    user = models.OneToOneField(User, null=True, blank=True, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=200, null=True)
    last_name = models.CharField(max_length=200, null=True)
    name = models.CharField(max_length=200, null=True)
    profile_pic = models.ImageField(default="profile.jpg", null=True, blank=True)
    joining_date = models.DateField(auto_now_add=False, auto_now=False, null=True,)

    father_name = models.CharField(max_length=200, blank=True,default="")
    mother_name = models.CharField(max_length=200, blank=True,default="")
    nationality = models.CharField(max_length=200, blank=True,default="")

    gender = models.CharField(max_length=200, choices=GENDER_STATUS,default="")

    occupation = models.CharField(max_length=200, choices=OCCUPATION_STATUS,default="")
    designation = models.CharField(max_length=200, blank=True,default="")
    company = models.CharField(max_length=200,  blank=True,default="")

    nid = models.CharField(max_length=200,default="" )
    member_id = models.IntegerField(default=0)
    phone = models.CharField(max_length=200,default="" )
    email = models.CharField(max_length=200,default="" )

    dob = models.DateField(auto_now_add=False,null=True, auto_now=False )

    marital_status = models.CharField(max_length=200,default="", choices=MARITAL_STATUS)
    religion = models.CharField(max_length=200,default="", choices=RELIGION_STATUS)

    permanent_address = models.CharField(max_length=200,default="",  blank=True)
    present_address = models.CharField(max_length=200,default="",  blank=True)

    status = models.CharField(max_length=200, default="", choices=MEMBER_STATUS)
    # left_date = models.DateField(validators=validateLeft)

    #Nominee

    nominee_name = models.CharField(max_length=200,default="" )
    relation = models.CharField(max_length=200,default="", blank=True)
    nominee_father_name = models.CharField(max_length=200,default="", blank=True)
    nominee_mother_name = models.CharField(max_length=200,default="", blank=True)
    nominee_phone = models.CharField(max_length=15,default="", blank=True)
    nominee_dob = models.DateField(auto_now_add=False, auto_now=False, null=True,  blank=True)
    nominee_gender = models.CharField(max_length=200,default="", choices=GENDER_STATUS)
    nominee_marital_status = models.CharField(max_length=200,default="", choices=MARITAL_STATUS)
    nominee_religion = models.CharField(max_length=200,default="", choices=RELIGION_STATUS)
    nominee_nid = models.CharField(max_length=200,default="", blank=True)
    nominee_present_address = models.CharField(max_length=200,default="",  blank=True)
    nominee_permanent_address = models.CharField(max_length=200 ,default="", blank=True)

    #Bank

    account_no = models.CharField(max_length=200, default="", blank=True)
    bank_name = models.CharField(max_length=200, default="", blank=True)
    branch_address = models.CharField(max_length=200,default="", blank=True)


    # def __str__(self):
    #     return self.name
        # return self.user.username

    # def validateLeft(self):
    #     if self.status == 'Left':
    #         self.left_date

    # def _get_full_name(self):
    #     return '%s %s' % (self.first_name, self.last_name)  # Returns the person's full name.
    #
    # name = property(_get_full_name)

    # def __unicode__(self):
    #     return self.name
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




class TotalCost(models.Model):
    date = models.DateField(auto_now_add=True, auto_now=False, null=True, blank=True)
    title = models.CharField(max_length=200, null=True, blank=True)
    description = models.CharField(max_length=200, null=True, blank=True)
    amount = models.IntegerField(default=0, null=True, blank=True)


    def __str__(self):
        return self.title





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


class Deposite(models.Model):
    profile = models.ForeignKey(Profile, null=True, on_delete=models.SET_NULL)
    date = models.DateField(auto_now_add=True, auto_now=False, null=True, blank=True)
    amount = models.IntegerField(default=0, null=True, blank=True)
    diposite_pic = models.ImageField(default="diposite.jpg", null=True, blank=True)

    def __str__(self):
        return self.profile.name