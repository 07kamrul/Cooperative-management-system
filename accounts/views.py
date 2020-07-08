from django.forms import inlineformset_factory
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm

from .models import *
from .form import *


from django.contrib import messages

import datetime
from datetime import datetime, timedelta


# Create your views here.

#All User
def allUser(request):
    user = User.objects.all()
    print(user)
    context = {'user':user}
    return render(request, 'accounts/all_users.html', context)


#Register
def registerPage(request):
    form = CreateUserForm()


    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            user = form.cleaned_data.get('username')
            messages.success(request, 'Account was created for' + user)

            return redirect('all_user')

    context = {'form': form}
    return render(request, 'accounts/register.html', context)

#Login
def loginPage(request):
    context = {}
    return render(request, 'accounts/login.html', context)

#Logout
def logoutUser(request):
    context = {}
    return render(request, 'accounts/logout.html', context)




# Dashboard
def home(request):
    # return render(request, 'accounts/dashboard.html')

    # Last Month Amount Details
    # today = _datetime.date.today()
    # month = today.month - 1
    # print("Today")
    # print(today)
    # print(month)
    #
    # all_amount = Amount.objects.all()
    # amount_month = all_amount.filter(date)
    #
    # mm = amount_month.date
    # print(mm)
    #
    # # previous_month = datetime.now().month - 1
    # #
    # #
    # # if previous_month == 0:
    # #     previous_month = 12
    # #
    # #     print(previous_month)

    # all_amount = Amount.objects.all()
    # # amount_month = all_amount.filter(date)
    #
    # last_month = datetime.today() - timedelta(days=30)
    # amount_month = all_amount.objects.filter(date=last_month)
    #
    # print(amount_month)

    profile = Profile.objects.all()

    total_member = profile.count()

    amount = Amount.objects.all().order_by('date').reverse()

    pending = amount.filter(status='Pending')
    pendingCount = amount.filter(status='Pending').count()
    total_pending_amount = sum([item.amount for item in pending])

    complete = amount.filter(status='Complete')
    completeCount = amount.filter(status='Complete').count()
    total_complete_amount = sum([item.amount for item in complete])

    total_amount = sum([item.amount for item in amount])

    pendingAmountFunction = pendingAmounts(request)

    context = {'profile': profile, 'total_amount': total_amount, 'total_member': total_member, 'amount': amount,
               'total_complete_amount': total_complete_amount, 'total_pending_amount': total_pending_amount,
               'completeCount': completeCount, 'pendingCount': pendingCount,
               'pendingAmountFunction': pendingAmountFunction}

    return render(request, 'accounts/dashboard.html', context)


# Individual Profile
def profile(request, pk_test):
    profile = Profile.objects.get(id=pk_test)

    # total_amount = profile.amount_set.aggregate(amount=Sum('amount'))

    amountprofile = profile.amount_set.all()

    total_amount = sum([item.amount for item in amountprofile])

    pending = amountprofile.filter(status='Pending')
    complete_count = amountprofile.filter(status='Complete').count()

    total_pending = amountprofile.filter(status='Pending').count()

    if pending:
        total_pending_amount = sum([item.amount for item in pending])
    else:
        total_pending_amount = 0

    total_complete_amount = total_amount - total_pending_amount

    context = {'profile': profile, 'total_pending_amount': total_pending_amount,
               'total_complete_amount': total_complete_amount, 'total_pending': total_pending,
               'complete_count': complete_count}

    return render(request, 'accounts/profile.html', context)


# All Member's Amounts History
def amounts(request):
    profile = Profile.objects.all()

    total_member = profile.count()

    amount = Amount.objects.all().order_by('date').reverse()

    pending = amount.filter(status='Pending')
    pendingCount = amount.filter(status='Pending').count()
    total_pending_amount = sum([item.amount for item in pending])

    complete = amount.filter(status='Complete')
    completeCount = amount.filter(status='Complete').count()
    total_complete_amount = sum([item.amount for item in complete])

    total_amount = sum([item.amount for item in amount])

    context = {'profile': profile, 'total_amount': total_amount, 'total_member': total_member, 'amount': amount,
               'total_complete_amount': total_complete_amount, 'total_pending_amount': total_pending_amount,
               'completeCount': completeCount, 'pendingCount': pendingCount}

    return render(request, 'accounts/amounts.html', context)


# Individual Amounts History
def individualAmounts(request, pk):
    profile = Profile.objects.get(id=pk)

    # total_amount = profile.amount_set.aggregate(amount=Sum('amount'))

    amountprofile = profile.amount_set.all().order_by('date').reverse()

    total_amount = sum([item.amount for item in amountprofile])

    context = {'profile': profile, 'total_amount': total_amount, 'amountprofile': amountprofile}

    return render(request, 'accounts/individualAmount.html', context)


