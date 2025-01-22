from django.db import models

# Create your models here.
class login(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    usertype=models.CharField(max_length=100)


class user(models.Model):
    login=models.ForeignKey(login,on_delete=models.CASCADE)
    fname=models.CharField(max_length=100)
    lname=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    pin=models.CharField(max_length=100)
    post=models.CharField(max_length=100)
    hname=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    health_condition=models.CharField(max_length=100)



class ambulance(models.Model):
    login=models.ForeignKey(login,on_delete=models.CASCADE)
    vehicle_number=models.CharField(max_length=100)
    model_number=models.CharField(max_length=100)
    type=models.CharField(max_length=100)
    capacity=models.CharField(max_length=100)
    cardiac_monitor=models.CharField(max_length=100)
    defibrillator=models.CharField(max_length=100)
    oxygen=models.CharField(max_length=100)
    facilities=models.CharField(max_length=100)
    driver_name=models.CharField(max_length=100)


class amb_location(models.Model):
    ambulance=models.ForeignKey(ambulance,on_delete=models.CASCADE)
    datetime=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    latitude=models.CharField(max_length=100)
    longitude=models.CharField(max_length=100)
    status=models.CharField(max_length=100)



class emergency_request(models.Model):
    user=models.ForeignKey(user,on_delete=models.CASCADE)
    ambulance=models.ForeignKey(ambulance,on_delete=models.CASCADE)
    description=models.CharField(max_length=100)
    datetime=models.CharField(max_length=100)
    status=models.CharField(max_length=100)

    class Meta:
        db_table = 'ambulance_app_emergency_request'



class feedback(models.Model):
    user=models.ForeignKey(user,on_delete=models.CASCADE)
    date=models.CharField(max_length=100)
    feedback=models.CharField(max_length=100)


class hospital(models.Model):
    login=models.ForeignKey(login,on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    post=models.CharField(max_length=100)
    pin=models.CharField(max_length=100)
    city=models.CharField(max_length=100)
    district=models.CharField(max_length=100)
    photo=models.ImageField(upload_to='static/')
    phone=models.CharField(max_length=100)
    email=models.CharField(max_length=100)



class patient_data(models.Model):
    hospital=models.ForeignKey(hospital,on_delete=models.CASCADE)
    ambulance=models.ForeignKey(ambulance,on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    gender=models.CharField(max_length=100)
    pulse=models.CharField(max_length=100)
    sugar=models.CharField(max_length=100)
    blood_pressure=models.CharField(max_length=100)
    description=models.CharField(max_length=100)



class emergency_information(models.Model):
    hospital=models.ForeignKey(hospital,on_delete=models.CASCADE)
    ambulance=models.ForeignKey(ambulance,on_delete=models.CASCADE)
    info=models.CharField(max_length=100)
    date=models.CharField(max_length=100)
    time=models.CharField(max_length=100)

class message(models.Model):
    hospital=models.ForeignKey(hospital,on_delete=models.CASCADE)
    ambulance=models.ForeignKey(ambulance,on_delete=models.CASCADE)
    msg=models.CharField(max_length=100)
    date=models.CharField(max_length=100)
    time=models.CharField(max_length=100)