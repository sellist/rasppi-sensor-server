CREATE TABLE IF NOT EXISTS project (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS device (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS project_devices (
  project_id INT NOT NULL,
  device_id INT NOT NULL,
  PRIMARY KEY (project_id, device_id),
  FOREIGN KEY (project_id) REFERENCES project(id),
  FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE IF NOT EXISTS sense (
  id SERIAL PRIMARY KEY,
  device_id INT NOT NULL,
  temp FLOAT,
  humidity FLOAT,
  light FLOAT,
  voc FLOAT,
  uv FLOAT,
  gyro_x FLOAT,
  gyro_y FLOAT,
  gyro_z FLOAT,
  accel_x FLOAT,
  accel_y FLOAT,
  accel_z FLOAT,
  occurence_ts TIMESTAMP NOT NULL,
  insert_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE IF NOT EXISTS project_devices (
  project_id INT NOT NULL,
  device_id INT NOT NULL,
  PRIMARY KEY (project_id, device_id),
  FOREIGN KEY (project_id) REFERENCES project(id),
  FOREIGN KEY (device_id) REFERENCES device(id)
);



