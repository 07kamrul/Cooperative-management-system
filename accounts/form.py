from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User, Group
from django import forms

from .models import *


class ProfileForm(ModelForm):
    class Meta:
        model = Profile
        fields = '__all__'
        exclude = ['user']

class AmountForm(ModelForm):
    class Meta:
        model = Amount
        fields = '__all__'

class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2']


class UpdateUserForm(ModelForm):
    class Meta:
        model = User
        fields = ['username','is_staff','is_active','is_superuser']


class CreateProfileForm(ModelForm):
    class Meta:
        model = Profile
        fields = '__all__'


class CostForm(ModelForm):
    class Meta:
        model = TotalCost
        fields = '__all__'


class DepositeForm(ModelForm):
    class Meta:
        model = Deposite
        fields = '__all__'

class PersonalInformationForm(ModelForm):
    class Meta:
        model = Profile
        fields = ['father_name','mother_name','nid','phone','email','marital_status','occupation','designation','company','permanent_address','present_address']


class NomineeInformationForm(ModelForm):
    class Meta:
        model = Profile
        fields = ['nominee_name','relation','nominee_father_name','nominee_mother_name','nominee_phone','nominee_dob','nominee_gender','nominee_marital_status','nominee_religion','nominee_nid','nominee_present_address','nominee_permanent_address']


class BankInformationForm(ModelForm):
    class Meta:
        model = Profile
        fields = ['account_no','bank_name','branch_address']
