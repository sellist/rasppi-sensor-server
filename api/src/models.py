from django.db import models

class Project(models.Model):
    name = models.TextField()

class Device(models.Model):
    name = models.TextField()

class ProjectDevices(models.Model):
    project = models.ForeignKey(Project, on_delete=models.CASCADE)
    device = models.ForeignKey(Device, on_delete=models.CASCADE)

class Sense(models.Model):
    device = models.ForeignKey(Device, on_delete=models.CASCADE)
    temp = models.FloatField(null=True)
    humidity = models.FloatField(null=True)
    light = models.FloatField(null=True)
    voc = models.FloatField(null=True)
    uv = models.FloatField(null=True)
    gyro_x = models.FloatField(null=True)
    gyro_y = models.FloatField(null=True)
    gyro_z = models.FloatField(null=True)
    accel_x = models.FloatField(null=True)
    accel_y = models.FloatField(null=True)
    accel_z = models.FloatField(null=True)
    occurence_ts = models.DateTimeField()
    insert_ts = models.DateTimeField(auto_now_add=True)