# Pending Amount History
def pendingAmounts(request):
    profile = Profile.objects.all()

    amount = Amount.objects.all().order_by('date').reverse()

    pending = amount.filter(status='Pending')

    total_pending = amount.filter(status='Pending').count()

    if pending:
        total_pending_amount = sum([item.amount for item in pending])
        pending_profile = amount.count()

    context = {'profile': profile, 'total_pending_amount': total_pending_amount, 'total_pending': total_pending,
               'pending_profile': pending_profile, 'amount': amount}

    return render(request, 'accounts/pending_amount.html', context)


# Individual Pending Amount History
def individualPendingAmounts(request, pk):
    profile = Profile.objects.get(id=pk)

    # total_amount = profile.amount_set.aggregate(amount=Sum('amount'))

    amountprofile = profile.amount_set.all().order_by('date').reverse()

    total_pending_count = amountprofile.filter(status='Pending').count()
    pending = amountprofile.filter(status='Pending')

    if pending:
        total_pending_amount = sum([item.amount for item in pending])

    else:
        total_pending_amount = 0

    context = {'profile': profile, 'total_pending_amount': total_pending_amount, 'amountprofile': amountprofile,
               'total_pending_count': total_pending_count}

    return render(request, 'accounts/individual_pending_amount.html', context)


# Individual Complete Amount History
def individualCompleteAmounts(request, pk):
    profile = Profile.objects.get(id=pk)

    # total_amount = profile.amount_set.aggregate(amount=Sum('amount'))

    amountprofile = profile.amount_set.all().order_by('date').reverse()

    total_complete_count = amountprofile.filter(status='Complete').count()

    complete = amountprofile.filter(status='Complete')

    if complete:
        total_complete_amount = sum([item.amount for item in complete])

    else:
        total_complete_amount = 0

    context = {'profile': profile, 'total_complete_amount': total_complete_amount, 'amountprofile': amountprofile,
               'total_complete_count': total_complete_count}

    return render(request, 'accounts/individual_complete_amount.html', context)


# Member History
def members(request):
    profile = Profile.objects.all()
    total_member = profile.count()

    pro = Profile.objects.values_list('id')

    # p_id = profile[i][j]
    # amount : (2,),(3,),

    habijabi = []

    print("********************************")
    for i in pro:
        for j in i:
            print("///////////////////////////")
            print(j)

            p = Profile.objects.get(id=j)

            profile_id = j
            name = p.name
            print("Name: " + name)
            phone = p.phone
            print("Phone: " + phone)
            joining_date = p.joining_date
            print(joining_date)

            print(p)

            # for p in profile:

            amounts = p.amount_set.all()
            print(amounts)
            print("Amounts")
            total_amount = sum([item.amount for item in amounts])

            pending = amounts.filter(status='Pending')
            print("Pending")
            print(pending)
            total_pending = sum([item.amount for item in pending])
            print("Total Pending")
            print(total_pending)

            complete = amounts.filter(status='Complete')
            print("Complete")
            print(complete)
            total_complete = sum([item.amount for item in complete])
            print("Total Complete")
            print(total_complete)

            total_pending_count = amounts.filter(status='Pending').count()
            print("Total Pending Count")
            print(total_pending_count)

            context = {'profile': profile, 'profile_id': profile_id, 'name': name, 'joining_date': joining_date,
                       'phone': phone, 'total_pending_count': total_pending_count, 'total_pending': total_pending,
                       'total_complete': total_complete, 'id': i}

            habijabi.append(context)

    print(habijabi)
    return render(request, 'accounts/members.html', {'profile_list': habijabi, 'total_member': total_member})


def createProfile(request, pk):
    profile = Profile.objects.get(id=pk)
    form = ProfileForm(instance=profile)

    if request.method == 'POST':
        form = ProfileForm(request.POST, instance=profile)

        if form.is_valid():
            form.save()
            # return redirect('/')

    context = {'form': form}
    return render(request, 'accounts/profile_form.html', context)


def updateProfile(request, pk):
    profile = Profile.objects.get(id=pk)
    form = ProfileForm(instance=profile)

    if request.method == 'POST':
        form = ProfileForm(request.POST, instance=profile)

        if form.is_valid():
            form.save()
            # return redirect('/')

    context = {'form': form}
    return render(request, 'accounts/profile_form.html', context)


def createAmount(request):
    form = AmountForm()

    if request.method == 'POST':
        form = AmountForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/amounts/')

    context = {'form': form}

    return render(request, 'accounts/create_amount.html', context)


def settings(request):
    context = {}
    return render(request, 'accounts/settings.html', context)


