
# COMPONENT 03 — SG90 MICRO SERVO MOTOR

**Project:** SONAR-X — Arduino-Based Ultrasonic Radar System  
**Component Number:** 03  
**Component Name:** SG90 Micro Servo Motor  
**Category:** Electromechanical Actuator  
**Primary Function:** Angular positioning and rotational movement  
**Control Interface:** PWM-style servo control signal  
**Controller:** Arduino UNO  
**Application:** Ultrasonic sensor rotation

---

# 1. Introduction

The SG90 is a small, lightweight, position-controlled servo motor commonly used in robotics, RC models, automation and embedded systems.

Unlike a conventional DC motor, which continuously rotates when powered, a servo motor can move its output shaft to a commanded angular position.

In the SONAR-X project, the SG90 provides the mechanical scanning movement.

The HC-SR04 ultrasonic sensor is mounted on the servo motor using a suitable mounting arrangement.

The Arduino UNO sends position commands to the servo. The servo then rotates the ultrasonic sensor to different angular positions.

At each position, the HC-SR04 measures the distance of a reflecting object.

By combining the servo angle and ultrasonic distance, SONAR-X generates angular range measurements for its radar visualization.

### Main Responsibilities

1. Rotate the ultrasonic sensor.
2. Position the sensor at different angles.
3. Support forward and reverse scanning.
4. Maintain the commanded angular position.
5. Enable repeated distance measurements across a scanning region.

---

# 2. What Does SG90 Mean?

SG90 is a commonly used model designation for a micro servo motor.

It is available from different manufacturers and sellers. Therefore, specifications can vary between original TowerPro units and compatible clones.

The commonly sold SG90 is a miniature plastic-geared servo.

It generally provides approximately 180-degree positional movement, depending on the unit and its configured pulse range.

---

# 3. Technical Specifications

Typical specifications of a standard SG90 micro servo:

| Parameter | Typical Value |
|---|---|
| Model | SG90 |
| Motor Type | Brushed DC Motor |
| Gear Type | Plastic Gear Train |
| Control Type | Position Control |
| Operating Voltage | Approximately 4.8–6V |
| Nominal Supply | 5V |
| Angular Travel | Approximately 180° |
| Control Signal | Servo PWM-style pulses |
| Control Period | Approximately 20 ms |
| Operating Speed | Approximately 0.1–0.12 sec/60° at 4.8V |
| Stall Torque | Approximately 1.8 kg·cm at 4.8V |
| Weight | Approximately 9 g |
| Dimensions | Approximately 22.8 × 12.2 × 28.5 mm |
| Feedback | Internal Potentiometer |
| Gear Material | Plastic |
| Connections | 3 wires |

**Important:** These are common reference specifications, not guaranteed values for every SG90. Check the datasheet or markings of the actual servo being used.

---

# 4. External Structure

The SG90 consists of the following visible parts:

### A. Servo Housing

The plastic body protects the internal motor, gears, feedback mechanism and control electronics.

### B. Output Shaft

The output shaft is connected to the internal gear train.

It rotates to the commanded angular position.

### C. Servo Horn

A servo horn is a plastic attachment fixed to the output shaft.

Different horn shapes are commonly supplied:

- Single-arm horn
- Double-arm horn
- Circular horn
- Cross-shaped horn

In SONAR-X, the horn can be used to support a sensor mounting bracket.

### D. Three-Wire Cable

The servo generally has three wires:

1. Brown or Black — GND
2. Red — Positive Supply
3. Orange, Yellow or White — Signal

Wire colours can vary by manufacturer.

---

# 5. Internal Construction

An SG90 is an electromechanical system.

Its major internal elements include:

1. Brushed DC Motor
2. Reduction Gear Train
3. Potentiometer
4. Control Circuit
5. Output Shaft

### A. DC Motor

A small brushed DC motor produces rotational movement.

When electrical energy is supplied, the motor converts it into mechanical rotation.

However, the motor itself rotates much faster than the servo output shaft.

### B. Reduction Gear Train

The gear train reduces the motor's rotational speed and increases the available output torque.

It transfers movement from the small motor to the servo output shaft.

### C. Potentiometer

The potentiometer is mechanically connected to the output shaft.

It provides feedback about the current angular position.

### D. Control Circuit

The internal control circuit compares the commanded position with the feedback position.

It drives the motor in the required direction to reduce the position error.

### E. Output Shaft

The output shaft provides the final mechanical movement.

