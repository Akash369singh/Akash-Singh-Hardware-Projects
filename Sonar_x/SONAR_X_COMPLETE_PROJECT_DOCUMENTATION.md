# SONAR-X
## Complete Project Documentation
### Arduino-Based Ultrasonic Radar System

**Project Category:** Embedded Systems | Robotics | Sensor Interfacing | Real-Time Visualization  
**Hardware Platform:** Arduino UNO  
**Programming Languages:** C/C++ (Arduino), Java (Processing)  
**Sensor:** HC-SR04 Ultrasonic Distance Sensor  
**Actuator:** SG90 Servo Motor  

---

# 1. Project Introduction

SONAR-X is an Arduino-based ultrasonic radar system designed to detect objects and measure their distance within a scanning area.

The system uses an HC-SR04 ultrasonic sensor mounted on an SG90 servo motor. The servo rotates the sensor across an angular range of approximately 0° to 180°. At different angles, the ultrasonic sensor measures the distance of objects in front of it.

An Arduino UNO controls the servo motor, triggers the ultrasonic sensor, measures the returning echo time, and calculates the distance of detected objects.

The Arduino sends the angle and distance measurements to a computer through USB serial communication. A Java-based Processing application receives this data and displays it through a radar-style graphical interface.

The result is a real-time scanning visualization that shows the direction and approximate distance of detected objects.

## 1.1 Main Objectives

- Understand ultrasonic distance measurement.
- Learn Arduino sensor interfacing.
- Control a servo motor using PWM-based servo signals.
- Implement serial communication between Arduino and a computer.
- Develop a radar-style graphical interface using Processing.
- Understand the integration of hardware and software.
- Explore the fundamentals of robotics and object detection.

# 2. Overall Project Architecture

SONAR-X is divided into three major systems:

1. Hardware System
2. Embedded Control System
3. Computer Visualization System

### 2.1 Hardware System

The physical hardware consists of:

- Arduino UNO
- HC-SR04 Ultrasonic Sensor
- SG90 Servo Motor
- Jumper Wires
- External regulated 5V, 2A power supply for the servo

### 2.2 Embedded Control System

The Arduino program performs the following operations:

- Initializes the ultrasonic sensor pins.
- Initializes the servo motor.
- Rotates the servo through different angles.
- Sends ultrasonic trigger pulses.
- Measures echo pulse duration.
- Calculates object distance.
- Sends angle and distance data to the computer.

### 2.3 Computer Visualization System

The Processing application:

- Opens the Arduino serial port.
- Receives angle and distance measurements.
- Separates the incoming angle and distance values.
- Converts polar coordinates into screen coordinates.
- Displays detected points on a radar interface.
- Updates the display as new measurements arrive.

# 3. Complete Component Explanation

## Component 1: Arduino UNO

### Purpose

Arduino UNO acts as the main controller or brain of the SONAR-X project.

It coordinates the operation of the ultrasonic sensor and servo motor.

### Main Responsibilities

1. Controls the servo motor.
2. Generates the ultrasonic trigger signal.
3. Reads the echo signal.
4. Measures the echo duration.
5. Calculates the distance.
6. Sends measurement data to the computer.

### Important Technical Specifications

For a classic Arduino UNO R3:

| Specification | Value |
|---|---|
| Microcontroller | ATmega328P |
| Operating Voltage | 5V |
| Clock Speed | 16 MHz |
| Digital I/O Pins | 14 |
| PWM Pins | 6 |
| Analog Inputs | 6 |
| Flash Memory | 32 KB |
| SRAM | 2 KB |
| EEPROM | 1 KB |

### Pins Used in SONAR-X

| Arduino Pin | Connected Component | Purpose |
|---|---|---|
| D9 | SG90 Signal | Servo control |
| D10 | HC-SR04 TRIG | Trigger pulse |
| D11 | HC-SR04 ECHO | Echo measurement |
| 5V | HC-SR04 VCC | Sensor power |
| GND | HC-SR04 GND | Common ground |

### How Arduino Works in This Project

The Arduino first positions the servo at a particular angle.

It then generates a 10-microsecond HIGH pulse on the TRIG pin. The ultrasonic sensor transmits an ultrasonic burst.

