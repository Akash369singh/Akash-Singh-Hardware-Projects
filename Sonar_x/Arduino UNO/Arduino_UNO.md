
# COMPONENT 01 — ARDUINO UNO

**Project:** SONAR-X — Arduino-Based Ultrasonic Radar System  
**Component:** Arduino UNO  
**Category:** Microcontroller Development Board  
**Main Function:** Sensor data acquisition, signal processing and motor control  
**Documentation:** Hardware Component 01

---

## 1. Introduction

Arduino UNO is the main processing and control unit of the SONAR-X project.

It is a microcontroller development board designed for building electronic systems, automation projects, robotics and embedded applications.

In SONAR-X, Arduino UNO acts as the central controller. It receives distance measurements from the HC-SR04 ultrasonic sensor, controls the angular movement of the SG90 servo motor and transmits sensor readings to a computer through serial communication.

The computer receives these readings and displays the radar visualization.

### Main Responsibilities

1. Generate trigger signals for the ultrasonic sensor.
2. Receive echo signals from the HC-SR04.
3. Calculate the distance of detected objects.
4. Control the angular position of the servo motor.
5. Collect measurements at different angles.
6. Transmit angle and distance data to the computer.
7. Coordinate the complete radar scanning operation.

---

## 2. Hardware Identification

| Parameter | Specification |
|---|---|
| Board | Arduino UNO |
| Board Version | UNO R3 (if applicable) |
| Main Microcontroller | ATmega328P |
| Operating Voltage | 5V |
| Input Voltage (Recommended) | 7–12V |
| Clock Speed | 16 MHz |
| Digital I/O Pins | 14 |
| PWM Pins | 6 |
| Analog Input Pins | 6 |
| Flash Memory | 32 KB |
| SRAM | 2 KB |
| EEPROM | 1 KB |
| Communication | USB, UART, SPI, I2C |
| Programming Language | Arduino C/C++ |
| Programming Interface | Arduino IDE |

**Note:** These specifications describe the classic Arduino UNO R3. Verify the board revision if using a different UNO variant or compatible clone.

---

## 3. Internal Architecture

Arduino UNO R3 contains several important electronic sections.

### A. ATmega328P Microcontroller

The ATmega328P is the main microcontroller of the Arduino UNO R3.

It executes the uploaded program and controls the connected electronic components.

Its responsibilities include:

- Executing instructions.
- Reading digital input signals.
- Generating output signals.
- Performing mathematical calculations.
- Managing timing operations.
- Communicating with external devices.

### B. USB-to-Serial Interface

The USB interface allows the Arduino to communicate with a computer.

It is used for:

- Uploading programs.
- Serial communication.
- Debugging.
- Monitoring sensor readings.

### C. Voltage Regulation Circuit

The voltage regulation section helps provide appropriate operating voltages to the board.

The recommended input voltage through VIN or the barrel jack is generally 7–12V.

### D. Crystal Oscillator

The UNO R3 uses a 16 MHz clock source.

The clock controls the timing and execution of microcontroller operations.

### E. Digital and Analog I/O

These pins allow the Arduino to interface with external sensors, motors, LEDs and other electronic circuits.

---

## 4. Pin Configuration

### Digital Pins

Arduino UNO has 14 digital pins, numbered D0 to D13.

These pins can be configured as INPUT or OUTPUT.

Some digital pins also provide special functions:

- D0: RX (UART Receive)
- D1: TX (UART Transmit)
- D2–D3: External Interrupts
- D3, D5, D6, D9, D10, D11: PWM
- D10–D13: SPI functions
- D13: Built-in LED

### Analog Pins

Arduino UNO provides six analog input pins:

A0, A1, A2, A3, A4 and A5.

They are connected to the microcontroller's ADC.

The classic UNO R3 has a 10-bit ADC, giving 1024 possible digital levels (0–1023).

### Power Pins

| Pin | Function |
|---|---|
| VIN | External input voltage |
| 5V | Regulated 5V supply |
| 3.3V | 3.3V output |
| GND | Ground |
| RESET | Resets the microcontroller |
| IOREF | Logic reference voltage |

---

## 5. Role in SONAR-X

Arduino UNO connects the ultrasonic sensor and servo motor.

### Hardware Connections

| Arduino Pin | Connected Component | Function |
|---|---|---|
| D9 | SG90 Servo Signal | Servo position control |
| D10 | HC-SR04 TRIG | Trigger pulse |
| D11 | HC-SR04 ECHO | Echo pulse measurement |
| 5V | HC-SR04 VCC | Sensor power |
| GND | HC-SR04 GND | Ground |
| GND | External Servo Supply GND | Common ground |