The servo horn is attached to this shaft.

---

# 6. Internal Working Principle

The SG90 uses a closed-loop position-control mechanism.

It does not simply apply power to a motor and allow it to rotate continuously.

Instead, it compares the commanded position with its current position.

### Step 1: Control Signal

Arduino generates a servo control pulse.

The pulse width represents the requested angular position.

### Step 2: Position Reference

The servo's internal controller interprets the pulse width as a target position.

### Step 3: Position Feedback

The internal potentiometer provides feedback about the current output shaft position.

### Step 4: Error Calculation

The control circuit compares the target position with the feedback position.

The difference is called position error.

Position Error = Target Position - Actual Position

### Step 5: Motor Movement

The control circuit energizes the DC motor in the required direction.

The gear train transfers the motor's movement to the output shaft.

### Step 6: Position Reached

When the output shaft approaches the commanded position, the position error decreases.

The motor stops or reduces its drive to maintain the target position.

This is the basic closed-loop control mechanism of a positional servo.

---

# 7. How Servo Control Signals Work

A hobby servo receives a repeating control pulse.

A common control period is approximately 20 milliseconds, corresponding to around 50 Hz.

The pulse width determines the target angular position.

Typical illustrative values:

| Pulse Width | Approximate Position |
|---|---|
| 1.0 ms | Near 0° |
| 1.5 ms | Near 90° |
| 2.0 ms | Near 180° |

The actual endpoints vary between servo units.

**Important:** A servo control signal is not the same as ordinary motor power control using a motor driver.

The signal tells the servo where to move. The servo's internal electronics control the motor.

---

# 8. Understanding Torque

Torque is the rotational force produced at the servo output shaft.

The commonly specified SG90 stall torque is approximately 1.8 kg·cm at 4.8V.

This is a torque unit commonly used in hobby servo specifications.

### Torque Formula

Torque = Force × Perpendicular Distance

For example, a torque of 1.8 kgf·cm corresponds approximately to:

1.8 × 9.80665 × 0.01

Torque ≈ 0.1765 N·m

This is a stall torque reference, not a recommended continuous operating load.

### Importance in SONAR-X

The servo must rotate:

- The HC-SR04 sensor
- The mounting bracket
- The connecting wires
- Any additional supported structure

A heavier assembly increases the required torque.

Therefore, the sensor should be mounted close to the servo's output shaft, with minimum unnecessary weight.

---

# 9. Speed and Angular Movement

Servo speed describes how quickly the output shaft can move through an angular distance.

A commonly quoted SG90 speed is around 0.1–0.12 seconds per 60 degrees at 4.8V.

Actual movement time depends on:

- Supply voltage
- Mechanical load
- Servo quality
- Movement distance
- Friction and mounting arrangement

In SONAR-X, the servo should be allowed enough time to reach its commanded position before the ultrasonic measurement is taken.

If the sensor is still moving, measurements can be associated with an incorrect angle or become unstable.

---

# 10. Pin Configuration

The SG90 has three connections.

| Wire | Function | Connection |
|---|---|---|
| Brown / Black | Ground | Common GND |
| Red | Positive Supply | Regulated external 5V |
| Orange / Yellow / White | Control Signal | Arduino D9 |

### A. GND

Connects to the negative terminal of the external power supply.

It must also share a common ground with Arduino UNO.

### B. VCC

Connects to a suitable regulated 5V supply.

The servo draws current depending on the mechanical load and movement.

### C. Signal

Receives the servo position-control signal from Arduino digital pin D9.

---

# 11. SG90 Connections in SONAR-X

| SG90 Wire | Connection |
|---|---|
| Brown / Black | External supply GND |
| Red | External regulated +5V |
| Orange / Yellow / White | Arduino D9 |

### Power Supply Arrangement

Arduino UNO:
Powered through computer USB.

HC-SR04:
VCC → Arduino 5V
GND → Arduino GND

SG90:
Red → External regulated +5V
Brown/Black → External supply GND
Signal → Arduino D9

Common Ground:
External supply GND → Arduino GND

**Critical Safety Note:**

Do not connect the external servo supply's positive 5V output directly to the Arduino 5V pin in this arrangement.

Do not power the servo from an Arduino digital pin.

A regulated 5V supply with sufficient current capacity is recommended. A 5V, 2A supply is a suitable practical supply choice for this small project, provided the wiring and connections are correct.

---

# 12. Arduino Programming

Arduino UNO can control the SG90 using the Servo library.