When the transmitted sound reflects from an object, the sensor generates an ECHO pulse.

Arduino measures the duration of this pulse and calculates the distance.

The measured angle and distance are transmitted through USB serial communication.

---

## Component 2: HC-SR04 Ultrasonic Sensor

### Purpose

The HC-SR04 is used to measure the distance between the sensor and an object.

It works using ultrasonic sound waves, which are sound waves with a frequency higher than the normal human hearing range.

### Main Parts

The sensor has four pins:

| Pin | Function |
|---|---|
| VCC | 5V power supply |
| TRIG | Trigger input |
| ECHO | Echo output |
| GND | Ground |

It also has two circular transducers:

- Transmitter: Sends ultrasonic waves.
- Receiver: Receives reflected ultrasonic waves.

### Working Principle

The HC-SR04 uses the Time-of-Flight (ToF) principle.

The process is:

1. Arduino sends a trigger pulse.
2. The sensor transmits an ultrasonic burst of approximately 40 kHz.
3. The sound waves travel through the air.
4. The waves strike an object.
5. The waves reflect back towards the sensor.
6. The receiver detects the reflected waves.
7. The ECHO pin remains HIGH for a duration related to the round-trip travel time.
8. Arduino calculates the distance.

### Distance Calculation

The distance is calculated using:

`Distance = Speed × Time`

However, the ultrasonic wave travels to the object and returns to the sensor. Therefore, the measured time represents a round trip.

The actual distance is:

`Distance = (Speed of Sound × Echo Time) / 2`

At approximately 20°C, the speed of sound is around 343 m/s or 0.0343 cm/µs.

Therefore:

`Distance (cm) = Echo Duration (µs) × 0.0343 / 2`

### Example

Suppose the measured echo duration is 1000 microseconds.

Distance:

`= 1000 × 0.0343 / 2`

`= 17.15 cm`

Therefore, the object is approximately 17.15 cm away from the sensor.

### Limitations

- It cannot identify the material or name of an object.
- It cannot generate a camera-like image.
- Soft materials may absorb ultrasonic waves.
- Angled or irregular surfaces may reflect sound away from the receiver.
- Multiple objects within its acoustic beam can affect the measurement.
- Its detection range and accuracy depend on the environment and target.

---

## Component 3: SG90 Servo Motor

### Purpose

The SG90 servo motor rotates the HC-SR04 sensor across different directions.

Without the servo, the sensor would measure distance in only one fixed direction.

The servo makes angular scanning possible.

### Main Parts

A typical SG90 contains:

1. DC motor
2. Gear mechanism
3. Potentiometer
4. Control circuit
5. Output shaft

### Working Principle

The SG90 is a position-controlled motor.

Arduino sends control pulses to the servo signal wire.

The servo's internal control circuit compares the requested position with its actual position and rotates the motor accordingly.

The servo can typically operate across approximately 0° to 180°, although the actual range varies between models.

### Three Wires

| Wire | Purpose |
|---|---|
| Brown/Black | GND |
| Red | +5V |
| Orange/Yellow | Signal |

### Role in SONAR-X

The servo moves the ultrasonic sensor through different angles.

For example:

- At 0°, the sensor faces one side.
- At 45°, the sensor faces diagonally.
- At 90°, the sensor faces forward.
- At 135°, the sensor faces the opposite diagonal.
- At 180°, the sensor faces the other side.

At each position, Arduino takes a distance measurement.

### Power Requirement

The servo is powered using a separate regulated 5V, 2A supply in this project.

The external supply's ground must be connected to Arduino GND.

The servo's signal wire remains connected to Arduino D9.

The servo's external positive supply must not be connected directly to the Arduino 5V pin in this wiring arrangement.

---

## Component 4: Jumper Wires

### Purpose

Jumper wires create electrical connections between the Arduino, sensor, servo motor, and external power supply.

They carry power signals, control signals, and ground connections.

### Types

| Type | Description |
|---|---|
| Male-to-Male | Male pins at both ends |
| Male-to-Female | One male and one female end |
| Female-to-Female | Female sockets at both ends |

### Role in SONAR-X

Jumper wires establish:

