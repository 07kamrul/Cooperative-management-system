from django.urls import path
from . import views

urlpatterns = [
    path('register/', views.registerPage, name="register"),
    path('login/', views.loginPage, name="login"),
    path('logout/', views.logoutUser, name="logout"),

    path('', views.home),

    # url(r'^User/(?P<userid>\d+)/$', 'search.views.user_detail', name='user_details'),

    path('members/', views.members, name="members"),
    path('profile/<str:pk_test>/', views.profile, name="profile"),
    path('update_profile/<str:pk>/', views.updateProfile, name="update_profile"),

    path('amounts/', views.amounts, name="amounts"),
    path('individual_amount/<str:pk>/', views.individualAmounts, name="individual_amount"),

    path('pending_amount/', views.pendingAmounts, name="pending_amount"),

    path('individual_pending_amount/<str:pk>/', views.individualPendingAmounts, name="individual_pending_amount"),

    path('individual_complete_amount/<str:pk>/', views.individualCompleteAmounts, name="individual_complete_amount"),

    path('settings/', views.settings, name="settings"),

    path('create_amount/', views.createAmount, name="create_amount"),



    path('all_user/', views.allUser, name="all_user"),

]
