from.import views
from ambulance_app.views import *
from django.contrib import admin
from django.urls import path

urlpatterns = [
    # path('',views.home),
    path('',views.and_login),
    path('login',views.and_login),
    path('adminhome',views.adminhome),
    path('manage_hospital',views.manage_hospital),
    path('update_hospital/<id>',views.update_hospital),
    path('delete_hospital/<id>',views.delete_hospital),
    path('ambulance_reg',views.ambulance_reg),
    path('ambulance_location',views.ambulance_location),
    path('view_feedback',views.view_feedback),
    path('emg_info',views.emg_info),
    path('send_msg',views.send_msg),
    path('view_patient',views.view_patient),
    path('view_message',views.view_message),
    path('sent_patient',views.sent_patient),
    path('delete_patient/<id>',views.delete_patient),
    path('sent_emergency',views.sent_emergency),
    path('user_login',views.user_login),
    path('registration',views.registration),
    path('view_ambulance',views.view_ambulance),
    path('send_request',views.sent_request),
    path('send_feedback',views.sent_feedback),
    path('hospital_home',views.hospital_home),
    path('amb_home',views.amb_home),
    path('update_status',views.update_status),
    
]