- Arduino-to-sensor connections.
- Arduino-to-servo signal connection.
- External supply-to-servo power connection.
- Common ground between Arduino and external supply.

### Important Concept: Common Ground

Arduino and the external servo power supply must share a common ground.

This provides a common voltage reference for the servo control signal.

Without a common ground, the servo may behave unpredictably or fail to respond correctly.

# 4. Complete Circuit Connections

## 4.1 HC-SR04 Connections

| HC-SR04 | Arduino UNO |
|---|---|
| VCC | 5V |
| TRIG | D10 |
| ECHO | D11 |
| GND | GND |

## 4.2 SG90 Connections

| SG90 Wire | Connection |
|---|---|
| Orange/Yellow | Arduino D9 |
| Red | External regulated 5V |
| Brown/Black | External supply GND |

## 4.3 Common Ground Connection

Connect:

- External power supply GND to Arduino GND.
- Servo GND to external power supply GND.
- HC-SR04 GND to Arduino GND.

All grounds must share a common reference.

## 4.4 Power Distribution

The power arrangement is:

- Arduino UNO receives power through USB.
- HC-SR04 receives 5V from Arduino.
- SG90 receives power from the external regulated 5V supply.
- Arduino and external supply share GND.

**Important:** Never connect the external supply's positive terminal to Arduino 5V while using this separate-supply arrangement. Verify the supply polarity before connecting it.

# 5. Complete System Block Diagram

```text
                  COMPUTER
                     |
                     | USB Serial Communication
                     |
                ARDUINO UNO
                     |
          +----------+----------+
          |                     |
          |                     |
      HC-SR04                SG90 SERVO
   Ultrasonic Sensor             |
          |                      |
          |                      |
   Distance Measurement     Angular Rotation
          |                      |
          +----------+-----------+
                     |
              Arduino Processing
               of Measurements
                     |
              Serial Data Output
                     |
                     |
              PROCESSING IDE
                (Java Program)
                     |
              Data Interpretation
                     |
              Radar Visualization
                     |
               SONAR-X DISPLAY
```

# 6. How the Complete Project Works

The complete operation takes place in the following sequence.

### Step 1: System Initialization

When Arduino starts:

- Serial communication begins at 9600 baud.
- Trigger and echo pins are configured.
- Servo motor is attached to D9.
- Servo moves to its starting position.

### Step 2: Servo Rotation

Arduino commands the servo to rotate from 0° to 180°.

The scan uses 2-degree increments in the current Arduino program.

### Step 3: Ultrasonic Measurement

At every servo position:

- Arduino sends a trigger pulse.
- HC-SR04 transmits ultrasonic waves.
- The reflected signal is received.
- Arduino measures the echo pulse duration.

### Step 4: Distance Calculation

Arduino calculates the distance using the Time-of-Flight equation.

If no echo is received before the timeout, the measurement is treated as invalid.

### Step 5: Serial Data Transmission

Arduino sends two values:

- Angle
- Distance

The current data format is:

```text
ANGLE,DISTANCE
```

Example:

```text
0,45.2
2,43.8
4,41.5
6,39.7
8,37.2
10,35.6
```

Each line represents one measurement.

### Step 6: Processing Receives Data

The Processing application reads the serial data from Arduino.

It separates the two values and updates the radar visualization.

### Step 7: Radar Display

Processing converts the measured angle and distance into graphical coordinates.

The detected positions are displayed as points on the radar interface.

### Step 8: Continuous Scanning

After reaching 180°, the servo scans back towards 0°.

This cycle continues while the system is running.

# 7. Arduino Programming Logic

The Arduino program is responsible for controlling the complete hardware system.

Its major operations are:

1. Import Servo library.
2. Define sensor pins.
3. Define servo pin.
4. Initialize serial communication.
5. Configure input/output pins.
6. Rotate servo.
7. Trigger ultrasonic sensor.
8. Read echo duration.
9. Calculate distance.
10. Send data to Processing.

## 7.1 Important Arduino Functions

