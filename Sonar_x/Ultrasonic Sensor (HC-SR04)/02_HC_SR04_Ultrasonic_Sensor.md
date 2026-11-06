
# COMPONENT 02 — HC-SR04 ULTRASONIC SENSOR

**Project:** SONAR-X — Arduino-Based Ultrasonic Radar System  
**Component Number:** 02  
**Component Name:** HC-SR04 Ultrasonic Distance Sensor  
**Category:** Active Distance Measurement Sensor  
**Primary Function:** Non-contact distance measurement  
**Interface:** Digital Trigger and Echo  
**Operating Principle:** Ultrasonic Time of Flight (ToF)

---

# 1. Introduction

The HC-SR04 is an ultrasonic distance measurement module used to detect objects and estimate their distance without physical contact.

It works by transmitting high-frequency ultrasonic sound waves and measuring the time required for the reflected waves to return.

The sensor contains two main ultrasonic transducers:

1. Ultrasonic Transmitter
2. Ultrasonic Receiver

The transmitter generates ultrasonic pulses, while the receiver detects the reflected sound waves.

In the SONAR-X project, the HC-SR04 is mounted on an SG90 servo motor.

The servo rotates the sensor across different angular positions. At each position, the Arduino UNO measures the distance of the nearest detectable reflecting object within the sensor's effective beam.

By combining angle and distance measurements, SONAR-X creates a two-dimensional radar-style visualization.

---

# 2. Full Form and Meaning

HC-SR04 is the model designation of this commonly used ultrasonic ranging module.

**Ultrasonic:** Sound waves with frequencies above the normal human hearing range (approximately 20 kHz).

The HC-SR04 operates at approximately 40 kHz.

Humans generally cannot hear this frequency.

---

# 3. Technical Specifications

| Parameter | Typical Specification |
|---|---|
| Model | HC-SR04 |
| Sensor Type | Ultrasonic |
| Operating Voltage | 5V DC |
| Operating Current | Approximately 15 mA |
| Operating Frequency | 40 kHz |
| Measuring Range | Approximately 2 cm–400 cm |
| Measuring Angle | Approximately 15 degrees (nominal) |
| Trigger Input | 10 µs HIGH pulse |
| Output | Digital ECHO pulse |
| Interface | GPIO / Digital |
| Module Pins | 4 |
| Measurement Principle | Time of Flight |

**Important:** Actual performance depends on object shape, surface material, alignment, temperature, supply quality and surrounding acoustic conditions. The stated range is not guaranteed in every environment.

---

# 4. Physical Structure

The front side of the HC-SR04 contains two circular ultrasonic transducers.

### A. Transmitter

The transmitter produces ultrasonic sound waves at approximately 40 kHz.

It sends sound waves toward the surrounding environment.

### B. Receiver

The receiver detects the ultrasonic waves reflected from an object.

It converts the received acoustic energy into an electrical signal.

### C. Control Circuit

The module contains electronic circuitry that controls the transmission and reception process.

It generates the ECHO output pulse according to the measured round-trip travel time.

### D. Four Connection Pins

The module has four pins:

1. VCC
2. TRIG
3. ECHO
4. GND

---

# 5. Pin Configuration

| Pin | Name | Function |
|---|---|---|
| 1 | VCC | +5V power supply |
| 2 | TRIG | Trigger input |
| 3 | ECHO | Echo output |
| 4 | GND | Ground |

### Pin 1 — VCC

Connects to the 5V power supply.

It provides operating power to the sensor module.

### Pin 2 — TRIG

Receives a trigger signal from Arduino.

A HIGH pulse of at least 10 microseconds initiates a measurement cycle.

### Pin 3 — ECHO

Produces a HIGH pulse whose duration corresponds approximately to the ultrasonic wave's round-trip travel time.

Arduino measures this duration to calculate distance.

### Pin 4 — GND

Connects to the common ground of the circuit.

---

# 6. Working Principle

The HC-SR04 operates on the Time of Flight (ToF) principle.

Time of Flight is the time taken by a transmitted signal to travel to a target and return to the receiver.

### Step-by-Step Working

**Step 1: Trigger Signal**

Arduino sends a LOW-to-HIGH-to-LOW pulse to the TRIG pin.

The HIGH duration is approximately 10 microseconds.

**Step 2: Ultrasonic Transmission**

The sensor generates a burst of approximately eight ultrasonic cycles at 40 kHz.

**Step 3: Wave Propagation**

The ultrasonic wave travels through the air toward an object.

**Step 4: Reflection**

When the wave strikes a suitable object, some acoustic energy is reflected.

**Step 5: Echo Reception**

The receiver detects the reflected ultrasonic wave.