The servo receives its power from a separate regulated 5V supply.

**Important:** The external servo supply's positive 5V wire must not be connected directly to the Arduino 5V pin. Connect the external supply ground to Arduino GND to establish a common reference.

---

## 6. How Arduino Controls the Radar

The working sequence is:

1. Arduino sends a trigger pulse to the HC-SR04.
2. The ultrasonic sensor transmits an ultrasonic burst.
3. The sensor receives the reflected signal.
4. Arduino measures the ECHO pulse duration.
5. The microcontroller calculates the approximate distance.
6. Arduino commands the servo to move to the next angle.
7. The measurement is repeated.
8. Angle and distance values are transmitted through USB serial communication.

### System Data Flow

HC-SR04 Sensor
       |
       | Echo Signal
       v
Arduino UNO
       |
       | Distance Calculation
       v
Servo Motor Control
       |
       | Angle + Distance
       v
Serial Communication
       |
       v
Computer
       |
       v
Radar Visualization

---

## 7. Distance Calculation

The HC-SR04 determines distance using the time taken by an ultrasonic pulse to travel to an object and return.

The basic formula is:

Distance = (Time × Speed of Sound) / 2

At approximately 20°C, the speed of sound in air is about 343 m/s.

When time is measured in microseconds:

Distance (cm) ≈ Echo Time (µs) × 0.0343 / 2

Example:

If the measured echo duration is 1000 microseconds:

Distance = (1000 × 0.0343) / 2

Distance = 17.15 cm

The division by 2 is necessary because the sound travels to the object and then returns to the sensor.

---

## 8. Arduino Programming

Arduino programs generally contain two main functions:

### setup()

The setup() function runs once when the board starts or resets.

It is used to:

- Initialize serial communication.
- Configure input and output pins.
- Initialize sensors and actuators.

### loop()

The loop() function runs repeatedly.

It is used to:

- Read sensor values.
- Perform calculations.
- Control connected hardware.
- Send data to the computer.

---

## 9. Basic Arduino Testing Code

Before connecting the complete radar system, test whether the Arduino is working correctly.

```cpp
void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600);

  Serial.println("SONAR-X Arduino Test Started");
}

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);
  Serial.println("Arduino is Running");

  delay(1000);

  digitalWrite(LED_BUILTIN, LOW);
  Serial.println("Arduino Test Active");

  delay(1000);
}
```

### Expected Output

The built-in LED on pin D13 should blink every second.

The Serial Monitor should display:

Arduino is Running
Arduino Test Active

This confirms that the board has successfully executed the uploaded program and can communicate through its serial interface.

---

## 10. Power Requirements and Safety

Arduino UNO can be powered through USB or an appropriate external input.

For SONAR-X:

- Arduino is connected to the computer through USB.
- HC-SR04 receives 5V from the Arduino.
- SG90 receives power from a separate regulated 5V supply.
- Arduino and servo supply grounds must be connected together.

### Electrical Precautions

1. Check the supply voltage before connecting components.
2. Never connect the servo motor directly to a digital output pin for power.
3. Do not exceed the recommended current for Arduino I/O pins.
4. Connect all required grounds together.
5. Avoid short circuits between 5V and GND.
6. Disconnect power before changing circuit connections.

---

## 11. Advantages

- Easy to program.
- Low-cost development platform.
- Large community support.
- Compatible with numerous sensors and actuators.
- Supports real-time control applications.
- Provides serial communication with computers.
- Suitable for educational robotics and embedded projects.

---

## 12. Limitations

- Limited RAM and processing capacity.
- Not suitable for complex image processing.
- Limited number of hardware peripherals.
- No built-in Wi-Fi or Bluetooth on the classic UNO R3.
- Not designed to directly power high-current motors.
- Requires an external computer for the SONAR-X radar visualization.

---

## 13. Future Improvements

Possible future upgrades include:

- Arduino Mega for additional I/O pins.
- ESP32 for wireless connectivity.
- Raspberry Pi for advanced processing.
- Multiple ultrasonic sensors for improved spatial coverage.
- Integration with a graphical monitoring dashboard.

---

## 14. Engineering Conclusion

Arduino UNO is the central control unit of SONAR-X.

It coordinates ultrasonic distance measurement, servo motor positioning and serial data transmission.

By combining these operations, the board enables the system to scan its surroundings at different angular positions and provide measurement data to the radar visualization software.

**Component Number:** 01  
**Component Name:** Arduino UNO  
**Project:** SONAR-X  
**Status:** Core Controller
