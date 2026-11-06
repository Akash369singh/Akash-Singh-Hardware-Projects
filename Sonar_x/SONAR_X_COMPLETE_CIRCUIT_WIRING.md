# SONAR-X – Complete Circuit Wiring & Connection Guide

## Arduino-Based Ultrasonic Radar System

**Project:** SONAR-X  
**Controller:** Arduino UNO  
**Ultrasonic Sensor:** HC-SR04  
**Servo Motor:** SG90  
**External Power Supply:** Regulated 5V, 2A  
**Communication:** USB Serial Communication  
**Purpose:** Complete hardware wiring and circuit assembly guide.

---

# 1. Components Required

| No. | Component | Quantity |
|---|---|---:|
| 1 | Arduino UNO | 1 |
| 2 | HC-SR04 Ultrasonic Sensor | 1 |
| 3 | SG90 Servo Motor | 1 |
| 4 | Jumper Wires | As required |
| 5 | Regulated 5V, 2A Power Supply | 1 |
| 6 | USB Cable for Arduino | 1 |
| 7 | Computer / Laptop | 1 |

**Note:** Is circuit ke liye breadboard compulsory nahi hai. Direct jumper wire connections bhi use kar sakte ho.

# 2. Understanding All Components and Their Pins

Before connecting the circuit, understand the pins of each component.

## 2.1 Arduino UNO

Arduino UNO is the main controller of SONAR-X.

The following pins are used:

| Arduino Pin | Purpose |
|---|---|
| D9 | Servo motor control signal |
| D10 | Ultrasonic sensor TRIG |
| D11 | Ultrasonic sensor ECHO |
| 5V | HC-SR04 power supply |
| GND | Common ground |

## 2.2 HC-SR04 Ultrasonic Sensor

HC-SR04 has four pins.

Look at the sensor with its two circular transducers facing towards you and the four pins pointing downwards.

The pin order is:

```text
       HC-SR04 SENSOR
    ___________________
   |                   |
   |   O           O   |
   |                   |
   |___________________|
       |   |   |   |
       V   T   E   G

       V   T   E   G
       C   R   C   N
       C   I   H   D
           G   O
```

| Pin | Full Name | Function |
|---|---|---|
| VCC | Voltage Common Collector | 5V power input |
| TRIG | Trigger | Receives trigger pulse |
| ECHO | Echo | Sends echo pulse |
| GND | Ground | Electrical ground |

## 2.3 SG90 Servo Motor

SG90 normally has three wires.

| Wire Colour | Pin | Function |
|---|---|---|
| Orange / Yellow | Signal | Receives control signal |
| Red | VCC | Receives +5V |
| Brown / Black | GND | Ground |

**Important:** Wire colours may vary between servo manufacturers. Verify the actual connector pinout before powering it.

# 3. Complete Circuit Connection Table

This table gives the exact connections for the complete SONAR-X circuit.

## 3.1 HC-SR04 to Arduino UNO

| HC-SR04 Pin | Jumper Wire Connection | Arduino UNO Pin |
|---|---|---|
| VCC | Wire 1 | 5V |
| TRIG | Wire 2 | Digital Pin D10 |
| ECHO | Wire 3 | Digital Pin D11 |
| GND | Wire 4 | GND |

### Wire-by-Wire Explanation

**Wire 1: HC-SR04 VCC to Arduino 5V**

- Take one jumper wire.
- Connect one end to the VCC pin of HC-SR04.
- Connect the other end to the 5V pin of Arduino UNO.
- This supplies 5V power to the ultrasonic sensor.

**Wire 2: HC-SR04 TRIG to Arduino D10**

- Take the second jumper wire.
- Connect one end to the TRIG pin of HC-SR04.
- Connect the other end to Arduino digital pin D10.
- Arduino uses this pin to send a trigger pulse to the sensor.

**Wire 3: HC-SR04 ECHO to Arduino D11**

- Take the third jumper wire.
- Connect one end to the ECHO pin of HC-SR04.
- Connect the other end to Arduino digital pin D11.
- Arduino reads the echo pulse through this pin.

**Wire 4: HC-SR04 GND to Arduino GND**

- Take the fourth jumper wire.
- Connect one end to the GND pin of HC-SR04.
- Connect the other end to Arduino GND.
- This completes the sensor's electrical ground connection.

---

## 3.2 SG90 Servo to Arduino UNO and External Power Supply

The SG90 has three wires, but its power and control connections are distributed between Arduino and the external supply.