**Step 6: ECHO Pulse**

The module generates an ECHO signal.

The duration of its HIGH state represents the approximate round-trip travel time.

**Step 7: Distance Calculation**

Arduino measures the ECHO pulse duration and calculates the approximate distance.

---

# 7. Timing Diagram

The measurement cycle can be understood using three signals:

TRIG:
________|‾‾‾‾‾‾‾‾‾‾|________

TRANSMISSION:
            Ultrasonic burst
            ~40 kHz

ECHO:
____________|‾‾‾‾‾‾‾‾‾|______
             <------->

The ECHO HIGH duration represents the time taken by the ultrasonic wave to travel to the object and return.

A longer ECHO pulse generally means a greater distance.

---

# 8. Mathematical Distance Calculation

The distance is calculated using the speed of sound and the measured round-trip time.

Basic equation:

Distance = Speed × Time

However, the ultrasonic signal travels in two directions:

1. From sensor to object.
2. From object back to sensor.

Therefore:

Distance = (Speed of Sound × Echo Time) / 2

At approximately 20°C:

Speed of Sound ≈ 343 m/s

When time is measured in microseconds:

Distance (cm) = Echo Time (µs) × 0.0343 / 2

Simplified:

Distance (cm) ≈ Echo Time (µs) × 0.01715

### Practical Example

Suppose:

Echo Time = 1000 µs

Distance = (1000 × 0.0343) / 2

Distance = 17.15 cm

Therefore, the approximate distance between the sensor and the object is 17.15 cm.

### Another Example

Suppose:

Echo Time = 5000 µs

Distance = (5000 × 0.0343) / 2

Distance = 85.75 cm

The calculated distance is approximately 85.75 cm.

---

# 9. Ultrasonic Beam Angle and Detection Area

The HC-SR04 does not measure distance along an infinitely narrow straight line.

Its transmitter and receiver operate over a finite acoustic beam.

The nominal measuring angle is often specified as approximately 15 degrees, although actual beam response depends on the target and environment.

### Why Is This Important?

Consider placing a large object in front of the sensor.

The sensor may receive reflections from different parts of the object.

Similarly, a small object near the edge of the effective beam may produce a weak or inconsistent reflection.

Therefore:

- Detection is not equivalent to a single mathematical point.
- The nearest or strongest suitable reflection may determine the reported distance.
- Different objects can produce different echo strengths.
- The sensor cannot independently identify the object's shape or material.

### SONAR-X Application

The SG90 servo rotates the sensor.

At each angle, the system records:

- Servo angle
- Measured distance
- Measurement validity

These readings are sent to the computer.

The radar display uses the angular measurements to estimate the position of detected reflecting surfaces.

**Engineering limitation:** A single HC-SR04 and one rotating servo cannot reconstruct an exact camera-like object outline or physical area. It provides approximate two-dimensional range samples.

---

# 10. Arduino UNO Connections

| HC-SR04 Pin | Arduino UNO Pin |
|---|---|
| VCC | 5V |
| TRIG | D10 |
| ECHO | D11 |
| GND | GND |

### Circuit Operation

1. Arduino supplies 5V to the sensor.
2. D10 sends the trigger signal.
3. D11 receives the ECHO signal.
4. Arduino measures the ECHO duration.
5. The calculated distance is transmitted over serial communication.

---

# 11. Arduino Testing Code

The following standalone sketch tests the HC-SR04 without requiring the servo motor.

Filename:

HC_SR04_Test.ino

```cpp
const int trigPin = 10;
const int echoPin = 11;

void setup() {
  Serial.begin(9600);

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  Serial.println("HC-SR04 Sensor Test");
}

void loop() {

  // Send trigger pulse
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);

  digitalWrite(trigPin, LOW);

  // Measure echo duration
  long duration = pulseIn(echoPin, HIGH, 30000);

  if (duration == 0) {
    Serial.println("No valid echo detected");
  }
  else {

    // Calculate distance in centimeters
    float distance = duration * 0.0343 / 2.0;

    Serial.print("Distance: ");
    Serial.print(distance, 1);
    Serial.println(" cm");
  }

  delay(100);
}
```

---

# 12. Code Explanation

### A. Pin Declaration

const int trigPin = 10;
const int echoPin = 11;

These statements assign Arduino digital pins to the trigger and echo signals.

### B. Trigger Pulse

digitalWrite(trigPin, LOW);
delayMicroseconds(2);

digitalWrite(trigPin, HIGH);
delayMicroseconds(10);

digitalWrite(trigPin, LOW);

This generates the trigger pulse required to initiate an ultrasonic measurement.

### C. Echo Time Measurement

