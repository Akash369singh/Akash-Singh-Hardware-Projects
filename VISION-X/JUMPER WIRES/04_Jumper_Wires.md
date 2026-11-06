
# COMPONENT 04 — JUMPER WIRES

**Project:** SONAR-X — Arduino-Based Ultrasonic Radar System  
**Component Number:** 04  
**Component Name:** Jumper Wires  
**Category:** Electrical Interconnection Component  
**Primary Function:** Electrical signal and power transmission  
**Application:** Connecting Arduino UNO, HC-SR04 and SG90 Servo Motor

---

# 1. Introduction

Jumper wires are insulated electrical conductors used to establish temporary or semi-permanent electrical connections between electronic components.

They are commonly used in breadboard circuits, Arduino projects, robotics, embedded systems and electronic prototyping.

In the SONAR-X project, jumper wires connect the Arduino UNO to the HC-SR04 ultrasonic sensor and SG90 servo motor.

They provide electrical paths for:

1. Power supply.
2. Ground connections.
3. Digital trigger signals.
4. Echo signals.
5. Servo control signals.

Without these electrical connections, the individual hardware components cannot communicate or operate as a complete system.

---

# 2. Working Principle

A jumper wire works on the principle of electrical conduction.

It contains a conductive metal core, usually copper or a copper-based conductor, surrounded by an insulating material.

When connected between two electrical terminals, it provides a path through which electric current or electrical signals can travel.

### Basic Working

1. One end of the jumper wire connects to an electrical terminal.
2. The other end connects to another terminal.
3. The conductive core establishes an electrical path.
4. Current or electrical signals travel through the conductor.
5. The connected electronic components can exchange power or signals.

The wire itself does not process or modify data intentionally. Its main purpose is to provide electrical connectivity.

---

# 3. Types of Jumper Wires

Jumper wires are commonly available in three connector configurations.

## A. Male-to-Male (M-M)

Both ends contain exposed metal pins.

Applications:

- Connecting breadboard rows.
- Connecting Arduino headers to breadboards.
- Connecting electronic modules with female headers.

## B. Male-to-Female (M-F)

One end has a male pin and the other has a female socket.

Applications:

- Connecting Arduino header pins to modules with male pins.
- Connecting servo cables to compatible male-header connections.
- Connecting sensors with different connector types.

## C. Female-to-Female (F-F)

Both ends contain female sockets.

Applications:

- Connecting two male-header modules.
- Connecting compatible sensor and controller headers.
- Extending connections between modules with male pins.

**Important:** Select the wire type according to the actual connector on each component. Do not force an incompatible connector into a terminal.

---

# 4. Internal Construction

A typical jumper wire consists of the following parts:

### A. Conductive Core

The internal conductor is commonly made of copper or a copper-based material.

Copper is widely used because of its good electrical conductivity.

Its purpose is to carry current and electrical signals.

### B. Insulation

The conductor is covered with an insulating material, commonly PVC or another polymer.

The insulation helps prevent accidental electrical contact between neighbouring wires.

### C. Connector

The connector is attached to the end of the conductor.

It provides a physical electrical connection with a component or header.

### D. Connector Housing

The outer plastic housing supports and protects the connector.

It also helps maintain separation between neighbouring connections.

---

# 5. Electrical Properties

Jumper wires have electrical characteristics that affect circuit performance.

### A. Conductivity

Conductivity describes how easily a material allows electric current to flow.

Copper has high electrical conductivity, making it suitable for electronic wiring.

### B. Resistance

Every real wire has some electrical resistance.

The resistance depends on:

- Conductor material.
- Wire length.
- Cross-sectional area.
- Temperature.
- Connector quality.

The resistance of a uniform conductor can be estimated using:

R = ρ × L / A

Where:

R = Electrical resistance in ohms (Ω)

ρ = Resistivity of the conductor (Ω·m)

L = Conductor length (m)

A = Cross-sectional area (m²)

### C. Voltage Drop

When current passes through a wire with resistance, a voltage drop occurs.

V = I × R

Where:

V = Voltage drop

I = Current through the wire

R = Wire resistance

Excessive resistance or poor connections can cause voltage instability.

### D. Current Capacity

A jumper wire has a practical current-carrying limit.

It depends on conductor thickness, insulation, wire length, connector quality and operating conditions.

Thin prototype jumper wires should not be used for high-current loads.

---

# 6. Colour Coding

Jumper wires are often available in multiple colours.

Common conventions include:

| Colour | Common Usage |
|---|---|
| Red | Positive supply |
| Black | Ground |
| Brown | Ground or signal |
| Orange | Signal |
| Yellow | Signal |
| Green | Signal |
| Blue | Signal |

**Important:** Wire colours are conventions, not electrical guarantees. Always verify the actual connection rather than relying only on colour.

In SONAR-X, consistent colour coding makes troubleshooting easier.

---

# 7. Role in SONAR-X

Jumper wires establish the electrical connections between the major hardware components.

### Connection 1: Arduino to HC-SR04

| HC-SR04 Pin | Arduino UNO |
|---|---|
| VCC | 5V |
| TRIG | D10 |
| ECHO | D11 |
| GND | GND |

### Connection 2: Arduino to SG90

| SG90 Wire | Connection |
|---|---|
| Signal | Arduino D9 |
| Red | External regulated 5V |
| Brown / Black | External supply GND |

### Connection 3: Common Ground

External supply GND must connect to Arduino GND.

This creates a shared electrical reference for the servo control signal.

---

# 8. Understanding Common Ground

Common ground is an important concept in electronic circuits.

Digital signals are interpreted relative to a reference voltage.

When the Arduino and external servo power supply are used together, their grounds must be connected.

### Why Is Common Ground Required?