| Function | Purpose |
|---|---|
| `pinMode()` | Configures a pin |
| `digitalWrite()` | Sets a digital output HIGH or LOW |
| `digitalRead()` | Reads a digital input |
| `delay()` | Creates a delay in milliseconds |
| `delayMicroseconds()` | Creates a delay in microseconds |
| `pulseIn()` | Measures pulse duration |
| `Serial.begin()` | Starts serial communication |
| `Serial.print()` | Sends data without a new line |
| `Serial.println()` | Sends data followed by a new line |
| `radarServo.write()` | Commands the servo position |

## 7.2 Ultrasonic Measurement Function

The main measurement function performs these operations:

1. Sets TRIG LOW.
2. Waits for 2 microseconds.
3. Sets TRIG HIGH for 10 microseconds.
4. Sets TRIG LOW.
5. Measures the ECHO HIGH duration.
6. Converts the duration into distance.

The program uses a timeout of 30,000 microseconds to avoid waiting indefinitely for an echo.

# 8. Processing IDE and Java Visualization

## Purpose

Processing is used to create the computer-side radar interface.

It receives measurements from Arduino and represents them graphically.

Processing is based on Java and provides functions for drawing shapes, lines, text, and graphical interfaces.

## 8.1 Main Responsibilities

- Connect to the Arduino serial port.
- Receive serial data.
- Parse angle and distance.
- Convert polar coordinates into screen coordinates.
- Draw radar grid lines.
- Draw scanning indicators.
- Display detected points.
- Update the screen continuously.

## 8.2 Serial Communication

The Arduino and Processing programs must use the same baud rate.

Current project setting:

`9600 baud`

The Arduino sends:

`angle,distance`

For example:

`90,35.5`

Processing interprets:

- Angle = 90°
- Distance = 35.5 cm

**Important:** The Arduino Serial Monitor must be closed before Processing opens the same serial port. Usually, only one application can use that serial port at a time.

The serial port name may change when the board is reconnected. Select the currently available Arduino port in Processing.

## 8.3 Polar to Cartesian Coordinate Conversion

The sensor measures objects using angle and distance.

However, the computer screen uses X and Y coordinates.

Therefore, Processing converts polar coordinates into Cartesian coordinates.

Mathematical equations:

`x = centerX + distance × cos(angle)`

`y = centerY - distance × sin(angle)`

The distance must first be scaled into screen pixels.

For example:

`screenDistance = measuredDistance × scaleFactor`

Then:

`x = centerX + screenDistance × cos(angle)`

`y = centerY - screenDistance × sin(angle)`

This allows Processing to plot a measurement at the correct approximate position on the radar display.

# 9. Understanding the Radar Display

The radar display is a graphical representation of the sensor measurements.

Its major elements can include:

| Element | Meaning |
|---|---|
| Radar arcs | Distance reference levels |
| Angular lines | Scanning directions |
| Scanning line | Current servo angle |
| Red points | Detected measurement positions |
| Distance labels | Approximate distance scale |
| Center point | Sensor position |

The radar display does not directly capture the shape of an object.

It displays measured distance points at different angles.

## Important Detection Limitation

The HC-SR04 has a relatively broad acoustic beam.

It returns a distance measurement, not a detailed image of everything in front of it.

Therefore:

- A large object may generate several nearby measurement points.
- A small object may generate only a few points.
- An angled surface may return an incorrect or missing echo.
- Two objects within the same acoustic beam may affect the same measurement.
- The 2-degree servo increment does not guarantee 2-degree independent spatial resolution.

The displayed points represent sensor measurements, not the exact physical boundary or area of an object.

# 10. Complete Software and Hardware Data Flow

```text
Arduino Starts
      |
      v
Initialize Sensor and Servo
      |
      v
Set Servo Angle
      |
      v
Send Ultrasonic Trigger Pulse
      |
      v
Receive Echo Signal
      |
      v
Measure Echo Duration
      |
      v
Calculate Distance
      |
      v
Create Angle + Distance Data
      |
      v
Send Through USB Serial
      |
      v
Processing Reads Data
      |
      v
Separate Angle and Distance
      |
      v
Convert Polar Coordinates
      |
      v
Plot Detection Point
      |
      v
Update Radar Display
      |
      v
Continue Scanning
```

# 11. Project Testing Procedure

Testing should be performed in stages.

## Test 1: Arduino UNO