| SG90 Wire | Connect To | Purpose |
|---|---|---|
| Orange / Yellow | Arduino D9 | Servo control signal |
| Red | External supply +5V | Servo power |
| Brown / Black | External supply GND | Servo ground |

### Wire-by-Wire Explanation

**Wire 5: SG90 Signal to Arduino D9**

- Locate the orange/yellow wire of the SG90.
- Connect it to Arduino digital pin D9.
- Arduino sends position-control pulses through this connection.
- This controls the rotation angle of the servo.

**Wire 6: SG90 Red Wire to External +5V**

- Locate the red wire of SG90.
- Connect it to the positive (+5V) terminal of the regulated external power supply.
- This supplies electrical power to the servo motor.

**Wire 7: SG90 Brown/Black Wire to External GND**

- Locate the brown/black wire of SG90.
- Connect it to the negative (GND) terminal of the external power supply.
- This completes the servo power circuit.

---

# 4. External Power Supply Connection

The SG90 servo can draw current that may disturb or overload the Arduino's onboard 5V supply.

Therefore, this project uses a separate regulated 5V, 2A supply for the servo.

### External Power Supply Terminals

```text
      EXTERNAL POWER SUPPLY
       __________________
      |                  |
      |    +5V     GND   |
      |     (+)    (-)   |
      |__________________|
```

### Connections

| Power Supply Terminal | Connect To |
|---|---|
| Positive (+5V) | SG90 Red Wire |
| Negative (GND) | SG90 Brown/Black Wire |
| Negative (GND) | Arduino UNO GND |

The external supply's GND and Arduino GND must be electrically connected.

# 5. Common Ground Connection

This is one of the most important connections in SONAR-X.

Arduino and the external servo power supply use separate positive power sources, but their ground references must be common.

### Common Ground Diagram

```text
                 ARDUINO UNO
                     |
                    GND
                     |
                     |
                     +--------------------+
                                          |
                                          |
                              EXTERNAL SUPPLY GND
                                          |
                                          |
                                      SG90 GND
```

### Why Is Common Ground Required?

Arduino sends a control signal to the SG90 through D9.

The servo needs a common ground reference to correctly interpret this signal.

Without common ground:

- Servo may not respond correctly.
- Servo may jitter.
- Servo may behave unpredictably.

**Remember:** Connect the external supply's negative terminal to Arduino GND. Do not connect its positive terminal to Arduino 5V in this separate-supply arrangement.

# 6. Complete Circuit Connection Overview

The complete circuit can be represented as follows:

```text
                 ARDUINO UNO
              __________________
             |                  |
             |              D9  |---------------- SG90 SIGNAL
             |                  |
             |             D10  |---------------- HC-SR04 TRIG
             |                  |
             |             D11  |---------------- HC-SR04 ECHO
             |                  |
             |              5V  |---------------- HC-SR04 VCC
             |                  |
             |             GND  |----------+----- HC-SR04 GND
             |__________________|          |
                                           |
                                           |
                                   EXTERNAL SUPPLY GND
                                           |
                                           |
                                       SG90 GND


          EXTERNAL REGULATED 5V SUPPLY
              __________________
             |                  |
             |             +5V  |---------------- SG90 RED
             |                  |
             |             GND  |---------------- SG90 BROWN
             |__________________|
```

# 7. Computer and Arduino USB Connection

The computer is required to upload the Arduino program and display the radar visualization.

### Connection

```text
       COMPUTER / LAPTOP
               |
               |
           USB CABLE
               |
               |
          ARDUINO UNO
```

### Software Communication

| Software | Purpose |
|---|---|
| Arduino IDE | Uploads the Arduino C/C++ program |
| Processing IDE | Runs the Java-based radar visualization |
| USB Serial | Transfers angle and distance measurements |

### Serial Configuration

| Parameter | Value |
|---|---|
| Baud Rate | 9600 |
| Data Format | angle,distance |
| Communication | USB Serial |

Example serial data:

```text
0,45.2
2,43.8
4,41.5
6,39.7
8,37.2
10,35.6
```

**Important:** Close Arduino Serial Monitor before starting the Processing application because both applications generally cannot use the same serial port simultaneously.

# 8. Step-by-Step Hardware Assembly

Follow this sequence to assemble the complete project.

## Step 1: Prepare Arduino UNO

- Place Arduino UNO on a flat surface.
- Keep the USB port accessible.
- Identify D9, D10, D11, 5V and GND.

## Step 2: Connect HC-SR04

Connect the four sensor pins:

```text
HC-SR04 VCC  -> Arduino 5V
HC-SR04 TRIG -> Arduino D10
HC-SR04 ECHO -> Arduino D11
HC-SR04 GND  -> Arduino GND
```