The Servo library generates the required control pulses.

It provides functions such as:

### attach()

Associates the servo object with an Arduino pin.

Example:

servo.attach(9);

### write()

Commands a target angular position.

Example:

servo.write(90);

### read()

Returns the last commanded angle.

Example:

int position = servo.read();

Note: read() reports the commanded position, not an independent measurement of the actual shaft position.

### detach()

Stops the Servo library from generating control pulses for that servo.

Example:

servo.detach();

---

# 13. Arduino Test Code

Filename: SG90_Servo_Test.ino

The following program tests the servo independently.

```cpp
#include <Servo.h>

Servo testServo;

const int servoPin = 9;

void setup() {
  Serial.begin(9600);

  testServo.attach(servoPin);

  Serial.println("SG90 Servo Test Started");
}

void loop() {

  // Move from 0 to 180 degrees
  for (int angle = 0; angle <= 180; angle += 5) {

    testServo.write(angle);

    Serial.print("Servo Angle: ");
    Serial.println(angle);

    delay(100);
  }

  delay(500);

  // Move from 180 to 0 degrees
  for (int angle = 180; angle >= 0; angle -= 5) {

    testServo.write(angle);

    Serial.print("Servo Angle: ");
    Serial.println(angle);

    delay(100);
  }

  delay(500);
}
```

### Expected Behaviour

1. Servo starts near 0 degrees.
2. It gradually moves towards 180 degrees.
3. It pauses briefly.
4. It returns towards 0 degrees.
5. The sequence repeats.

**Testing precaution:** If the servo buzzes, struggles or reaches a mechanical stop, disconnect power and check the commanded range. Do not force the shaft manually or repeatedly drive it against its mechanical limits.

---

# 14. Servo Angle Control Example

A simple example of moving the servo to selected positions:

```cpp
#include <Servo.h>

Servo myServo;

void setup() {
  myServo.attach(9);
}

void loop() {

  myServo.write(0);
  delay(1000);

  myServo.write(45);
  delay(1000);

  myServo.write(90);
  delay(1000);

  myServo.write(135);
  delay(1000);

  myServo.write(180);
  delay(1000);
}
```

This example demonstrates position commands at five different angular positions.

---

# 15. Integration with SONAR-X

In SONAR-X, the servo and HC-SR04 operate together.

The servo rotates the ultrasonic sensor, while the Arduino measures the distance at each commanded position.

### Complete Working Sequence

1. Arduino commands the servo to move to an angle.
2. The servo begins rotating.
3. Arduino waits for the mechanical movement to settle.
4. Arduino triggers the HC-SR04.
5. The sensor measures the reflected ultrasonic signal.
6. Arduino calculates the distance.
7. Arduino sends the angle and distance to the computer.
8. The servo moves to the next position.
9. The sequence repeats.

### System Data Flow

Arduino UNO
    |
    | Servo Control Signal
    v
SG90 Servo Motor
    |
    | Mechanical Rotation
    v
HC-SR04 Sensor
    |
    | Distance Measurement
    v
Arduino UNO
    |
    | Angle + Distance
    v
Processing Radar Interface

---

# 16. Complete Arduino Integration Example

Filename: SONAR_X_Servo_Test.ino

This program demonstrates servo rotation and ultrasonic measurement together.

```cpp
#include <Servo.h>

const int trigPin = 10;
const int echoPin = 11;
const int servoPin = 9;

Servo radarServo;

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

void scanAtAngle(int angle) {

  radarServo.write(angle);

  // Allow servo to settle
  delay(80);

  float distance = getDistance();

  Serial.print(angle);
  Serial.print(",");

  if (distance < 0) {
    Serial.println("0");
  }
  else {
    Serial.println(distance, 1);
  }
}

void setup() {

  Serial.begin(9600);

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  radarServo.attach(servoPin);

  radarServo.write(90);
  delay(500);

  Serial.println("SONAR-X STARTED");
  Serial.println("ANGLE,DISTANCE");
}

void loop() {

  // Forward scan
  for (int angle = 0; angle <= 180; angle += 2) {
    scanAtAngle(angle);
  }

  // Reverse scan
  for (int angle = 180; angle >= 0; angle -= 2) {
    scanAtAngle(angle);
  }
}
```

### Important Code Details

