
#include <Servo.h>

// Pin Configuration
const int trigPin = 10;
const int echoPin = 11;
const int servoPin = 9;

// Servo Object
Servo radarServo;

// Distance Measurement Function
float getDistance() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  long duration = pulseIn(echoPin, HIGH, 30000);

  if (duration == 0) {
    return -1;
  }

  float distance = duration * 0.0343 / 2.0;

  return distance;
}

void setup() {
  Serial.begin(9600);

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  radarServo.attach(servoPin);

  radarServo.write(0);
  delay(500);

  Serial.println("SONAR-X STARTED");
  Serial.println("ANGLE,DISTANCE");
}

void loop() {

  // Forward Scan: 0 to 180 degrees
  for (int angle = 0; angle <= 180; angle += 2) {

    radarServo.write(angle);
    delay(25);

    float distance = getDistance();

    Serial.print(angle);
    Serial.print(",");
    
    if (distance < 0) {
      Serial.println("0");
    } else {
      Serial.println(distance, 1);
    }
  }

  // Reverse Scan: 180 to 0 degrees
  for (int angle = 180; angle >= 0; angle -= 2) {

    radarServo.write(angle);
    delay(25);

    float distance = getDistance();

    Serial.print(angle);
    Serial.print(",");

    if (distance < 0) {
      Serial.println("0");
    } else {
      Serial.println(distance, 1);
    }
  }
}