long duration = pulseIn(echoPin, HIGH, 30000);

The pulseIn() function measures the duration for which the ECHO pin remains HIGH.

The timeout is 30,000 microseconds.

If no valid pulse is detected before the timeout, the function returns zero.

### D. Distance Calculation

float distance = duration * 0.0343 / 2.0;

This converts the measured round-trip time into an approximate one-way distance.

### E. Serial Output

Serial.print(distance, 1);

Displays the distance with one digit after the decimal point.

---

# 13. Expected Serial Monitor Output

Example:

HC-SR04 Sensor Test

Distance: 20.5 cm
Distance: 20.4 cm
Distance: 20.6 cm
Distance: 20.5 cm
Distance: 20.7 cm

The values above are illustrative.

Actual measurements depend on the position and characteristics of the target object.

If no valid echo is received:

No valid echo detected

---

# 14. Factors Affecting Accuracy

### 1. Object Surface

Hard and flat surfaces generally produce stronger reflections than soft or irregular surfaces.

### 2. Object Angle

A surface tilted away from the sensor may reflect sound away from the receiver.

### 3. Temperature

The speed of sound changes with air temperature.

This can introduce distance calculation errors.

### 4. Environmental Noise

Other ultrasonic sources and acoustic reflections can interfere with measurements.

### 5. Minimum Distance

Objects placed too close to the sensor may fall within its minimum measuring distance.

### 6. Sensor Alignment

The transmitter and receiver should face the target correctly.

### 7. Multiple Reflections

Echoes may arrive from walls, furniture or other nearby objects.

This can cause misleading measurements.

---

# 15. Troubleshooting

| Problem | Possible Cause | Solution |
|---|---|---|
| Always reads 0 | No echo received | Check wiring and target |
| Distance fluctuates | Unstable reflections | Use filtering and repeated readings |
| Incorrect long distance | Wall or secondary reflection | Change sensor orientation |
| No serial output | Incorrect baud rate | Set Serial Monitor to 9600 |
| Sensor not responding | Incorrect power connection | Verify 5V and GND |
| Poor detection at angles | Weak reflected signal | Align sensor with the object |

---

# 16. Practical Testing Procedure

1. Connect VCC to Arduino 5V.
2. Connect GND to Arduino GND.
3. Connect TRIG to D10.
4. Connect ECHO to D11.
5. Upload HC_SR04_Test.ino.
6. Open Serial Monitor at 9600 baud.
7. Place a flat object approximately 20 cm in front of the sensor.
8. Observe the reported distance.
9. Repeat at approximately 50 cm and 100 cm.
10. Compare the measured distance with a ruler or measuring tape.

Record actual readings to evaluate measurement error.

---

# 17. Advantages

- Non-contact distance measurement.
- Low-cost sensing solution.
- Simple digital interface.
- Easy Arduino integration.
- Useful for robotics and obstacle detection.
- Does not depend on visible light.
- Suitable for basic range scanning.

---

# 18. Limitations

- Cannot identify object type.
- Cannot directly measure object width or height.
- Cannot produce an exact image of the environment.
- Performance depends on reflection characteristics.
- Limited angular resolution.
- May produce unreliable readings on soft or angled surfaces.
- Only one range measurement is obtained at a time.

---

# 19. Applications

- Obstacle avoidance robots.
- Parking assistance systems.
- Distance measurement devices.
- Water-level monitoring.
- Industrial proximity sensing.
- Robotics navigation.
- Automated measurement systems.
- Ultrasonic radar demonstrations.

---

# 20. Role in SONAR-X

The HC-SR04 is the primary distance-measuring component of SONAR-X.

It measures the distance of suitable reflecting objects at different angular positions as the SG90 servo rotates the sensor.

Arduino UNO combines the angle and distance readings and sends the information to the computer.

The computer then displays the measurements using the Processing-based radar interface.

### Complete Data Flow

HC-SR04
   ↓
Ultrasonic Wave Transmission
   ↓
Object Reflection
   ↓
Echo Reception
   ↓
Arduino Distance Calculation
   ↓
Angle + Distance Data
   ↓
Processing Radar Visualization

---

# 21. Engineering Conclusion

The HC-SR04 provides the distance-measurement capability of the SONAR-X radar system.

It converts ultrasonic time-of-flight information into approximate distance measurements.

When mounted on a servo motor, it can scan multiple angular positions and provide a sequence of spatial range measurements.

These measurements form the foundation of the SONAR-X radar visualization.

**Component Number:** 02  
**Component:** HC-SR04 Ultrasonic Sensor  
**Project:** SONAR-X  
**Function:** Non-contact Distance Measurement  
**Status:** Primary Sensing Unit
