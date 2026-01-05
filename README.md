
# Project Title

A brief description of what this project does and who it's for

Perfect — a **clean, professional README** will make this project look *serious* on GitHub and LinkedIn.
Below is a **ready-to-paste README.md** written at a **resume / recruiter / interviewer** level.

You can copy it **as-is** or tweak your name later.

---

# 🚦 FPGA-Based Traffic Light Controller with Pedestrian Request

**Target Board:** Digilent Basys 3 (Artix-7)
**Language:** VHDL
**Tools:** Vivado (Simulation + Synthesis)

---

## 📌 Project Overview

This project implements a **real-world traffic light controller** using a **Finite State Machine (FSM)** on an FPGA.
The system controls vehicle traffic lights and supports a **pedestrian crossing request** using a debounced push-button input.

The design mimics **real traffic systems** by safely servicing pedestrian requests only after completing the current traffic cycle.

---

## 🎯 Key Features

* FSM-based traffic light control (GREEN → YELLOW → RED)
* Pedestrian request button (BTNU)
* Hardware button debouncing
* Pedestrian crossing phase
* LED-based traffic light indication
* Seven-segment display countdown timer
* Fully synthesizable, board-tested design

---

## 🧠 System Behavior

1. Traffic lights cycle normally.
2. Pressing the **pedestrian button (BTNU)** registers a request.
3. The request is **latched** and safely served when traffic reaches RED.
4. During pedestrian phase:

   * Pedestrian LED turns ON
   * Countdown displayed on 7-segment display
5. System resumes normal traffic operation.

> ⚠️ Pedestrian requests do **not** interrupt traffic immediately — this ensures safety and deterministic behavior.

---

## 🔧 Hardware Mapping (Basys 3)

| Component         | Board Resource                          |
| ----------------- | --------------------------------------- |
| Clock             | 100 MHz onboard clock                   |
| Reset             | BTNC                                    |
| Pedestrian Button | BTNU                                    |
| Traffic LEDs      | LED0 (Green), LED1 (Yellow), LED2 (Red) |
| Pedestrian LED    | LED3                                    |
| Countdown Display | 4-digit Seven Segment                   |


---

## 🧩 Design Architecture

* **FSM Controller**
  Controls traffic states and pedestrian logic.

* **Debounce Module**
  Filters mechanical button noise to ensure reliable input.

* **Timer Module**
  Generates state-based countdown values.

* **Top Module**
  Integrates all components and maps FPGA I/O.

---

## 🧪 Simulation & Testing

* Functional simulation performed in Vivado
* Verified FSM transitions and pedestrian request handling
* Synthesized and tested on **real Basys 3 hardware**

---

## 🚀 How to Run

1. Open Vivado
2. Create a new RTL project
3. Add all `.vhd` files
4. Add `basys3.xdc` constraints
5. Set `top.vhd` as top module
6. Generate bitstream
7. Program the Basys 3 board

---

## 📈 Possible Enhancements

* Walk / Don’t Walk indicators
* Audible pedestrian signal
* Adaptive traffic timing
* Vehicle sensors
* UART-based traffic monitoring
