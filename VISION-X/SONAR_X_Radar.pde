
import processing.serial.*;

Serial myPort;

int angle = 0;
float distance = 0;

int maxDistance = 200;

void setup() {
  size(1000, 700);
  smooth();

  println(Serial.list());

  // Select the Arduino serial port
  myPort = new Serial(this, "/dev/cu.usbmodemFX2348N1", 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  background(0);

  translate(width / 2, height - 60);

  drawRadar();
  drawDetection();
  drawInfo();
}

void serialEvent(Serial port) {
  String data = port.readStringUntil('\n');

  if (data != null) {
    data = trim(data);

    if (data.equals("SONAR-X STARTED") ||
        data.equals("ANGLE,DISTANCE")) {
      return;
    }

    String[] values = split(data, ',');

    if (values.length == 2) {
      try {
        angle = int(values[0]);
        distance = float(values[1]);
      }
      catch (Exception e) {
        println("Invalid sensor data: " + data);
      }
    }
  }
}

void drawRadar() {
  stroke(0, 255, 100);
  noFill();
  strokeWeight(2);

  for (int r = 150; r <= 600; r += 150) {
    arc(0, 0, r, r, PI, TWO_PI);
  }

  line(-300, 0, 300, 0);

  for (int a = 0; a <= 180; a += 30) {
    float x = 300 * cos(radians(a));
    float y = -300 * sin(radians(a));
    line(0, 0, x, y);
  }

  strokeWeight(3);
  float sx = 300 * cos(radians(angle));
  float sy = -300 * sin(radians(angle));

  line(0, 0, sx, sy);
}

void drawDetection() {
  if (distance > 0 && distance <= maxDistance) {
    float r = map(distance, 0, maxDistance, 0, 600);

    float x = r * cos(radians(angle));
    float y = -r * sin(radians(angle));

    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, 10, 10);
  }
}

void drawInfo() {
  resetMatrix();

  fill(0, 255, 100);
  textSize(20);

  text("SONAR-X RADAR SYSTEM", 30, 35);
  text("Angle: " + angle + " deg", 30, 70);
  text("Distance: " + distance + " cm", 30, 100);
}