1. Arduino generates the servo control signal.
2. The servo receives that signal relative to its ground.
3. Both devices need a shared voltage reference.
4. Connecting their grounds establishes this reference.

Without a suitable common ground, the servo may not interpret the control signal reliably.

**Important:** Common ground does not mean connecting the positive outputs of two power supplies together.

---

# 9. Breadboard and Jumper Wire Connections

A breadboard is a prototyping board that allows components to be connected without soldering.

Jumper wires are used to establish connections between its internal contact strips.

### Typical Breadboard Connections

- Power rails distribute supply voltage and ground.
- Connected terminal groups provide electrical paths between inserted component leads.
- Jumper wires connect different rows and modules.

The exact internal connection arrangement depends on the breadboard model.

Before powering the circuit, check its connection layout.

---

# 10. Complete SONAR-X Wiring Table

The complete hardware connection arrangement is:

## Arduino UNO + HC-SR04

| Arduino UNO | HC-SR04 |
|---|---|
| 5V | VCC |
| D10 | TRIG |
| D11 | ECHO |
| GND | GND |

## Arduino UNO + SG90

| SG90 Wire | Connection |
|---|---|
| Orange / Yellow / White | Arduino D9 |
| Red | External regulated 5V |
| Brown / Black | External supply GND |

## Common Ground

| Connection | Purpose |
|---|---|
| Arduino GND | Reference ground |
| HC-SR04 GND | Sensor ground |
| External supply GND | Servo supply ground |

All three ground references must be connected together.

The servo's positive external supply should not be connected directly to the Arduino 5V rail in this arrangement.

---

# 11. Electrical Signal Transmission

Jumper wires carry different types of electrical signals in SONAR-X.

### A. Power Connection

The 5V supply connection powers the HC-SR04.

### B. Trigger Signal

The Arduino D10 pin sends a digital trigger pulse to the sensor.

### C. Echo Signal

The HC-SR04 sends an echo pulse to Arduino D11.

### D. Servo Control Signal

Arduino D9 sends position-control pulses to the SG90.

These signals travel through the connected jumper wires.

---

# 12. Practical Testing

Before connecting all components, jumper wires should be inspected and tested.

### Visual Inspection

Check for:

1. Damaged insulation.
2. Bent connector pins.
3. Loose female sockets.
4. Broken conductors.
5. Poorly attached connector ends.

### Continuity Test

A multimeter can be used to check electrical continuity.

Procedure:

1. Set the multimeter to continuity mode.
2. Touch one probe to one end of the wire.
3. Touch the second probe to the other end.
4. Check whether the meter indicates continuity.
5. Repeat for each wire.

A continuous wire should provide a low-resistance path.

**Safety:** Perform continuity testing only on disconnected, unpowered wires.

### Short-Circuit Test

Check that separate wires are not accidentally connected to each other.

This is especially important for 5V and GND connections.

---

# 13. Practical Resistance Calculation

Consider a hypothetical jumper wire with:

Length = 0.20 m

Conductor cross-sectional area = 0.10 mm²

Copper resistivity = 1.68 × 10⁻⁸ Ω·m

Convert area:

0.10 mm² = 1 × 10⁻⁷ m²

Using:

R = ρ × L / A

R = (1.68 × 10⁻⁸ × 0.20) / (1 × 10⁻⁷)

R = 0.0336 Ω

This is the approximate resistance of one conductor under the assumed conditions.

Actual jumper wire resistance can differ because of conductor composition, length, thickness and connector resistance.

---

# 14. Troubleshooting

| Problem | Possible Cause | Solution |
|---|---|---|
| Sensor not responding | Loose wire | Reconnect firmly |
| Servo not moving | Missing common ground | Connect supply GND to Arduino GND |
| Arduino resets | Supply or connection issue | Check power arrangement |
| Unstable sensor readings | Loose connections | Inspect TRIG and ECHO wires |
| Circuit not powering | Broken conductor | Test continuity |
| Heating wire | Excessive current or short circuit | Disconnect power and inspect |
| Intermittent operation | Loose female connector | Replace damaged wire |

---

# 15. Advantages

- Low-cost connection solution.
- Easy circuit modification.
- No soldering required for standard prototyping.
- Reusable.
- Available in different connector types.
- Suitable for Arduino and breadboard projects.
- Makes circuit testing easier.

---

# 16. Limitations

- Loose connections can cause intermittent faults.
- Thin wires are unsuitable for high-current applications.
- Connector quality varies.
- Not ideal for permanent industrial installations.
- Repeated bending may damage conductors.
- Poor wiring arrangement can introduce noise or accidental shorts.

---

# 17. Applications

- Arduino prototyping.
- Robotics.
- Embedded system development.
- Sensor interfacing.
- Breadboard circuits.
- Digital electronics experiments.
- Microcontroller development.
- Electronics laboratory testing.

---

# 18. Future Improvements

Possible wiring improvements for SONAR-X include:

- Use of a custom PCB.
- Proper wire-length management.
- Secure connectors.
- Cable sleeves.
- Labelled wiring.
- Soldered connections for permanent assemblies.
- Better power distribution.
- Dedicated connectors for sensor and servo modules.

---

# 19. Engineering Conclusion

Jumper wires provide the electrical interconnection infrastructure of SONAR-X.

They connect Arduino UNO, HC-SR04 and SG90, enabling power distribution and digital signal transmission.

Their electrical resistance, connector quality and physical condition can influence system reliability.

Correct wiring, proper grounding and careful polarity verification are essential for safe and stable operation.

**Component Number:** 04  
**Component Name:** Jumper Wires  
**Project:** SONAR-X  
**Function:** Electrical Interconnection  
**Status:** Circuit Connectivity Unit

