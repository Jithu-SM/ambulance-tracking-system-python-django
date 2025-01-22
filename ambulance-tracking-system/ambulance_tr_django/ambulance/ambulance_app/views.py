from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from ambulance_app.models import *
# Create your views here.
    # def home(request):
    #     return render(request,'index.html')




def and_login(request):
    if 'submit' in request.POST : 
        username=request.POST['username']
        password=request.POST['password']
        if login.objects.filter(username=username,password=password).exists():
            q1=login.objects.get(username=username,password=password) 
            request.session['lid']=q1.pk
            request.session['utype']=q1.usertype
            if q1.usertype=='admin':
                return HttpResponse("<script>alert('succesfully logged in');window.location='/adminhome'</script>")
            elif q1.usertype=='hospital':
                q2=hospital.objects.get(login_id=request.session['lid'])  
                if q2:
                    request.session['hid']=q2.pk
                    return HttpResponse("<script>alert('succesfully logged in');window.location='/hospital_home'</script>")
            elif q1.usertype=='ambulance':
                q2=ambulance.objects.get(login_id=request.session['lid'])  
                if q2:
                    request.session['aid']=q2.pk
                    return HttpResponse("<script>alert('succesfully logged in');window.location='/amb_home'</script>")
           
           
            # elif q1.User_Type=='Customer':
            #     q3=tbl_Customer.objects.get(USERNAME_id=request.session['lid'])
            #     if q3:
            #         request.session['cid']=q3.pk
            #     return HttpResponse("<script>alert('succesfully logged in');window.location='/customer_home'</script>")
            # elif q1.User_Type=='Field Staff':
            #     q3=tbl_Staff.objects.get(USERNAME_id=request.session['lid'],Staff_Status='active')
            #     if q3:
            #         request.session['pro'] = q3.Staff_Photo.url if q3.Staff_Photo else None
            #         print( request.session['pro'])
            #         request.session['fid']=q3.pk
            #         request.session['fname']=q3.Staff_Fname
            #     return HttpResponse("<script>alert('succesfully logged in');window.location='/fstaff_home'</script>")
        else:
            return HttpResponse("<script>alert('invalid crediantials');window.location='/login'</script>")
  
    return render(request,'public/login.html')




def adminhome(request):
    return render(request,'admin/adminhome.html')



def hospital_home(request):
    return render(request,'hospital/hospital_home.html')


def amb_home(request):
    return render(request,'ambulance/amb_home.html')


def manage_hospital(request):
    q3=hospital.objects.all()
    if 'submit' in request.POST :
        # username=request.POST['username']
        password=request.POST['password']
        name=request.POST['name']
        place=request.POST['place']
        post=request.POST['post']
        pin=request.POST['pin']
        city=request.POST['city']
        district=request.POST['district']
        photo=request.FILES['photo']
        phone=request.POST['phone']
        email=request.POST['email']
        # Gender=request.POST['Gender']

        q4=login(username=email,password=password,usertype='hospital')
        q4.save()
        q2=hospital(name=name,place=place,post=post,pin=pin,
                     city=city,district=district,photo=photo,phone=phone,
                     email=email,login_id=q4.pk)
        q2.save()
        return HttpResponse("<script>alert('Successfully Signed up');window.location='/manage_hospital'</script>")
    
    return render(request,'admin/manage_hospital.html',{'q3':q3})
        
def update_hospital(request,id):
    q2=hospital.objects.get(id=id)
    if 'submit' in request.POST :
        name=request.POST['name']
        place=request.POST['place']
        post=request.POST['post']
        pin=request.POST['pin']
        city=request.POST['city']
        district=request.POST['district']
        photo=request.FILES['photo']
        phone=request.POST['phone']
        email=request.POST['email']

        
        q2.name=name
        q2.place=place
        q2.post=post
        q2.pin=pin
        q2.city=city
        q2.district=district
        q2.photo=photo
        q2.phone=phone
        q2.email=email
        q2.save()
        return HttpResponse("<script>alert('Successfully Signed up');window.location='/manage_hospital'</script>")
    return render(request,'admin/manage_hospital.html',{"q2":q2})


def delete_hospital(request,id):
    q2=hospital.objects.get(id=id)
    q2.delete()
    return HttpResponse("<script>alert('Deleted');window.location='/manage_hospital'</script>")



def ambulance_reg(request):
    q3=ambulance.objects.all()
    if 'submit' in request.POST :
        username=request.POST['username']
        password=request.POST['password']
        vehicle_number=request.POST['vehicle_number']
        model_number=request.POST['model_number']
        type=request.POST['type']
        capacity=request.POST['capacity']
        cardiac_monitor=request.POST['cardiac_monitor']
        defibrillator=request.POST['defibrillator']
        oxygen=request.POST['oxygen']
        facilities=request.POST['facilities']
        driver_name=request.POST['driver_name']

        q4=login(username=username,password=password,usertype='ambulance')
        q4.save()
        q2=ambulance(vehicle_number=vehicle_number,model_number=model_number,type=type,capacity=capacity,
                     cardiac_monitor=cardiac_monitor,defibrillator=defibrillator,oxygen=oxygen,facilities=facilities,
                     driver_name=driver_name,login_id=q4.pk)
        q2.save()
        return HttpResponse("<script>alert('Successfully Signed up');window.location='/ambulance_reg'</script>")
        
    
    return render(request,'admin/ambulance_reg.html',{'q3':q3})