- `Servo.h` provides servo control.
- `radarServo.attach(9)` assigns the signal pin.
- `radarServo.write(angle)` commands the target position.
- `delay(80)` gives the servo time to settle.
- `getDistance()` measures the ultrasonic echo duration.
- `scanAtAngle()` combines the angular position and distance measurement.
- Serial output follows the `ANGLE,DISTANCE` format.

The 80 ms settling delay is an initial practical setting, not a guaranteed settling time for every load or servo. Adjust it after observing actual movement.

---

# 17. Important Servo Library Detail

On the classic Arduino UNO R3, the Servo library uses Timer1.

While a servo is attached, ordinary analogWrite() PWM functionality on pins 9 and 10 is unavailable.

Digital input/output operations on those pins still work normally.

In SONAR-X:

- D9 is used for servo control.
- D10 is used as the HC-SR04 trigger output.

Using D10 as a normal digital trigger pin is compatible with the Servo library.

---

# 18. Mechanical Mounting of HC-SR04

The ultrasonic sensor should be mounted securely on the servo horn or a suitable bracket.

### Mounting Requirements

1. Keep the sensor facing forward.
2. Align the two ultrasonic transducers horizontally.
3. Ensure that the servo horn is firmly attached.
4. Keep the sensor assembly lightweight.
5. Avoid interference between the sensor and surrounding wires.
6. Ensure that the sensor can rotate freely.
7. Prevent the mounting bracket from touching the servo housing.

### Why Alignment Matters

If the sensor is tilted or loosely mounted, its actual scanning direction may differ from the commanded servo angle.

This creates errors in the radar visualization.

---

# 19. Factors Affecting Servo Performance

### A. Supply Voltage

Insufficient voltage can cause weak movement, jitter or unexpected resets.

### B. Current Capacity

A servo may draw significantly more current during startup, movement or stall conditions.

### C. Mechanical Load

Excessive weight increases the torque requirement.

### D. Friction

Poor mounting or mechanical obstruction can restrict movement.

### E. Vibration

An unbalanced mounting arrangement can produce unwanted movement and unstable sensor readings.

### F. Control Timing

Measuring distance before the servo settles can associate a reading with an inaccurate angular position.

---

# 20. Troubleshooting

| Problem | Possible Cause | Solution |
|---|---|---|
| Servo does not move | Incorrect signal connection | Check D9 |
| Servo vibrates | Unstable supply or signal | Check supply and ground |
| Arduino restarts | Servo current demand | Use a separate regulated supply |
| Servo makes noise | Mechanical load or endpoint | Reduce load and adjust range |
| Incorrect angular position | Servo calibration variation | Verify actual angles |
| Radar measurements fluctuate | Sensor moving during measurement | Increase settling time |
| Servo gets hot | Overload or mechanical obstruction | Disconnect and inspect |

---

# 21. Advantages

- Small and lightweight.
- Easy Arduino integration.
- Simple position control.
- Built-in position feedback.
- Low-cost and widely available.
- Suitable for small robotics applications.
- Requires no external motor driver for basic operation.

---

# 22. Limitations

- Limited angular travel.
- Low torque compared with larger servos.
- Plastic gears can wear or break.
- Not suitable for heavy mechanical loads.
- Requires a stable power supply.
- Not designed for continuous rotation in its standard positional configuration.
- Actual position accuracy depends on the servo and mechanical setup.

---

# 23. Applications

- Ultrasonic radar projects.
- Obstacle scanning robots.
- Robotic arms.
- Camera pan-and-tilt systems.
- RC models.
- Small automation mechanisms.
- Sensor positioning systems.
- Educational embedded systems projects.

---

# 24. Future Improvements

Possible upgrades for SONAR-X include:

- Stronger metal-geared servo.
- Custom 3D-printed sensor mount.
- Improved mechanical alignment.
- Calibrated angular movement.
- Adaptive servo settling time.
- Multiple sensor mounting arrangements.
- Reduced vibration and improved cable management.

---

# 25. Engineering Conclusion

The SG90 micro servo motor provides the angular positioning mechanism of SONAR-X.

It converts electronic position commands from Arduino UNO into controlled mechanical rotation.

By mounting the HC-SR04 on the servo, the system can collect distance measurements across multiple angular positions.

The combined angle and distance data are transmitted to the computer for radar visualization.

The servo therefore acts as the mechanical scanning actuator of the project.

**Component Number:** 03  
**Component Name:** SG90 Micro Servo Motor  
**Project:** SONAR-X  
**Function:** Angular Positioning and Sensor Scanning  
**Status:** Mechanical Scanning Unit
