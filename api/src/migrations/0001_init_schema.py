from django.db import migrations, models

class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Device',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='ProjectDevices',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('project', models.ForeignKey(on_delete=models.CASCADE, to='api.Project')),
                ('device', models.ForeignKey(on_delete=models.CASCADE, to='api.Device')),
            ],
        ),
        migrations.CreateModel(
            name='Sense',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('temp', models.FloatField(null=True)),
                ('humidity', models.FloatField(null=True)),
                ('light', models.FloatField(null=True)),
                ('voc', models.FloatField(null=True)),
                ('uv', models.FloatField(null=True)),
                ('gyro_x', models.FloatField(null=True)),
                ('gyro_y', models.FloatField(null=True)),
                ('gyro_z', models.FloatField(null=True)),
                ('accel_x', models.FloatField(null=True)),
                ('accel_y', models.FloatField(null=True)),
                ('accel_z', models.FloatField(null=True)),
                ('occurence_ts', models.DateTimeField()),
                ('insert_ts', models.DateTimeField(auto_now_add=True)),
                ('device', models.ForeignKey(on_delete=models.CASCADE, to='api.Device')),
            ],
        ),
    ]