- Connect Arduino to the computer.
- Upload a simple Blink sketch.
- Verify that the board is working.

## Test 2: HC-SR04

- Connect the sensor to 5V, GND, D10 and D11.
- Upload a standalone ultrasonic test program.
- Place an object in front of the sensor.
- Check whether the measured distance changes.

## Test 3: SG90 Servo

- Connect the servo signal to D9.
- Connect its power to the external 5V supply.
- Establish common ground.
- Upload a servo test program.
- Check movement at different angles.

## Test 4: Combined Hardware

- Connect the sensor and servo together.
- Upload the main Arduino program.
- Observe whether distance measurements change as the servo rotates.

## Test 5: Processing Visualization

- Close Arduino Serial Monitor.
- Open Processing.
- Select the correct Arduino serial port.
- Run the Processing sketch.
- Check whether the radar display updates continuously.

# 12. Common Problems and Troubleshooting

| Problem | Possible Cause | Solution |
|---|---|---|
| Servo does not rotate | Incorrect wiring | Check signal, power and ground |
| Arduino resets | Servo power disturbance | Use a suitable separate 5V supply |
| Distance shows zero | No valid echo or invalid-data handling | Check sensor wiring and target |
| Distance is unstable | Reflections or electrical noise | Improve mounting and measurement stability |
| Processing shows no data | Wrong serial port | Select the current Arduino port |
| Processing does not connect | Serial Monitor is open | Close Serial Monitor |
| Radar points appear misplaced | Incorrect coordinate conversion | Verify angle units and coordinate equations |
| Servo jitters | Insufficient power or mechanical load | Check supply and mounting |
| Some objects are missed | Weak or angled ultrasonic reflection | Change target orientation and test conditions |

# 13. Technical Limitations

SONAR-X is an educational ultrasonic scanning system.

It is not equivalent to a professional LiDAR or camera-based object detection system.

Its limitations include:

1. Limited ultrasonic detection range.
2. Broad acoustic beam.
3. No object classification.
4. No colour or texture detection.
5. No exact object boundary reconstruction.
6. Possible measurement errors due to environmental conditions.
7. Limited scanning speed due to servo movement and sensor measurement time.
8. Possible interference from nearby reflective surfaces.

# 14. Applications and Learning Outcomes

### Possible Applications

- Basic obstacle detection demonstrations.
- Robotics learning projects.
- Ultrasonic sensor experimentation.
- Embedded systems demonstrations.
- Distance measurement experiments.
- Radar visualization demonstrations.
- Learning serial communication and coordinate conversion.

### Engineering Concepts Learned

| Domain | Concepts |
|---|---|
| Electronics | Voltage, current, ground, power distribution |
| Embedded Systems | Microcontroller programming |
| Sensors | Ultrasonic sensing and Time-of-Flight |
| Actuators | Servo motor position control |
| Programming | Arduino C/C++ and Java |
| Communication | USB serial communication |
| Mathematics | Trigonometry and coordinate conversion |
| Robotics | Angular scanning and obstacle detection |
| Visualization | Real-time graphical representation |

# 15. Final Project Summary

SONAR-X combines electronics, embedded programming, ultrasonic sensing, motor control, serial communication, and graphical visualization into one integrated project.

The HC-SR04 measures the distance of objects using reflected ultrasonic waves.

The SG90 servo rotates the sensor through different angular positions.

The Arduino UNO coordinates both components, calculates distances, and sends measurement data to a computer.

Processing receives this data and converts the measurements into a radar-style visualization.

This project demonstrates how individual electronic components can work together as a complete embedded sensing system.

---

# 16. Project Component Checklist

- [x] Arduino UNO
- [x] HC-SR04 Ultrasonic Sensor
- [x] SG90 Servo Motor
- [x] Jumper Wires
- [x] External regulated 5V, 2A servo supply
- [x] Arduino IDE
- [x] Processing IDE
- [x] USB Serial Communication
- [x] Radar Visualization

**Project Name:** SONAR-X  
**Project Type:** Arduino-Based Ultrasonic Radar System  
**Documentation:** Complete Project Overview  
**Purpose:** Learning and demonstrating embedded sensing, scanning, and real-time visualization.