def ambulance_location(request):
    q=amb_location.objects.all()
    return render(request,'admin/ambulance_location.html',{'q':q})

def view_feedback(request):
    q=feedback.objects.all()
    return render(request,'admin/view_feedback.html',{'q':q})


# adminnnnnn
from datetime import datetime
def emg_info(request):
    q=emergency_information.objects.filter(hospital_id=request.session['hid'])
    return render(request,'hospital/emg_info.html',{'q':q})

def send_msg(request):
    q=message.objects.filter(hospital_id=request.session['hid'])
    w=ambulance.objects.all()
    if 'submit' in request.POST:
        msg=request.POST['msg']
        aid=request.POST['aid']
        qi=message(msg=msg,hospital_id=request.session['hid'],ambulance_id=aid,date=datetime.now().date(),time=datetime.now().time())
        qi.save()
        return HttpResponse("<script>alert('success');window.location='/hospital_home'</script>")
    return render(request,'hospital/send_msg.html',{'q':q,'w':w})

def view_patient(request):
    q=patient_data.objects.filter(hospital_id=request.session['hid'])
    return render(request,'hospital/view_patient.html',{'q':q})
# hospital

def view_message(request):
    q=emergency_request.objects.filter(ambulance_id=request.session['aid'])
    return render(request,'ambulance/view_message.html',{'q':q})

def sent_patient(request):
    w=hospital.objects.all()
    q=patient_data.objects.filter(ambulance_id=request.session['aid'])
    if 'submit' in request.POST:
        hid=request.POST['hid']
        name=request.POST['name']
        gender=request.POST['gender']
        pulse=request.POST['pulse']
        sugar=request.POST['sugar']
        blood_pressure=request.POST['blood_pressure']
        description=request.POST['description']
        qi=patient_data(name=name,gender=gender,pulse=pulse,sugar=sugar,blood_pressure=blood_pressure,description=description,ambulance_id=request.session['aid'],hospital_id=hid)
        qi.save()
        return HttpResponse("<script>alert('Added');window.location='/sent_patient'</script>")
    return render(request,'ambulance/sent_patient.html',{'q':q,'w':w})

def delete_patient(request,id):
    q=patient_data.objects.get(id=id)
    q.delete()
    return HttpResponse("<script>alert('Deleted');window.location='/sent_patient'</script>")

def sent_emergency(request):
    w=hospital.objects.all()
    if 'submit' in request.POST:
        hid=request.POST['hid']
        info=request.POST['info']
        q=emergency_information(info=info,hospital_id=hid,ambulance_id=request.session['aid'],date=datetime.now().date(),time=datetime.now().time())
        q.save()
        return HttpResponse("<script>alert('Send');window.location='/sent_emergency'</script>")
    return render(request,'ambulance/sent_emergency.html',{'w':w})


def update_status(request):
    if 'submit' in request.POST:
        latitude=request.POST["latitude"]
        longitude=request.POST["longitude"]
        place=request.POST["place"]
        q=amb_location(latitude=latitude,longitude=longitude,place=place,status='active',ambulance_id=request.session['aid'])
        q.save()
        return HttpResponse("<script>alert('success');window.location='/update_status'</script>")
    return render(request,'ambulance/update_status.html')

def sent_request(request):
    aid=request.POST['aid']
    uid=request.POST['uid']
    des=request.POST['des']
    q=emergency_request(ambulance_id=aid,user_id=uid,description=des,datetime=datetime.now())
    q.save()
    return JsonResponse({"status":"ok"})

def sent_feedback(request):
    uid=request.POST['uid']
    feedback1=request.POST['msg']
    q=feedback(user_id=uid,feedback=feedback1,date=datetime.now().date())
    q.save()
    return JsonResponse({"status":"ok"})


def view_ambulance(request):
    a=[]
    q=amb_location.objects.all()
    for i in q:
        a.append({"id":i.ambulance_id,"dname":i.ambulance.driver_name,"vehicleno":i.ambulance.vehicle_number,"model":i.ambulance.model_number,"type":i.ambulance.type,"capacity":i.ambulance.capacity,"latitude":i.latitude,"longitude":i.longitude,"place":i.place})
    
    return JsonResponse({"q":a,"status":"ok"})


def user_login(request):
    username = request.POST['uname']
    password = request.POST['psw']
    if login.objects.filter(username=username,password=password).exists():
        qa = login.objects.get(username=username,password=password)
        lid=qa.pk
        if qa.usertype == 'user':
            q = user.objects.get(login_id=lid)
            if q:
                uid=q.pk
                return JsonResponse({'status':'ok','lid':lid,'uid':uid,"usertype":"user"})
    else:
        return JsonResponse({'status':'no'})
    

def registration(request):
    fname=request.POST['fname']
    lname=request.POST['lname']
    hname=request.POST['hname']
    uname=request.POST['username']
    psw=request.POST['password']
    pin=request.POST['pin']
    phone=request.POST['phone']
    email=request.POST['email']
    post=request.POST['post']
    place=request.POST['place']
    health_condition=request.POST['health_condition']
    q=login(username=uname,password=psw,usertype='user')
    q.save()
    qi=user(fname=fname,lname=lname,hname=hname,pin=pin,post=post,email=email,place=place,login_id=q.pk,health_condition=health_condition,phone=phone)
    qi.save()
    return JsonResponse({'status': 'ok'})