Check all four connections carefully.

## Step 3: Connect SG90 Signal

- Find the orange/yellow servo wire.
- Connect it to Arduino D9.

Do not connect the servo's red wire to Arduino 5V.

## Step 4: Connect External Servo Power

- Connect servo red wire to external +5V.
- Connect servo brown/black wire to external GND.

Ensure that the supply is regulated and its output polarity is correct.

## Step 5: Establish Common Ground

Connect:

```text
External Supply GND -> Arduino GND
```

The servo ground and external supply ground should already be connected.

## Step 6: Connect Arduino to Computer

- Connect Arduino UNO to the laptop using USB.
- Open Arduino IDE.
- Select the correct board and serial port.
- Upload the main SONAR-X Arduino sketch.

## Step 7: Start Processing

- Close Arduino Serial Monitor.
- Open `SONAR_X_Radar.pde`.
- Select the current Arduino serial port.
- Run the Processing sketch.

The radar visualization should now receive the sensor measurements.

# 9. Wire Colour Convention

You can use the following colour convention to make your circuit easier to understand.

| Wire Colour | Suggested Use |
|---|---|
| Red | +5V power |
| Black | GND |
| Yellow | Trigger signal |
| Blue | Echo signal |
| Orange | Servo signal |

These are suggested colours, not electrical requirements. The actual function depends on which pins you connect.

# 10. Jumper Wire Selection

| Connection | Suggested Wire |
|---|---|
| Arduino to HC-SR04 | Male-to-Female or suitable matching jumper |
| Arduino D9 to SG90 signal | Suitable jumper compatible with servo connector and Arduino header |
| External supply to servo | Suitable insulated wire or matching connector |
| External GND to Arduino GND | Suitable insulated jumper wire |

Select the connector type according to the actual header and connector on your components. Do not force a connector into a pin.

# 11. Safety Checklist Before Powering ON

- [ ] HC-SR04 VCC is connected to Arduino 5V.
- [ ] HC-SR04 TRIG is connected to D10.
- [ ] HC-SR04 ECHO is connected to D11.
- [ ] HC-SR04 GND is connected to Arduino GND.
- [ ] SG90 signal is connected to D9.
- [ ] SG90 red wire is connected to external +5V.
- [ ] SG90 brown/black wire is connected to external GND.
- [ ] External supply GND is connected to Arduino GND.
- [ ] External supply output is regulated 5V.
- [ ] No exposed wires are touching each other.
- [ ] External supply polarity has been verified.
- [ ] External +5V is not connected to Arduino 5V.

**Only switch on the external supply after checking every connection.**

# 12. Final Pin Mapping for Arduino Code

The Arduino program must use the same pin numbers as the physical circuit.

```cpp
const int trigPin = 10;
const int echoPin = 11;
const int servoPin = 9;
```

If you change the physical wiring, update these pin definitions accordingly.

# 13. Final Circuit Working

After completing the wiring:

1. Arduino UNO starts.
2. Arduino initializes the HC-SR04 and SG90.
3. Servo rotates the sensor from 0° to 180°.
4. HC-SR04 measures the distance at each position.
5. Arduino calculates distance from echo duration.
6. Arduino sends angle and distance through USB serial.
7. Processing receives the data.
8. Processing plots the measured points on the radar display.
9. Servo returns from 180° to 0°.
10. The scanning process repeats.

# 14. Final Connection Summary

| Component | Pin / Wire | Final Connection |
|---|---|---|
| HC-SR04 | VCC | Arduino 5V |
| HC-SR04 | TRIG | Arduino D10 |
| HC-SR04 | ECHO | Arduino D11 |
| HC-SR04 | GND | Arduino GND |
| SG90 | Signal | Arduino D9 |
| SG90 | Red | External +5V |
| SG90 | Brown/Black | External GND |
| External Supply | GND | Arduino GND |
| Arduino UNO | USB | Computer |

---

## Final Result

Once all connections are completed correctly, SONAR-X becomes a complete ultrasonic scanning system.

The Arduino UNO controls the sensor and servo motor, the HC-SR04 measures object distance, and the SG90 changes the scanning direction.

The Processing application receives the measurements and displays them as a real-time radar visualization.

**Project:** SONAR-X  
**System:** Arduino-Based Ultrasonic Radar  
**Hardware:** Arduino UNO + HC-SR04 + SG90 + Jumper Wires  
**Power:** USB for Arduino and sensor; external regulated 5V supply for servo.